module Sorter (clk, rst_n, guard, value, reg_0);
integer index; // Used for initialisations
input clk;
input rst_n;
output guard;
output [63:0] value;
// state declarations
input [63:0] reg_0;
// bindings 
wire  wire0 = 0'b0;
wire  wire1 = 1'b1;
wire  wire2 = 1'b0;
wire [63:0] wire3 = reg_0;
wire [31:0] wire4 = wire3[31:0];
wire [31:0] wire5 = wire3[63:32];
wire [31:0] wire6 = wire5[31:0];
wire  wire7 = 0;
wire [15:0] wire8 = wire4[15:0];
wire [15:0] wire9 = wire4[31:16];
wire [15:0] wire10 = wire9[15:0];
wire  wire11 = 0;
wire [7:0] wire12 = wire8[7:0];
wire [7:0] wire13 = wire8[15:8];
wire [7:0] wire14 = wire13[7:0];
wire  wire15 = 0;
wire [3:0] wire16 = wire12[3:0];
wire [3:0] wire17 = wire12[7:4];
wire [3:0] wire18 = wire17[3:0];
wire  wire19 = 0;
wire [3:0] wire20 = wire14[3:0];
wire [3:0] wire21 = wire14[7:4];
wire [3:0] wire22 = wire21[3:0];
wire  wire23 = 0;
wire [7:0] wire24 = wire10[7:0];
wire [7:0] wire25 = wire10[15:8];
wire [7:0] wire26 = wire25[7:0];
wire  wire27 = 0;
wire [3:0] wire28 = wire24[3:0];
wire [3:0] wire29 = wire24[7:4];
wire [3:0] wire30 = wire29[3:0];
wire  wire31 = 0;
wire [3:0] wire32 = wire26[3:0];
wire [3:0] wire33 = wire26[7:4];
wire [3:0] wire34 = wire33[3:0];
wire  wire35 = 0;
wire [15:0] wire36 = wire6[15:0];
wire [15:0] wire37 = wire6[31:16];
wire [15:0] wire38 = wire37[15:0];
wire  wire39 = 0;
wire [7:0] wire40 = wire36[7:0];
wire [7:0] wire41 = wire36[15:8];
wire [7:0] wire42 = wire41[7:0];
wire  wire43 = 0;
wire [3:0] wire44 = wire40[3:0];
wire [3:0] wire45 = wire40[7:4];
wire [3:0] wire46 = wire45[3:0];
wire  wire47 = 0;
wire [3:0] wire48 = wire42[3:0];
wire [3:0] wire49 = wire42[7:4];
wire [3:0] wire50 = wire49[3:0];
wire  wire51 = 0;
wire [7:0] wire52 = wire38[7:0];
wire [7:0] wire53 = wire38[15:8];
wire [7:0] wire54 = wire53[7:0];
wire  wire55 = 0;
wire [3:0] wire56 = wire52[3:0];
wire [3:0] wire57 = wire52[7:4];
wire [3:0] wire58 = wire57[3:0];
wire  wire59 = 0;
wire [3:0] wire60 = wire54[3:0];
wire [3:0] wire61 = wire54[7:4];
wire [3:0] wire62 = wire61[3:0];
wire  wire63 = 0;
wire [7:0] wire64 = {wire16, wire18};
wire [3:0] wire65 = wire64[7:4];
wire  wire66 = 0;
wire  wire67 = wire16 < wire18;
wire [3:0] wire68 = wire67 ? wire16 : wire18;
wire [3:0] wire69 = wire67 ? wire18 : wire16;
wire [7:0] wire70 = {wire68, wire69};
wire [3:0] wire71 = wire70[7:4];
wire [7:0] wire72 = {wire20, wire22};
wire [3:0] wire73 = wire72[7:4];
wire  wire74 = wire20 < wire22;
wire [3:0] wire75 = wire74 ? wire20 : wire22;
wire [3:0] wire76 = wire74 ? wire22 : wire20;
wire [7:0] wire77 = {wire75, wire76};
wire [3:0] wire78 = wire77[7:4];
wire [7:0] wire79 = {wire76, wire75};
wire [15:0] wire80 = {wire70, wire79};
wire [7:0] wire81 = wire80[15:8];
wire [3:0] wire82 = wire79[7:4];
wire  wire83 = wire68 < wire76;
wire [3:0] wire84 = wire83 ? wire68 : wire76;
wire [3:0] wire85 = wire83 ? wire76 : wire68;
wire [7:0] wire86 = {wire84, wire85};
wire [3:0] wire87 = wire86[7:4];
wire  wire88 = wire69 < wire75;
wire [3:0] wire89 = wire88 ? wire69 : wire75;
wire [3:0] wire90 = wire88 ? wire75 : wire69;
wire [7:0] wire91 = {wire89, wire90};
wire [3:0] wire92 = wire91[7:4];
wire [7:0] wire93 = {wire84, wire89};
wire [7:0] wire94 = {wire85, wire90};
wire [15:0] wire95 = {wire93, wire94};
wire [7:0] wire96 = wire95[15:8];
wire [3:0] wire97 = wire93[7:4];
wire  wire98 = wire84 < wire89;
wire [3:0] wire99 = wire98 ? wire84 : wire89;
wire [3:0] wire100 = wire98 ? wire89 : wire84;
wire [7:0] wire101 = {wire99, wire100};
wire [3:0] wire102 = wire101[7:4];
wire  wire103 = wire85 < wire90;
wire [3:0] wire104 = wire103 ? wire85 : wire90;
wire [3:0] wire105 = wire103 ? wire90 : wire85;
wire [7:0] wire106 = {wire104, wire105};
wire [3:0] wire107 = wire106[7:4];
wire [15:0] wire108 = {wire101, wire106};
wire [7:0] wire109 = {wire28, wire30};
wire [3:0] wire110 = wire109[7:4];
wire  wire111 = wire28 < wire30;
wire [3:0] wire112 = wire111 ? wire28 : wire30;
wire [3:0] wire113 = wire111 ? wire30 : wire28;
wire [7:0] wire114 = {wire112, wire113};
wire [3:0] wire115 = wire114[7:4];
wire [7:0] wire116 = {wire32, wire34};
wire [3:0] wire117 = wire116[7:4];
wire  wire118 = wire32 < wire34;
wire [3:0] wire119 = wire118 ? wire32 : wire34;
wire [3:0] wire120 = wire118 ? wire34 : wire32;
wire [7:0] wire121 = {wire119, wire120};
wire [3:0] wire122 = wire121[7:4];
wire [7:0] wire123 = {wire120, wire119};
wire [15:0] wire124 = {wire114, wire123};
wire [7:0] wire125 = wire124[15:8];
wire [3:0] wire126 = wire123[7:4];
wire  wire127 = wire112 < wire120;
wire [3:0] wire128 = wire127 ? wire112 : wire120;
wire [3:0] wire129 = wire127 ? wire120 : wire112;
wire [7:0] wire130 = {wire128, wire129};
wire [3:0] wire131 = wire130[7:4];
wire  wire132 = wire113 < wire119;
wire [3:0] wire133 = wire132 ? wire113 : wire119;
wire [3:0] wire134 = wire132 ? wire119 : wire113;
wire [7:0] wire135 = {wire133, wire134};
wire [3:0] wire136 = wire135[7:4];
wire [7:0] wire137 = {wire128, wire133};
wire [7:0] wire138 = {wire129, wire134};
wire [15:0] wire139 = {wire137, wire138};
wire [7:0] wire140 = wire139[15:8];
wire [3:0] wire141 = wire137[7:4];
wire  wire142 = wire128 < wire133;
wire [3:0] wire143 = wire142 ? wire128 : wire133;
wire [3:0] wire144 = wire142 ? wire133 : wire128;
wire [7:0] wire145 = {wire143, wire144};
wire [3:0] wire146 = wire145[7:4];
wire  wire147 = wire129 < wire134;
wire [3:0] wire148 = wire147 ? wire129 : wire134;
wire [3:0] wire149 = wire147 ? wire134 : wire129;
wire [7:0] wire150 = {wire148, wire149};
wire [3:0] wire151 = wire150[7:4];
wire [15:0] wire152 = {wire145, wire150};
wire [7:0] wire153 = wire152[15:8];
wire [7:0] wire154 = {wire149, wire148};
wire [7:0] wire155 = {wire144, wire143};
wire [15:0] wire156 = {wire154, wire155};
wire [31:0] wire157 = {wire108, wire156};
wire [15:0] wire158 = wire157[31:16];
wire [7:0] wire159 = wire108[15:8];
wire [7:0] wire160 = wire156[15:8];
wire [3:0] wire161 = wire154[7:4];
wire [3:0] wire162 = wire155[7:4];
wire  wire163 = wire99 < wire149;
wire [3:0] wire164 = wire163 ? wire99 : wire149;
wire [3:0] wire165 = wire163 ? wire149 : wire99;
wire [7:0] wire166 = {wire164, wire165};
wire [3:0] wire167 = wire166[7:4];
wire  wire168 = wire100 < wire148;
wire [3:0] wire169 = wire168 ? wire100 : wire148;
wire [3:0] wire170 = wire168 ? wire148 : wire100;
wire [7:0] wire171 = {wire169, wire170};
wire [3:0] wire172 = wire171[7:4];
wire [7:0] wire173 = {wire164, wire169};
wire [7:0] wire174 = {wire165, wire170};
wire [15:0] wire175 = {wire173, wire174};
wire [7:0] wire176 = wire175[15:8];
wire  wire177 = wire104 < wire144;
wire [3:0] wire178 = wire177 ? wire104 : wire144;
wire [3:0] wire179 = wire177 ? wire144 : wire104;
wire [7:0] wire180 = {wire178, wire179};
wire [3:0] wire181 = wire180[7:4];
wire  wire182 = wire105 < wire143;
wire [3:0] wire183 = wire182 ? wire105 : wire143;
wire [3:0] wire184 = wire182 ? wire143 : wire105;
wire [7:0] wire185 = {wire183, wire184};
wire [3:0] wire186 = wire185[7:4];
wire [7:0] wire187 = {wire178, wire183};
wire [7:0] wire188 = {wire179, wire184};
wire [15:0] wire189 = {wire187, wire188};
wire [7:0] wire190 = wire189[15:8];
wire [15:0] wire191 = {wire173, wire187};
wire [15:0] wire192 = {wire174, wire188};
wire [31:0] wire193 = {wire191, wire192};
wire [15:0] wire194 = wire193[31:16];
wire [7:0] wire195 = wire191[15:8];
wire [3:0] wire196 = wire173[7:4];
wire [3:0] wire197 = wire187[7:4];
wire  wire198 = wire164 < wire178;
wire [3:0] wire199 = wire198 ? wire164 : wire178;
wire [3:0] wire200 = wire198 ? wire178 : wire164;
wire [7:0] wire201 = {wire199, wire200};
wire [3:0] wire202 = wire201[7:4];
wire  wire203 = wire169 < wire183;
wire [3:0] wire204 = wire203 ? wire169 : wire183;
wire [3:0] wire205 = wire203 ? wire183 : wire169;
wire [7:0] wire206 = {wire204, wire205};
wire [3:0] wire207 = wire206[7:4];
wire [7:0] wire208 = {wire199, wire204};
wire [7:0] wire209 = {wire200, wire205};
wire [15:0] wire210 = {wire208, wire209};
wire [7:0] wire211 = wire210[15:8];
wire [3:0] wire212 = wire208[7:4];
wire  wire213 = wire199 < wire204;
wire [3:0] wire214 = wire213 ? wire199 : wire204;
wire [3:0] wire215 = wire213 ? wire204 : wire199;
wire [7:0] wire216 = {wire214, wire215};
wire [3:0] wire217 = wire216[7:4];
wire  wire218 = wire200 < wire205;
wire [3:0] wire219 = wire218 ? wire200 : wire205;
wire [3:0] wire220 = wire218 ? wire205 : wire200;
wire [7:0] wire221 = {wire219, wire220};
wire [3:0] wire222 = wire221[7:4];
wire [15:0] wire223 = {wire216, wire221};
wire  wire224 = wire165 < wire179;
wire [3:0] wire225 = wire224 ? wire165 : wire179;
wire [3:0] wire226 = wire224 ? wire179 : wire165;
wire [7:0] wire227 = {wire225, wire226};
wire [3:0] wire228 = wire227[7:4];
wire  wire229 = wire170 < wire184;
wire [3:0] wire230 = wire229 ? wire170 : wire184;
wire [3:0] wire231 = wire229 ? wire184 : wire170;
wire [7:0] wire232 = {wire230, wire231};
wire [3:0] wire233 = wire232[7:4];
wire [7:0] wire234 = {wire225, wire230};
wire [7:0] wire235 = {wire226, wire231};
wire [15:0] wire236 = {wire234, wire235};
wire [7:0] wire237 = wire236[15:8];
wire [3:0] wire238 = wire234[7:4];
wire  wire239 = wire225 < wire230;
wire [3:0] wire240 = wire239 ? wire225 : wire230;
wire [3:0] wire241 = wire239 ? wire230 : wire225;
wire [7:0] wire242 = {wire240, wire241};
wire [3:0] wire243 = wire242[7:4];
wire  wire244 = wire226 < wire231;
wire [3:0] wire245 = wire244 ? wire226 : wire231;
wire [3:0] wire246 = wire244 ? wire231 : wire226;
wire [7:0] wire247 = {wire245, wire246};
wire [3:0] wire248 = wire247[7:4];
wire [15:0] wire249 = {wire242, wire247};
wire [31:0] wire250 = {wire223, wire249};
wire [7:0] wire251 = {wire44, wire46};
wire [3:0] wire252 = wire251[7:4];
wire  wire253 = wire44 < wire46;
wire [3:0] wire254 = wire253 ? wire44 : wire46;
wire [3:0] wire255 = wire253 ? wire46 : wire44;
wire [7:0] wire256 = {wire254, wire255};
wire [3:0] wire257 = wire256[7:4];
wire [7:0] wire258 = {wire48, wire50};
wire [3:0] wire259 = wire258[7:4];
wire  wire260 = wire48 < wire50;
wire [3:0] wire261 = wire260 ? wire48 : wire50;
wire [3:0] wire262 = wire260 ? wire50 : wire48;
wire [7:0] wire263 = {wire261, wire262};
wire [3:0] wire264 = wire263[7:4];
wire [7:0] wire265 = {wire262, wire261};
wire [15:0] wire266 = {wire256, wire265};
wire [7:0] wire267 = wire266[15:8];
wire [3:0] wire268 = wire265[7:4];
wire  wire269 = wire254 < wire262;
wire [3:0] wire270 = wire269 ? wire254 : wire262;
wire [3:0] wire271 = wire269 ? wire262 : wire254;
wire [7:0] wire272 = {wire270, wire271};
wire [3:0] wire273 = wire272[7:4];
wire  wire274 = wire255 < wire261;
wire [3:0] wire275 = wire274 ? wire255 : wire261;
wire [3:0] wire276 = wire274 ? wire261 : wire255;
wire [7:0] wire277 = {wire275, wire276};
wire [3:0] wire278 = wire277[7:4];
wire [7:0] wire279 = {wire270, wire275};
wire [7:0] wire280 = {wire271, wire276};
wire [15:0] wire281 = {wire279, wire280};
wire [7:0] wire282 = wire281[15:8];
wire [3:0] wire283 = wire279[7:4];
wire  wire284 = wire270 < wire275;
wire [3:0] wire285 = wire284 ? wire270 : wire275;
wire [3:0] wire286 = wire284 ? wire275 : wire270;
wire [7:0] wire287 = {wire285, wire286};
wire [3:0] wire288 = wire287[7:4];
wire  wire289 = wire271 < wire276;
wire [3:0] wire290 = wire289 ? wire271 : wire276;
wire [3:0] wire291 = wire289 ? wire276 : wire271;
wire [7:0] wire292 = {wire290, wire291};
wire [3:0] wire293 = wire292[7:4];
wire [15:0] wire294 = {wire287, wire292};
wire [7:0] wire295 = {wire56, wire58};
wire [3:0] wire296 = wire295[7:4];
wire  wire297 = wire56 < wire58;
wire [3:0] wire298 = wire297 ? wire56 : wire58;
wire [3:0] wire299 = wire297 ? wire58 : wire56;
wire [7:0] wire300 = {wire298, wire299};
wire [3:0] wire301 = wire300[7:4];
wire [7:0] wire302 = {wire60, wire62};
wire [3:0] wire303 = wire302[7:4];
wire  wire304 = wire60 < wire62;
wire [3:0] wire305 = wire304 ? wire60 : wire62;
wire [3:0] wire306 = wire304 ? wire62 : wire60;
wire [7:0] wire307 = {wire305, wire306};
wire [3:0] wire308 = wire307[7:4];
wire [7:0] wire309 = {wire306, wire305};
wire [15:0] wire310 = {wire300, wire309};
wire [7:0] wire311 = wire310[15:8];
wire [3:0] wire312 = wire309[7:4];
wire  wire313 = wire298 < wire306;
wire [3:0] wire314 = wire313 ? wire298 : wire306;
wire [3:0] wire315 = wire313 ? wire306 : wire298;
wire [7:0] wire316 = {wire314, wire315};
wire [3:0] wire317 = wire316[7:4];
wire  wire318 = wire299 < wire305;
wire [3:0] wire319 = wire318 ? wire299 : wire305;
wire [3:0] wire320 = wire318 ? wire305 : wire299;
wire [7:0] wire321 = {wire319, wire320};
wire [3:0] wire322 = wire321[7:4];
wire [7:0] wire323 = {wire314, wire319};
wire [7:0] wire324 = {wire315, wire320};
wire [15:0] wire325 = {wire323, wire324};
wire [7:0] wire326 = wire325[15:8];
wire [3:0] wire327 = wire323[7:4];
wire  wire328 = wire314 < wire319;
wire [3:0] wire329 = wire328 ? wire314 : wire319;
wire [3:0] wire330 = wire328 ? wire319 : wire314;
wire [7:0] wire331 = {wire329, wire330};
wire [3:0] wire332 = wire331[7:4];
wire  wire333 = wire315 < wire320;
wire [3:0] wire334 = wire333 ? wire315 : wire320;
wire [3:0] wire335 = wire333 ? wire320 : wire315;
wire [7:0] wire336 = {wire334, wire335};
wire [3:0] wire337 = wire336[7:4];
wire [15:0] wire338 = {wire331, wire336};
wire [7:0] wire339 = wire338[15:8];
wire [7:0] wire340 = {wire335, wire334};
wire [7:0] wire341 = {wire330, wire329};
wire [15:0] wire342 = {wire340, wire341};
wire [31:0] wire343 = {wire294, wire342};
wire [15:0] wire344 = wire343[31:16];
wire [7:0] wire345 = wire294[15:8];
wire [7:0] wire346 = wire342[15:8];
wire [3:0] wire347 = wire340[7:4];
wire [3:0] wire348 = wire341[7:4];
wire  wire349 = wire285 < wire335;
wire [3:0] wire350 = wire349 ? wire285 : wire335;
wire [3:0] wire351 = wire349 ? wire335 : wire285;
wire [7:0] wire352 = {wire350, wire351};
wire [3:0] wire353 = wire352[7:4];
wire  wire354 = wire286 < wire334;
wire [3:0] wire355 = wire354 ? wire286 : wire334;
wire [3:0] wire356 = wire354 ? wire334 : wire286;
wire [7:0] wire357 = {wire355, wire356};
wire [3:0] wire358 = wire357[7:4];
wire [7:0] wire359 = {wire350, wire355};
wire [7:0] wire360 = {wire351, wire356};
wire [15:0] wire361 = {wire359, wire360};
wire [7:0] wire362 = wire361[15:8];
wire  wire363 = wire290 < wire330;
wire [3:0] wire364 = wire363 ? wire290 : wire330;
wire [3:0] wire365 = wire363 ? wire330 : wire290;
wire [7:0] wire366 = {wire364, wire365};
wire [3:0] wire367 = wire366[7:4];
wire  wire368 = wire291 < wire329;
wire [3:0] wire369 = wire368 ? wire291 : wire329;
wire [3:0] wire370 = wire368 ? wire329 : wire291;
wire [7:0] wire371 = {wire369, wire370};
wire [3:0] wire372 = wire371[7:4];
wire [7:0] wire373 = {wire364, wire369};
wire [7:0] wire374 = {wire365, wire370};
wire [15:0] wire375 = {wire373, wire374};
wire [7:0] wire376 = wire375[15:8];
wire [15:0] wire377 = {wire359, wire373};
wire [15:0] wire378 = {wire360, wire374};
wire [31:0] wire379 = {wire377, wire378};
wire [15:0] wire380 = wire379[31:16];
wire [7:0] wire381 = wire377[15:8];
wire [3:0] wire382 = wire359[7:4];
wire [3:0] wire383 = wire373[7:4];
wire  wire384 = wire350 < wire364;
wire [3:0] wire385 = wire384 ? wire350 : wire364;
wire [3:0] wire386 = wire384 ? wire364 : wire350;
wire [7:0] wire387 = {wire385, wire386};
wire [3:0] wire388 = wire387[7:4];
wire  wire389 = wire355 < wire369;
wire [3:0] wire390 = wire389 ? wire355 : wire369;
wire [3:0] wire391 = wire389 ? wire369 : wire355;
wire [7:0] wire392 = {wire390, wire391};
wire [3:0] wire393 = wire392[7:4];
wire [7:0] wire394 = {wire385, wire390};
wire [7:0] wire395 = {wire386, wire391};
wire [15:0] wire396 = {wire394, wire395};
wire [7:0] wire397 = wire396[15:8];
wire [3:0] wire398 = wire394[7:4];
wire  wire399 = wire385 < wire390;
wire [3:0] wire400 = wire399 ? wire385 : wire390;
wire [3:0] wire401 = wire399 ? wire390 : wire385;
wire [7:0] wire402 = {wire400, wire401};
wire [3:0] wire403 = wire402[7:4];
wire  wire404 = wire386 < wire391;
wire [3:0] wire405 = wire404 ? wire386 : wire391;
wire [3:0] wire406 = wire404 ? wire391 : wire386;
wire [7:0] wire407 = {wire405, wire406};
wire [3:0] wire408 = wire407[7:4];
wire [15:0] wire409 = {wire402, wire407};
wire  wire410 = wire351 < wire365;
wire [3:0] wire411 = wire410 ? wire351 : wire365;
wire [3:0] wire412 = wire410 ? wire365 : wire351;
wire [7:0] wire413 = {wire411, wire412};
wire [3:0] wire414 = wire413[7:4];
wire  wire415 = wire356 < wire370;
wire [3:0] wire416 = wire415 ? wire356 : wire370;
wire [3:0] wire417 = wire415 ? wire370 : wire356;
wire [7:0] wire418 = {wire416, wire417};
wire [3:0] wire419 = wire418[7:4];
wire [7:0] wire420 = {wire411, wire416};
wire [7:0] wire421 = {wire412, wire417};
wire [15:0] wire422 = {wire420, wire421};
wire [7:0] wire423 = wire422[15:8];
wire [3:0] wire424 = wire420[7:4];
wire  wire425 = wire411 < wire416;
wire [3:0] wire426 = wire425 ? wire411 : wire416;
wire [3:0] wire427 = wire425 ? wire416 : wire411;
wire [7:0] wire428 = {wire426, wire427};
wire [3:0] wire429 = wire428[7:4];
wire  wire430 = wire412 < wire417;
wire [3:0] wire431 = wire430 ? wire412 : wire417;
wire [3:0] wire432 = wire430 ? wire417 : wire412;
wire [7:0] wire433 = {wire431, wire432};
wire [3:0] wire434 = wire433[7:4];
wire [15:0] wire435 = {wire428, wire433};
wire [31:0] wire436 = {wire409, wire435};
wire [15:0] wire437 = wire436[31:16];
wire [7:0] wire438 = wire409[15:8];
wire [7:0] wire439 = wire435[15:8];
wire [7:0] wire440 = {wire432, wire431};
wire [7:0] wire441 = {wire427, wire426};
wire [15:0] wire442 = {wire440, wire441};
wire [7:0] wire443 = {wire406, wire405};
wire [7:0] wire444 = {wire401, wire400};
wire [15:0] wire445 = {wire443, wire444};
wire [31:0] wire446 = {wire442, wire445};
wire [63:0] wire447 = {wire250, wire446};
wire [31:0] wire448 = wire447[63:32];
wire [15:0] wire449 = wire250[31:16];
wire [7:0] wire450 = wire223[15:8];
wire [7:0] wire451 = wire249[15:8];
wire [15:0] wire452 = wire446[31:16];
wire [7:0] wire453 = wire442[15:8];
wire [3:0] wire454 = wire440[7:4];
wire [3:0] wire455 = wire441[7:4];
wire [7:0] wire456 = wire445[15:8];
wire [3:0] wire457 = wire443[7:4];
wire [3:0] wire458 = wire444[7:4];
wire  wire459 = wire214 < wire432;
wire [3:0] wire460 = wire459 ? wire214 : wire432;
wire [3:0] wire461 = wire459 ? wire432 : wire214;
wire [7:0] wire462 = {wire460, wire461};
wire [3:0] wire463 = wire462[7:4];
wire  wire464 = wire215 < wire431;
wire [3:0] wire465 = wire464 ? wire215 : wire431;
wire [3:0] wire466 = wire464 ? wire431 : wire215;
wire [7:0] wire467 = {wire465, wire466};
wire [3:0] wire468 = wire467[7:4];
wire [7:0] wire469 = {wire460, wire465};
wire [7:0] wire470 = {wire461, wire466};
wire [15:0] wire471 = {wire469, wire470};
wire [7:0] wire472 = wire471[15:8];
wire  wire473 = wire219 < wire427;
wire [3:0] wire474 = wire473 ? wire219 : wire427;
wire [3:0] wire475 = wire473 ? wire427 : wire219;
wire [7:0] wire476 = {wire474, wire475};
wire [3:0] wire477 = wire476[7:4];
wire  wire478 = wire220 < wire426;
wire [3:0] wire479 = wire478 ? wire220 : wire426;
wire [3:0] wire480 = wire478 ? wire426 : wire220;
wire [7:0] wire481 = {wire479, wire480};
wire [3:0] wire482 = wire481[7:4];
wire [7:0] wire483 = {wire474, wire479};
wire [7:0] wire484 = {wire475, wire480};
wire [15:0] wire485 = {wire483, wire484};
wire [7:0] wire486 = wire485[15:8];
wire [15:0] wire487 = {wire469, wire483};
wire [15:0] wire488 = {wire470, wire484};
wire [31:0] wire489 = {wire487, wire488};
wire [15:0] wire490 = wire489[31:16];
wire  wire491 = wire240 < wire406;
wire [3:0] wire492 = wire491 ? wire240 : wire406;
wire [3:0] wire493 = wire491 ? wire406 : wire240;
wire [7:0] wire494 = {wire492, wire493};
wire [3:0] wire495 = wire494[7:4];
wire  wire496 = wire241 < wire405;
wire [3:0] wire497 = wire496 ? wire241 : wire405;
wire [3:0] wire498 = wire496 ? wire405 : wire241;
wire [7:0] wire499 = {wire497, wire498};
wire [3:0] wire500 = wire499[7:4];
wire [7:0] wire501 = {wire492, wire497};
wire [7:0] wire502 = {wire493, wire498};
wire [15:0] wire503 = {wire501, wire502};
wire [7:0] wire504 = wire503[15:8];
wire  wire505 = wire245 < wire401;
wire [3:0] wire506 = wire505 ? wire245 : wire401;
wire [3:0] wire507 = wire505 ? wire401 : wire245;
wire [7:0] wire508 = {wire506, wire507};
wire [3:0] wire509 = wire508[7:4];
wire  wire510 = wire246 < wire400;
wire [3:0] wire511 = wire510 ? wire246 : wire400;
wire [3:0] wire512 = wire510 ? wire400 : wire246;
wire [7:0] wire513 = {wire511, wire512};
wire [3:0] wire514 = wire513[7:4];
wire [7:0] wire515 = {wire506, wire511};
wire [7:0] wire516 = {wire507, wire512};
wire [15:0] wire517 = {wire515, wire516};
wire [7:0] wire518 = wire517[15:8];
wire [15:0] wire519 = {wire501, wire515};
wire [15:0] wire520 = {wire502, wire516};
wire [31:0] wire521 = {wire519, wire520};
wire [15:0] wire522 = wire521[31:16];
wire [31:0] wire523 = {wire487, wire519};
wire [31:0] wire524 = {wire488, wire520};
wire [63:0] wire525 = {wire523, wire524};
wire [31:0] wire526 = wire525[63:32];
wire [15:0] wire527 = wire523[31:16];
wire [7:0] wire528 = wire487[15:8];
wire [3:0] wire529 = wire469[7:4];
wire [3:0] wire530 = wire483[7:4];
wire [7:0] wire531 = wire519[15:8];
wire [3:0] wire532 = wire501[7:4];
wire [3:0] wire533 = wire515[7:4];
wire  wire534 = wire460 < wire492;
wire [3:0] wire535 = wire534 ? wire460 : wire492;
wire [3:0] wire536 = wire534 ? wire492 : wire460;
wire [7:0] wire537 = {wire535, wire536};
wire [3:0] wire538 = wire537[7:4];
wire  wire539 = wire465 < wire497;
wire [3:0] wire540 = wire539 ? wire465 : wire497;
wire [3:0] wire541 = wire539 ? wire497 : wire465;
wire [7:0] wire542 = {wire540, wire541};
wire [3:0] wire543 = wire542[7:4];
wire [7:0] wire544 = {wire535, wire540};
wire [7:0] wire545 = {wire536, wire541};
wire [15:0] wire546 = {wire544, wire545};
wire [7:0] wire547 = wire546[15:8];
wire  wire548 = wire474 < wire506;
wire [3:0] wire549 = wire548 ? wire474 : wire506;
wire [3:0] wire550 = wire548 ? wire506 : wire474;
wire [7:0] wire551 = {wire549, wire550};
wire [3:0] wire552 = wire551[7:4];
wire  wire553 = wire479 < wire511;
wire [3:0] wire554 = wire553 ? wire479 : wire511;
wire [3:0] wire555 = wire553 ? wire511 : wire479;
wire [7:0] wire556 = {wire554, wire555};
wire [3:0] wire557 = wire556[7:4];
wire [7:0] wire558 = {wire549, wire554};
wire [7:0] wire559 = {wire550, wire555};
wire [15:0] wire560 = {wire558, wire559};
wire [7:0] wire561 = wire560[15:8];
wire [15:0] wire562 = {wire544, wire558};
wire [15:0] wire563 = {wire545, wire559};
wire [31:0] wire564 = {wire562, wire563};
wire [15:0] wire565 = wire564[31:16];
wire [7:0] wire566 = wire562[15:8];
wire [3:0] wire567 = wire544[7:4];
wire [3:0] wire568 = wire558[7:4];
wire  wire569 = wire535 < wire549;
wire [3:0] wire570 = wire569 ? wire535 : wire549;
wire [3:0] wire571 = wire569 ? wire549 : wire535;
wire [7:0] wire572 = {wire570, wire571};
wire [3:0] wire573 = wire572[7:4];
wire  wire574 = wire540 < wire554;
wire [3:0] wire575 = wire574 ? wire540 : wire554;
wire [3:0] wire576 = wire574 ? wire554 : wire540;
wire [7:0] wire577 = {wire575, wire576};
wire [3:0] wire578 = wire577[7:4];
wire [7:0] wire579 = {wire570, wire575};
wire [7:0] wire580 = {wire571, wire576};
wire [15:0] wire581 = {wire579, wire580};
wire [7:0] wire582 = wire581[15:8];
wire [3:0] wire583 = wire579[7:4];
wire  wire584 = wire570 < wire575;
wire [3:0] wire585 = wire584 ? wire570 : wire575;
wire [3:0] wire586 = wire584 ? wire575 : wire570;
wire [7:0] wire587 = {wire585, wire586};
wire [3:0] wire588 = wire587[7:4];
wire  wire589 = wire571 < wire576;
wire [3:0] wire590 = wire589 ? wire571 : wire576;
wire [3:0] wire591 = wire589 ? wire576 : wire571;
wire [7:0] wire592 = {wire590, wire591};
wire [3:0] wire593 = wire592[7:4];
wire [15:0] wire594 = {wire587, wire592};
wire  wire595 = wire536 < wire550;
wire [3:0] wire596 = wire595 ? wire536 : wire550;
wire [3:0] wire597 = wire595 ? wire550 : wire536;
wire [7:0] wire598 = {wire596, wire597};
wire [3:0] wire599 = wire598[7:4];
wire  wire600 = wire541 < wire555;
wire [3:0] wire601 = wire600 ? wire541 : wire555;
wire [3:0] wire602 = wire600 ? wire555 : wire541;
wire [7:0] wire603 = {wire601, wire602};
wire [3:0] wire604 = wire603[7:4];
wire [7:0] wire605 = {wire596, wire601};
wire [7:0] wire606 = {wire597, wire602};
wire [15:0] wire607 = {wire605, wire606};
wire [7:0] wire608 = wire607[15:8];
wire [3:0] wire609 = wire605[7:4];
wire  wire610 = wire596 < wire601;
wire [3:0] wire611 = wire610 ? wire596 : wire601;
wire [3:0] wire612 = wire610 ? wire601 : wire596;
wire [7:0] wire613 = {wire611, wire612};
wire [3:0] wire614 = wire613[7:4];
wire  wire615 = wire597 < wire602;
wire [3:0] wire616 = wire615 ? wire597 : wire602;
wire [3:0] wire617 = wire615 ? wire602 : wire597;
wire [7:0] wire618 = {wire616, wire617};
wire [3:0] wire619 = wire618[7:4];
wire [15:0] wire620 = {wire613, wire618};
wire [31:0] wire621 = {wire594, wire620};
wire  wire622 = wire461 < wire493;
wire [3:0] wire623 = wire622 ? wire461 : wire493;
wire [3:0] wire624 = wire622 ? wire493 : wire461;
wire [7:0] wire625 = {wire623, wire624};
wire [3:0] wire626 = wire625[7:4];
wire  wire627 = wire466 < wire498;
wire [3:0] wire628 = wire627 ? wire466 : wire498;
wire [3:0] wire629 = wire627 ? wire498 : wire466;
wire [7:0] wire630 = {wire628, wire629};
wire [3:0] wire631 = wire630[7:4];
wire [7:0] wire632 = {wire623, wire628};
wire [7:0] wire633 = {wire624, wire629};
wire [15:0] wire634 = {wire632, wire633};
wire [7:0] wire635 = wire634[15:8];
wire  wire636 = wire475 < wire507;
wire [3:0] wire637 = wire636 ? wire475 : wire507;
wire [3:0] wire638 = wire636 ? wire507 : wire475;
wire [7:0] wire639 = {wire637, wire638};
wire [3:0] wire640 = wire639[7:4];
wire  wire641 = wire480 < wire512;
wire [3:0] wire642 = wire641 ? wire480 : wire512;
wire [3:0] wire643 = wire641 ? wire512 : wire480;
wire [7:0] wire644 = {wire642, wire643};
wire [3:0] wire645 = wire644[7:4];
wire [7:0] wire646 = {wire637, wire642};
wire [7:0] wire647 = {wire638, wire643};
wire [15:0] wire648 = {wire646, wire647};
wire [7:0] wire649 = wire648[15:8];
wire [15:0] wire650 = {wire632, wire646};
wire [15:0] wire651 = {wire633, wire647};
wire [31:0] wire652 = {wire650, wire651};
wire [15:0] wire653 = wire652[31:16];
wire [7:0] wire654 = wire650[15:8];
wire [3:0] wire655 = wire632[7:4];
wire [3:0] wire656 = wire646[7:4];
wire  wire657 = wire623 < wire637;
wire [3:0] wire658 = wire657 ? wire623 : wire637;
wire [3:0] wire659 = wire657 ? wire637 : wire623;
wire [7:0] wire660 = {wire658, wire659};
wire [3:0] wire661 = wire660[7:4];
wire  wire662 = wire628 < wire642;
wire [3:0] wire663 = wire662 ? wire628 : wire642;
wire [3:0] wire664 = wire662 ? wire642 : wire628;
wire [7:0] wire665 = {wire663, wire664};
wire [3:0] wire666 = wire665[7:4];
wire [7:0] wire667 = {wire658, wire663};
wire [7:0] wire668 = {wire659, wire664};
wire [15:0] wire669 = {wire667, wire668};
wire [7:0] wire670 = wire669[15:8];
wire [3:0] wire671 = wire667[7:4];
wire  wire672 = wire658 < wire663;
wire [3:0] wire673 = wire672 ? wire658 : wire663;
wire [3:0] wire674 = wire672 ? wire663 : wire658;
wire [7:0] wire675 = {wire673, wire674};
wire [3:0] wire676 = wire675[7:4];
wire  wire677 = wire659 < wire664;
wire [3:0] wire678 = wire677 ? wire659 : wire664;
wire [3:0] wire679 = wire677 ? wire664 : wire659;
wire [7:0] wire680 = {wire678, wire679};
wire [3:0] wire681 = wire680[7:4];
wire [15:0] wire682 = {wire675, wire680};
wire  wire683 = wire624 < wire638;
wire [3:0] wire684 = wire683 ? wire624 : wire638;
wire [3:0] wire685 = wire683 ? wire638 : wire624;
wire [7:0] wire686 = {wire684, wire685};
wire [3:0] wire687 = wire686[7:4];
wire  wire688 = wire629 < wire643;
wire [3:0] wire689 = wire688 ? wire629 : wire643;
wire [3:0] wire690 = wire688 ? wire643 : wire629;
wire [7:0] wire691 = {wire689, wire690};
wire [3:0] wire692 = wire691[7:4];
wire [7:0] wire693 = {wire684, wire689};
wire [7:0] wire694 = {wire685, wire690};
wire [15:0] wire695 = {wire693, wire694};
wire [7:0] wire696 = wire695[15:8];
wire [3:0] wire697 = wire693[7:4];
wire  wire698 = wire684 < wire689;
wire [3:0] wire699 = wire698 ? wire684 : wire689;
wire [3:0] wire700 = wire698 ? wire689 : wire684;
wire [7:0] wire701 = {wire699, wire700};
wire [3:0] wire702 = wire701[7:4];
wire  wire703 = wire685 < wire690;
wire [3:0] wire704 = wire703 ? wire685 : wire690;
wire [3:0] wire705 = wire703 ? wire690 : wire685;
wire [7:0] wire706 = {wire704, wire705};
wire [3:0] wire707 = wire706[7:4];
wire [15:0] wire708 = {wire701, wire706};
wire [31:0] wire709 = {wire682, wire708};
wire [63:0] wire710 = {wire621, wire709};
// effects 
assign guard = wire1;
assign value = wire710;
always@(posedge clk)
begin
	if(rst_n)
		begin
// reset 
		end
	else
		begin
		   // put  debug code here (display, stop, ...)
		   $display("%d < %d", wire16, wire18);
		   $display("%d < %d", wire20, wire22);
		   
		end
end
endmodule