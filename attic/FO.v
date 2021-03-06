Require Import Common. 
Require Import DList. 
Require Import Core. 

  
  (**  The compilation function itself *)
  (* exec : forall t (pointer : R t) (guard : expr R Bool) (effects : list effect), block t *)
  Definition compile (varunit : R Unit) t (a : action Phi R t) : ( block ). 
  refine (
      let compile := fix compile t (a  : action Phi R t ) {struct a}  :
                   (R t -> expr R Bool -> list effect -> block) -> block  :=  
          match a with 
            | Return t exp => _
            | Bind t u A F => _
            | Assert exp => _
            | Primitive args res p exprs => _
            | Try A => _
          end
      in _
    ). 
  (* return *)
  intros cont. 
  refine (binding _  (bind_expr _ exp) (fun X => (cont X (#b true) nil))). 
  (* bind *)
  intros cont. 
  refine (compile _ A  (fun pointerA guardA effectA => 
                           let B := F pointerA in 
                             compile _ B  (fun pointerB guardB effectB => 
                                              cont pointerB (andb guardA guardB) (List.app effectA effectB)
                                           )
                                                    
         )). 
  (* assert *)
  intros cont. 
  refine (binding _  (bind_expr _ exp) (fun X => cont varunit (!X)%expr nil)).   
  (* primitive *)
  revert exprs. 
  refine (match p with
            | register_read t v => _
            | register_write t v => _
            | regfile_read n t v p => _
            | regfile_write n t v p => _
          end); clear p; intros exprs cont.         
  (* register read *)
  refine (binding _  (bind_reg_read _ v)
                   (fun X => cont X (#b true)%expr nil)
         ). 
  (* register write *)
   eapply dlist_fold' in exprs. destruct exprs as [w _]. 
   refine (
       binding  _ (bind_expr _ w) 
               (fun X => 
                  let effects := ([effect_reg_write _ v X])%list in 
                  cont varunit (#b true)%expr effects
               )
     ). 
   auto. 
  (* register file read *)
  eapply dlist_fold' in exprs. simpl in exprs. destruct exprs as [adr _].  
  refine (
      binding _ (bind_expr _ adr) 
              (fun ADR => 
                  binding _ (bind_regfile_read _ _ v _ ADR)
                          (fun V => 
                             cont V (#b true)%expr nil
                          )
              )). 
  auto. 
  (* register file write *)
  eapply dlist_fold' in exprs. simpl in exprs. destruct exprs as [adr [w _]].  
  refine (
      binding _ (bind_expr _ adr) (fun ADR => 
                                       binding _ (bind_expr _ w)
                                               (fun W => 
                                                  let effects := ([effect_regfile_write _ _ v _ ADR W])%list in 
                                                  cont varunit (#b true)%expr  effects
)
                                    )
  ). 
  auto. 
  (* try *)
  intros cont. 
  refine (
      let block :=   compile _ A (fun _ guardA effectA => 
                                      let block := exec guardA effectA  in 
                                        block
                                   ) in 
        
        cont varunit (#b true) ([effect_block block])%list
             ). 
  (* conclusion *)
  eapply compile. apply a.  
  intros. eapply exec; auto.  
Defined. 

End t. 

(** * Semantics *)

Section sem. 

  Variable Phi : state. 
  Variable st : eval_state Phi. 
  Notation updates := (eval_env (option ∘ eval_sync) Phi). 
  Definition eval_bind t (b : bind Phi eval_type t) : option (eval_type t).
  refine (match b with
            | bind_expr x => Some (eval_expr _ x)
            | bind_reg_read v => Some  (get _ _ v st)
            | bind_regfile_read n v p adr => 
                let rf := get Phi (Tregfile n t) v st in
                  Regfile.get rf (Word.unsigned adr)                
          end
         ). 
  Defined. 
                                    
  Fixpoint eval_block (a : block Phi eval_type) {struct a}: updates -> option updates :=
    match a with
      | binding arg bind cont => 
          fun Delta => 
            do res <- eval_bind _ bind;
            eval_block (cont res) Delta
      | exec guard effects => 
        let fix  eval_effects (l : list (effect Phi eval_type)) : updates -> option updates :=
            match l with 
                | nil => fun Delta => Some Delta 
                | cons e q => fun Delta => 
                    match e with 
                      | effect_block b => eval_block  b Delta
                      | effect_reg_write t v w =>                                               
                          Core.Diff.add Phi Delta (Treg t) v w 
                      | effect_regfile_write  n t v p adr w  =>  
                          let rf := get Phi (Tregfile n t) v st in                          
                          let rf := Regfile.set rf (Word.unsigned adr) w in 
                            Core.Diff.add Phi Delta (Tregfile n t) v rf            
                    end 
            end 
        in 
          eval_effects effects
    end. 

End sem. 

Arguments binding {Phi R arg} _ _.  
Notation "'DO' X <- E ; F" := (binding E (fun X => F)).  
Arguments bind_expr  {Phi R t} _%expr. 
Notation "[: v ]" := (bind_reg_read _ _ _ v).  
Section test. 
  Require Import MOD. 
  Definition Z (t : type) := nat. 
  Eval compute in compile _ _ 0 _ (iterate 5 Z) . 

  Eval compute in compile _ _ 0 _ (done 5 Z). 

End test. 

Section test2. 
  Require Import Isa. 
  Eval compute in compile _ _ 0 _ (loadi_rule 5 (fun _ => nat)). 

  Eval compute in compile _ _ 0 _ (store_rule 5 (fun _ => nat)). 

End test2. 

(**  Each primitive in the top level language has must be massaged in
smaller blocks whose semantics that depend only on the initial state. 

This is naturally the case for [regs], and register [files]. I added
[visible] just to make the problem obvious in the following
translation.  

Consider v a [visible]

[ 
  do _ <- write [: v <- e];
  assert P; 
  do x <- read [: v ];
  assert Q(x); 
  A
]

must be translated to 
[
 t1 <- e; 
 Guard (P /\ Q(t1))
   [
    write [: v <- t1]; 
    x <- t1; 
    A
   ]
] 

The global strategy is as follows:
- All combinational operations bubble to the top of a block; 
- The guard bubble to the top of a block, after the combinational operations; 
- The synchronous updates stay are put in a Guard block. 

This strategy does not work for, for instance, a bypass fifo of length 1 [F]
(empty in the following example)
[
  do old <- fifo_enq_deq F new; 
  assert (old = new); 
  A
]

[
  t1 <- new; 
  comb (A) 
  Guard (t1 = t1 /\ guard (A)) [ fifo 
 
]

*)
(*
Inductive update (Phi : state) : list Core.type -> Core.type -> Type :=
  | register_write : forall t, var Phi (Treg t) -> update Phi (t :: nil) Core.Unit
  | regfile_write : forall n t (v : var Phi (Tregfile n t)) p, update Phi ([Core.Tlift (Tint p); t])%list Core.Unit. 

Section t. 
  Variable Var : Core.type -> Type. 
  Variable Phi : state. 
  
  Inductive com := 
  (* event control *)
  | Guard : Core.expr Var Core.Bool -> com -> com
  (* combinational assigmenent *)
  | Foo : forall t, Core.expr Var t -> (Var t -> com) -> com
  (* synchronous effect *)
  | State : forall args res (p : update Phi args res) (exprs : dlist Var args),
              (Var res -> com) -> com. 
End t. 

Reserved Notation " c1 '/' st '==>' diff" (at level 40, st at level 39).

 Definition chang (s: Core.state) : state.  
  eapply List.map . 2: apply s. 
  intros x. 
  refine (match x with | Core.Treg t => Treg t | Core.Tvis t => Treg t | Core.Tregfile n t => Tregfile n t end). 
          Defined.     
Section eval. 
  Variable Phi : Core.state. 
  
  Definition comp V t (c : Core.action Phi V t ) : com V (chang Phi).
  refine (match c with 
              | Core.Return t e => _
              | Core.Bind t u a f => _
              | Core.When t e a => _
              | Core.Primitive args res p exprs  => _
              | Core.Try a => _
          end). 
  admit. 
  | Try : Core.action Phi Var (Core.Tlift Tunit) ->
          Core.action Phi Var (Core.Tlift Tunit)
  induction c. 
  Definition eval_com  (c : com eval_type Phi) (st : eval_state Phi) (Delta : Diff.T Phi): option (Diff.T Phi). 
  refine (
      let fix eval_com (c : com eval_type Phi) :=
          match c with
            | Guard g c' => fun st Delta => match eval_expr _ g with 
                                      | true =>  eval_com c' st Delta 
                                      | false => Some (Delta)
                                    end
            | Foo t e c' => fun st Delta => let v := eval_expr _ e in 
                                      eval_com (c' v) st Delta
            | State args res p exprs c' => _
          end
      in
        eval_com c st Delta).  
  intros st' Delta'. 
  

refine (match E with true => IHc | false => None end). 
set (E := c (eval_expr _ e)).

  Inductive com_eval : com -> state -> -> Prop :=
.  
  | Eseq : forall st1 st2 st3 c1 c2, 
             c1 / st1 ==> st2 ->
             c2 / st2 ==> st3 -> 
             Cseq c1 c2 / st1 ==> st3
  | Eset_reg : forall t (v : var regs t) (e : expr t) st1 st2 r, 
                 eval_expr  st1 e = r ->
                 update_reg  st1 v r = st2 -> 
                 (Cset_reg t v e) / st1 ==> st2 
  | Eset_mem : forall t (v : var mems t) (e : expr t) st1 st2 r, 
                 eval_expr st1 e = r ->
                 update_mem st1 v r = st2 -> 
                 (Cset_mem t v e) / st1 ==> st2
  | Eifb_true : forall (e : expr Tbool) c1 c2 st1 st2, 
                  eval_expr  st1 e = true -> 
                  c1 / st1 ==> st2 ->
                  (Cifb e c1 c2) / st1 ==> st2
  | Eifb_false : forall (e : expr Tbool) c1 c2 st1 st2, 
                   eval_expr st1 e = false -> 
                   c2 / st1 ==> st2 ->
                   (Cifb e c1 c2) / st1 ==> st2 
   where "c1 '/' st '==>' st'" := (com_eval c1 st st').

  
End t.     


(*   Module Diff. 
    Section t. 
      Variable Phi : state. 
      Definition T := eval_env (option ∘ eval_sync) Phi. 
      Definition add (Delta : T) t (v : var Phi t) w : option T :=
        match get Phi t v Delta  with 
          | None =>  Some  (set _ _ Phi t v (Some w) Delta)
          | Some _ => None 
        end.
      
    End t. 
    Fixpoint init (Phi : state ): T Phi := 
      match Phi with 
        | nil => tt
        | cons t Phi => (None, init Phi)
      end. 
    
    Fixpoint apply (Phi : state) : T Phi -> eval_env eval_sync Phi -> eval_env eval_sync Phi :=
      match Phi with 
        | nil => fun _ _ => tt
        | cons t Phi => fun Delta E => 
                       match fst Delta with 
                         | None => (fst E, apply Phi (snd Delta) (snd E))
                         | Some d => (d, apply Phi (snd Delta) (snd E))
                       end
      end. 
    
  End Diff. 
*)
Module Sem2.
  Module Guarded. 
    (** static semantics: 
     *)
    Section t. 
      Variable Phi : state. 
      Variable Var : type -> Type. 

          
      Record  M t := mk_M
        {
          content : expr Var t;
          effects : list effect; 
          valid : expr Var Bool}. 

      Arguments mk_M {t} _ _ _. 
      
      Definition T t := expr Var Bool -> M t. 
      
      Definition Return {t} (e : expr Var t) : T t := fun _ => mk_M e nil (#b true).

      Definition Bind {s t} : T s -> (expr Var s -> T t) -> T t.
      intros x f. 
      intros Psi. 
      refine (let x' := x Psi in 
              let y := f (content _ x') Psi in 
                mk_M (content _ y) (effects _ x' ++ effects _ y) (valid _ x' && valid _ y )%expr). 
      Defined. 
      
      Definition primitive_denote  args res (p : primitive Phi args res) (exprs : eval_env eval_type args) : T (res). 
      intros Psi. 
      destruct p.  
      (* register read *)
      
      (* register write *)
      (* regfile read *)
      (* regfile write *)

        match
          p in (primitive _ l t) return (eval_env eval_type l -> T (eval_type t))
        with
          | register_read t v =>
              fun _ (st : eval_state Phi)
                  (Delta : Diff.T Phi) => Some (get Phi (Treg t) v st, Delta)
          | register_write t v =>
              fun (exprs : eval_env eval_type [t]) (_ : eval_state Phi) (Delta : Diff.T Phi) =>
                let (w, _) := exprs in
                  do Delta2 <- Diff.add Phi Delta (Treg t) v w; 
                  Some (tt, Delta2)
          | regfile_read n t v p =>
              fun (exprs : eval_env eval_type [Tlift (W p)]) 
                  (st : eval_state Phi) (Delta : Diff.T Phi) =>
                let rf := get Phi (Tregfile n t) v st in
                let adr := fst exprs in
                  do v <- Regfile.get rf (Word.unsigned adr); Some (v, Delta)
          | regfile_write n t v p =>
              fun (exprs : eval_env eval_type [Tlift (W p); t]) 
                  (st : eval_state Phi) (Delta : Diff.T Phi) =>
                let rf := get Phi (Tregfile n t) v st in
                let rf := match exprs with 
                              (adr, (w, _)) => Regfile.set rf (Word.unsigned adr) w
                          end
                in
                  do Delta2 <- Diff.add Phi Delta (Tregfile n t) v rf; Some (tt, Delta2)
        end exprs.
    End t. 
  End Dyn. 

  (** dynamic semantics: 
    - all guard failures are represented by None. 
    - continuation passing style: the current diff is threaded through the execution 
  *)
  Section t. 
    Variable Phi : state. 
    Definition eval_action (t : type) (a : action Phi eval_type t) : 
      (Dyn.T Phi (eval_type t)). 

    refine (
        let fix eval_action (t : type) (a : action Phi eval_type t) :
            Dyn.T Phi ( eval_type t) :=
            match a with
              | Return t exp => Dyn.Return Phi (eval_expr _ exp)
              | Bind t u a f => 
                  let act := eval_action _ a in 
                    let f' := (fun e => eval_action u (f e)) in 
                      Dyn.Bind Phi act f'              
              | When t e a => 
                  let g1 := eval_expr _ e in 
                    let a' := eval_action t a in 
                      match g1 with 
                        | true => a' 
                        | false => Dyn.Fail  Phi
                      end
              | Primitive args res p exprs => 
                  Dyn.primitive_denote Phi args res p (dlist_fold' eval_expr _ exprs)
              | Try a => 
                  let a := eval_action _ a in 
                    Dyn.Try Phi a                    
          end                
      in  eval_action t a). 
  Defined.
  End t. 
  Arguments eval_action {Phi} {t} _%action _ _.  
End Sem.           


Section s. 

  Variable Phi : state. 
Section expr. 
  Variable mems : list type0. 
  Variable regs : list type0. 

  Inductive expr : type0 -> Type :=
  | get_reg : forall t, var regs t ->  expr t
  | get_mem : forall t, var mems t ->  expr t
  | const : forall (c : constant),  expr (cst_ty c)
  | op :
    forall (f : signature), 
      dlist expr (args f) -> 
      expr (res f). 

  Inductive com : Type :=
    | Cskip 
    | Cseq : com -> com -> com
    | Cset_reg : forall t (v : var regs t), expr t -> com
    | Cset_mem : forall t (v : var mems t), expr t -> com
    | Cifb : expr Tbool -> com  -> com -> com. 
  
    
  Record state :=
    {
      st_mems : eval_env eval_type0 mems;
      st_regs : eval_env eval_type0 regs    
    }. 

  Reserved Notation " c1 '/' st '==>' st'" (at level 40, st at level 39).
  Definition eval_expr {t} : state -> expr t -> eval_type0 t. 
  Admitted. 

  Definition update_reg : forall {t},  state -> var regs t ->  eval_type0 t -> state. Admitted. 
  Definition update_mem : forall {t},  state -> var mems t -> eval_type0 t -> state. Admitted. 
  
  Inductive com_eval : com -> state -> state -> Prop :=
  | Eskip : forall st, Cskip  / st ==> st
  | Eseq : forall st1 st2 st3 c1 c2, 
             c1 / st1 ==> st2 ->
             c2 / st2 ==> st3 -> 
             Cseq c1 c2 / st1 ==> st3
  | Eset_reg : forall t (v : var regs t) (e : expr t) st1 st2 r, 
                 eval_expr  st1 e = r ->
                 update_reg  st1 v r = st2 -> 
                 (Cset_reg t v e) / st1 ==> st2 
  | Eset_mem : forall t (v : var mems t) (e : expr t) st1 st2 r, 
                 eval_expr st1 e = r ->
                 update_mem st1 v r = st2 -> 
                 (Cset_mem t v e) / st1 ==> st2
  | Eifb_true : forall (e : expr Tbool) c1 c2 st1 st2, 
                  eval_expr  st1 e = true -> 
                  c1 / st1 ==> st2 ->
                  (Cifb e c1 c2) / st1 ==> st2
  | Eifb_false : forall (e : expr Tbool) c1 c2 st1 st2, 
                   eval_expr st1 e = false -> 
                   c2 / st1 ==> st2 ->
                   (Cifb e c1 c2) / st1 ==> st2 
   where "c1 '/' st '==>' st'" := (com_eval c1 st st').

Fixpoint com_denote (c : com) (st1 : state) : option state :=
  match c with
    | Cskip => Some st1
    | Cseq c1 c2 => 
        do st2 <- com_denote c1 st1;
        com_denote c2 st2
    | Cset_reg t v e =>
        let r := eval_expr st1 e in 
          Some (update_reg st1 v r)
    | Cset_mem t v e =>
        let r := eval_expr st1 e in 
          Some (update_mem st1 v r)
    | Cifb e c1 c2  =>
        let r := eval_expr st1 e in 
          if r then com_denote c1 st1 
          else  com_denote c2 st1
  end. 
End expr.  

Record RTL :=
  {
    mems : list type0;
    regs : list type0;
    code : com mems regs; 
    t_outputs : list type0;
    outputs : dlist (var regs) t_outputs;
    t_inputs : list type0;
    inputs : dlist  (var regs) t_inputs
  }. 


Section semantics. 
  Variable R : RTL. 
  
  Let I := eval_env eval_type0 (t_inputs R). 
  Let O := eval_env eval_type0 (t_outputs R). 

  Let sigma := state (mems R) (regs R). 

  (* Definition M : Moore.T I O sigma. *)
  (* constructor.  *)
  (* Fixpoint zob E F (l : dlist  (var E) F) :  *)
  (*   eval_env eval_type0 E -> eval_env eval_type0 F := *)
  (* match l with *)
  (*   | dlist_nil => fun _ => tt *)
  (*   | dlist_cons t q T Q => fun X => (get E t T X, zob _ _ Q X) *)
  (* end.  *)
  
  (* intros. eapply zob. apply outputs. apply (st_regs _ _ X).  *)
  (* intros. apply com_denote. apply (code  R).  *)
  (* apply X.  *)
  (* Defined.  *)

End semantics. 
 (*
Inductive machine :=
  {
    mems : list type0;
    regs : list type0;
    instances : list machine;
    reset : com mems regs ;
    step : com mems regs
  }. 

Inductive state (m : machine) := 
  {
    ls : local_state (mems m) (regs m);
    st_machines : dlist _ state (instances m)
  }.
  
Reserved Notation " c1 '/' st '==>' st'" (at level 40, st at level 39).

Inductive com_eval m : com (mems m) (regs m) -> state m -> state m -> Prop :=
  | Eskip : forall st, Cskip (mems m) (regs m)  / st ==> st
  | Eseq : forall st1 st2 st3 c1 c2, 
             c1 / st1 ==> st2 ->
             c2 / st2 ==> st3 -> 
             Cseq (mems m) (regs m) c1 c2 / st1 ==> st3
  | Eset_reg : forall t (v : var (regs m) t) (e : expr (mems m) (regs m) t) st1 st2 r, 
                 eval_expr _ _ st1 e = r ->
                 update_reg _ _ st1 r = st2 -> 
                 (Cset_reg _ _ _ t v e) / st1 ==> st2 (*
  | Eset_mem : forall t (v : var mems t) (e : expr t) st1 st2 r, 
                 eval_expr _ st1 e = r ->
                 update_mem _ st1 r = st2 -> 
                   (Cset_mem t v e) / st1 ==> st2
    | Eifb_true : forall (e : expr Tbool) c1 c2 st1 st2, 
               eval_expr _ st1 e = true -> 
               c1 / st1 ==> st2 ->
               (Cifb e c1 c2) / st1 ==> st2
    | Eifb_false : forall (e : expr Tbool) c1 c2 st1 st2, 
               eval_expr _ st1 e = false -> 
               c2 / st1 ==> st2 ->
               (Cifb e c1 c2) / st1 ==> st2 *)
    where "c1 '/' st '==>' st'" := (com_eval _ c1 st st').
 





End expr. 
  

End expr. 
Inductive type :=
| Tregfile : forall (size : nat) (base : type0) , type
| Tfifo : nat -> type0 -> type
| Tbase : type0 -> type
| Tinput  : type0 -> type
| Toutput : type0 -> type. 

Fixpoint eval_type (t : type) : Type :=
  match t with
    | Tregfile size bt =>Regfile.T size (eval_type0 bt) 
    | Tfifo n bt => FIFO.T n (eval_type0 bt)
    | Tbase bt => eval_type0 bt
    | Tinput bt => eval_type0 bt
    | Toutput bt => eval_type0 bt
  end. 

Section expr. 
  Variable Env : list type. 
  
  Inductive expr : type0 -> Type :=
  | Eprim : forall f (args: expr_vector (args (f))), expr ( (res ( f)))
  | Eget : forall t (v : var Env (Tbase t)), expr t
  (* operations on arrays *)
  | Eget_array : forall size  n t (v : var Env (Tregfile size t)), expr (Tint n) -> expr t
  (* operations on fifo *)
  | Efirst : forall n t (v : var Env (Tfifo n t)), expr t
  | Eisfull : forall n t (v : var Env (Tfifo n t)), expr (Tbool)
  | Eisempty : forall n t (v : var Env (Tfifo n t)), expr (Tbool)
  (* operations on Inputs *)
  | Eget_input : forall t (v : var Env (Tinput t)), expr t
  (* operations on Outputs *)
  | Eget_output : forall t (v : var Env (Toutput t)), expr t
                                                      with expr_vector : list type0 -> Type :=
  | expr_vector_nil : expr_vector nil
  | expr_vector_cons : forall t q, expr  (t) -> expr_vector q -> expr_vector (t::q). 


  Record reg_update (t : type0): Type :=
    {
      latch_enable : expr Tbool;
      data : expr t
    }. 
  
  Record array_update (size : nat) (width : nat) (t : type0) :=
    {
      write_addr : expr (Tint width);
      write_data : expr t;
      write_enable : expr Tbool
    }.

  Record fifo_update (t : type0) :=
    {
      enqueue_data : expr t;
      enqueue_enable : expr Tbool;
      dequeue_enable : expr Tbool;
      clear_enable : expr Tbool
    }. 
  
  Inductive expr2 : type -> Type :=
  (* expression to affect and latch enable  *)
  | Eregister : forall t, reg_update t -> expr2 (Tbase t)
  (* array operations *)
  | Earray :  forall size width t, array_update size width t -> 
                   expr2 (Tregfile size t)
  (* fifo operations *)
  | Efifo : forall n t, fifo_update t ->  expr2 (Tfifo n t) 
  | Enop : forall t, expr2 t. 
              
  
End expr. 

*)*)