-- ZPU
--
-- Copyright 2004-2008 oharboe - �yvind Harboe - oyvind.harboe@zylin.com
-- Modified by Alastair M. Robinson for the ZPUFlex project.
--
-- The FreeBSD license
-- 
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions
-- are met:
-- 
-- 1. Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimer.
-- 2. Redistributions in binary form must reproduce the above
--    copyright notice, this list of conditions and the following
--    disclaimer in the documentation and/or other materials
--    provided with the distribution.
-- 
-- THIS SOFTWARE IS PROVIDED BY THE ZPU PROJECT ``AS IS'' AND ANY
-- EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
-- PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
-- ZPU PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
-- INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
-- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
-- OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
-- HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
-- STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
-- ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-- 
-- The views and conclusions contained in the software and documentation
-- are those of the authors and should not be interpreted as representing
-- official policies, either expressed or implied, of the ZPU Project.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


library work;
use work.zpupkg.all;

entity CtrlROM_ROM is
generic
	(
		maxAddrBitBRAM : integer := maxAddrBitBRAMLimit -- Specify your actual ROM size to save LEs and unnecessary block RAM usage.
	);
port (
	clk : in std_logic;
	areset : in std_logic := '0';
	from_zpu : in ZPU_ToROM;
	to_zpu : out ZPU_FromROM
);
end CtrlROM_ROM;

architecture arch of CtrlROM_ROM is

type ram_type is array(natural range 0 to ((2**(maxAddrBitBRAM+1))/4)-1) of std_logic_vector(wordSize-1 downto 0);

shared variable ram : ram_type :=
(
     0 => x"0b0b0b0b",
     1 => x"8c0b0b0b",
     2 => x"0b81e004",
     3 => x"0b0b0b0b",
     4 => x"8c04ff0d",
     5 => x"80040400",
     6 => x"00000016",
     7 => x"00000000",
     8 => x"0b0b0b96",
     9 => x"f0080b0b",
    10 => x"0b96f408",
    11 => x"0b0b0b96",
    12 => x"f8080b0b",
    13 => x"0b0b9808",
    14 => x"2d0b0b0b",
    15 => x"96f80c0b",
    16 => x"0b0b96f4",
    17 => x"0c0b0b0b",
    18 => x"96f00c04",
    19 => x"00000000",
    20 => x"00000000",
    21 => x"00000000",
    22 => x"00000000",
    23 => x"00000000",
    24 => x"71fd0608",
    25 => x"72830609",
    26 => x"81058205",
    27 => x"832b2a83",
    28 => x"ffff0652",
    29 => x"0471fc06",
    30 => x"08728306",
    31 => x"09810583",
    32 => x"05101010",
    33 => x"2a81ff06",
    34 => x"520471fd",
    35 => x"060883ff",
    36 => x"ff738306",
    37 => x"09810582",
    38 => x"05832b2b",
    39 => x"09067383",
    40 => x"ffff0673",
    41 => x"83060981",
    42 => x"05820583",
    43 => x"2b0b2b07",
    44 => x"72fc060c",
    45 => x"51510471",
    46 => x"fc06080b",
    47 => x"0b0b96bc",
    48 => x"73830610",
    49 => x"10050806",
    50 => x"7381ff06",
    51 => x"73830609",
    52 => x"81058305",
    53 => x"1010102b",
    54 => x"0772fc06",
    55 => x"0c515104",
    56 => x"96f0709b",
    57 => x"cc278b38",
    58 => x"80717084",
    59 => x"05530c81",
    60 => x"e2048c51",
    61 => x"84d60402",
    62 => x"e8050d77",
    63 => x"79565688",
    64 => x"0bfc1677",
    65 => x"712c8f06",
    66 => x"54525480",
    67 => x"53727225",
    68 => x"95387153",
    69 => x"fbe01451",
    70 => x"87713481",
    71 => x"14ff1454",
    72 => x"5472f138",
    73 => x"7153f915",
    74 => x"76712c87",
    75 => x"06535171",
    76 => x"802e8b38",
    77 => x"fbe01451",
    78 => x"71713481",
    79 => x"1454728e",
    80 => x"2495388f",
    81 => x"733153fb",
    82 => x"e01451a0",
    83 => x"71348114",
    84 => x"ff145454",
    85 => x"72f13802",
    86 => x"98050d04",
    87 => x"02fc050d",
    88 => x"81808051",
    89 => x"c0115170",
    90 => x"fb380284",
    91 => x"050d0402",
    92 => x"fc050d84",
    93 => x"bf5182dc",
    94 => x"2dff1151",
    95 => x"708025f6",
    96 => x"38028405",
    97 => x"0d0402fc",
    98 => x"050dec51",
    99 => x"a2710c82",
   100 => x"ef2d8271",
   101 => x"0c028405",
   102 => x"0d0402d8",
   103 => x"050d7b5a",
   104 => x"8059810b",
   105 => x"ec0c840b",
   106 => x"ec0c7952",
   107 => x"97805193",
   108 => x"8c2d96f0",
   109 => x"08792e80",
   110 => x"eb389784",
   111 => x"0879ff12",
   112 => x"56595673",
   113 => x"792e8b38",
   114 => x"81187481",
   115 => x"2a555873",
   116 => x"f738f718",
   117 => x"58815980",
   118 => x"762580c8",
   119 => x"38775273",
   120 => x"5181f72d",
   121 => x"97905297",
   122 => x"805195c2",
   123 => x"2d96f008",
   124 => x"802e9a38",
   125 => x"97905783",
   126 => x"fc557670",
   127 => x"84055808",
   128 => x"e80cfc15",
   129 => x"55748025",
   130 => x"f1388494",
   131 => x"0496f008",
   132 => x"59848056",
   133 => x"97805195",
   134 => x"952dfc80",
   135 => x"16811555",
   136 => x"5683d704",
   137 => x"978408f8",
   138 => x"0c891a80",
   139 => x"f52d8a1b",
   140 => x"80f52d71",
   141 => x"82802905",
   142 => x"881c80f5",
   143 => x"2d708480",
   144 => x"802912f4",
   145 => x"0c5c5454",
   146 => x"80518386",
   147 => x"2d7896f0",
   148 => x"0c02a805",
   149 => x"0d0402f8",
   150 => x"050d840b",
   151 => x"ec0c858a",
   152 => x"2d840bec",
   153 => x"0c8ce42d",
   154 => x"96f00852",
   155 => x"96f00880",
   156 => x"2e8f3896",
   157 => x"cc51839a",
   158 => x"2d839a51",
   159 => x"96b42d80",
   160 => x"527196f0",
   161 => x"0c028805",
   162 => x"0d04810b",
   163 => x"ffb00c04",
   164 => x"02f4050d",
   165 => x"d45281ff",
   166 => x"720c7108",
   167 => x"5381ff72",
   168 => x"0c72882b",
   169 => x"83fe8006",
   170 => x"72087081",
   171 => x"ff065152",
   172 => x"5381ff72",
   173 => x"0c727107",
   174 => x"882b7208",
   175 => x"7081ff06",
   176 => x"51525381",
   177 => x"ff720c72",
   178 => x"7107882b",
   179 => x"72087081",
   180 => x"ff067207",
   181 => x"96f00c52",
   182 => x"53028c05",
   183 => x"0d0402f4",
   184 => x"050d7476",
   185 => x"7181ff06",
   186 => x"d40c5353",
   187 => x"978c0885",
   188 => x"3871892b",
   189 => x"5271982a",
   190 => x"d40c7190",
   191 => x"2a7081ff",
   192 => x"06d40c51",
   193 => x"71882a70",
   194 => x"81ff06d4",
   195 => x"0c517181",
   196 => x"ff06d40c",
   197 => x"72902a70",
   198 => x"81ff06d4",
   199 => x"0c51d408",
   200 => x"7081ff06",
   201 => x"515182b8",
   202 => x"bf527081",
   203 => x"ff2e0981",
   204 => x"06943881",
   205 => x"ff0bd40c",
   206 => x"d4087081",
   207 => x"ff06ff14",
   208 => x"54515171",
   209 => x"e5387096",
   210 => x"f00c028c",
   211 => x"050d0402",
   212 => x"fc050d81",
   213 => x"c75181ff",
   214 => x"0bd40cff",
   215 => x"11517080",
   216 => x"25f43802",
   217 => x"84050d04",
   218 => x"02f4050d",
   219 => x"81ff0bd4",
   220 => x"0c935380",
   221 => x"5287fc80",
   222 => x"c15185de",
   223 => x"2d96f008",
   224 => x"8b3881ff",
   225 => x"0bd40c81",
   226 => x"53879504",
   227 => x"86cf2dff",
   228 => x"135372df",
   229 => x"387296f0",
   230 => x"0c028c05",
   231 => x"0d0402ec",
   232 => x"050d810b",
   233 => x"978c0c84",
   234 => x"54d00870",
   235 => x"8f2a7081",
   236 => x"06515153",
   237 => x"72f33872",
   238 => x"d00c86cf",
   239 => x"2dd00870",
   240 => x"8f2a7081",
   241 => x"06515153",
   242 => x"72f33881",
   243 => x"0bd00cb1",
   244 => x"53805284",
   245 => x"d480c051",
   246 => x"85de2d96",
   247 => x"f008812e",
   248 => x"93387282",
   249 => x"2ebd38ff",
   250 => x"135372e5",
   251 => x"38ff1454",
   252 => x"73ffb638",
   253 => x"86cf2d83",
   254 => x"aa52849c",
   255 => x"80c85185",
   256 => x"de2d96f0",
   257 => x"08812e09",
   258 => x"81069238",
   259 => x"85902d96",
   260 => x"f00883ff",
   261 => x"ff065372",
   262 => x"83aa2e91",
   263 => x"3886e82d",
   264 => x"88a80480",
   265 => x"5389f604",
   266 => x"805489c8",
   267 => x"0481ff0b",
   268 => x"d40cb154",
   269 => x"86cf2d8f",
   270 => x"cf538052",
   271 => x"87fc80f7",
   272 => x"5185de2d",
   273 => x"96f00855",
   274 => x"96f00881",
   275 => x"2e098106",
   276 => x"9b3881ff",
   277 => x"0bd40c82",
   278 => x"0a52849c",
   279 => x"80e95185",
   280 => x"de2d96f0",
   281 => x"08802e8d",
   282 => x"3886cf2d",
   283 => x"ff135372",
   284 => x"c93889bb",
   285 => x"0481ff0b",
   286 => x"d40c96f0",
   287 => x"085287fc",
   288 => x"80fa5185",
   289 => x"de2d96f0",
   290 => x"08b13881",
   291 => x"ff0bd40c",
   292 => x"d4085381",
   293 => x"ff0bd40c",
   294 => x"81ff0bd4",
   295 => x"0c81ff0b",
   296 => x"d40c81ff",
   297 => x"0bd40c72",
   298 => x"862a7081",
   299 => x"06765651",
   300 => x"53729538",
   301 => x"96f00854",
   302 => x"89c80473",
   303 => x"822efee8",
   304 => x"38ff1454",
   305 => x"73feed38",
   306 => x"73978c0c",
   307 => x"738b3881",
   308 => x"5287fc80",
   309 => x"d05185de",
   310 => x"2d81ff0b",
   311 => x"d40cd008",
   312 => x"708f2a70",
   313 => x"81065151",
   314 => x"5372f338",
   315 => x"72d00c81",
   316 => x"ff0bd40c",
   317 => x"81537296",
   318 => x"f00c0294",
   319 => x"050d0402",
   320 => x"e8050d78",
   321 => x"55805681",
   322 => x"ff0bd40c",
   323 => x"d008708f",
   324 => x"2a708106",
   325 => x"51515372",
   326 => x"f3388281",
   327 => x"0bd00c81",
   328 => x"ff0bd40c",
   329 => x"775287fc",
   330 => x"80d15185",
   331 => x"de2d96f0",
   332 => x"0880d938",
   333 => x"80dbc6df",
   334 => x"5481ff0b",
   335 => x"d40cd408",
   336 => x"7081ff06",
   337 => x"51537281",
   338 => x"fe2e0981",
   339 => x"069d3880",
   340 => x"ff538590",
   341 => x"2d96f008",
   342 => x"75708405",
   343 => x"570cff13",
   344 => x"53728025",
   345 => x"ed388156",
   346 => x"8af104ff",
   347 => x"145473c9",
   348 => x"3881ff0b",
   349 => x"d40c81ff",
   350 => x"0bd40cd0",
   351 => x"08708f2a",
   352 => x"70810651",
   353 => x"515372f3",
   354 => x"3872d00c",
   355 => x"7596f00c",
   356 => x"0298050d",
   357 => x"0402e805",
   358 => x"0d77797b",
   359 => x"58555580",
   360 => x"53727625",
   361 => x"a3387470",
   362 => x"81055680",
   363 => x"f52d7470",
   364 => x"81055680",
   365 => x"f52d5252",
   366 => x"71712e86",
   367 => x"3881518b",
   368 => x"ca048113",
   369 => x"538ba104",
   370 => x"80517096",
   371 => x"f00c0298",
   372 => x"050d0402",
   373 => x"ec050d76",
   374 => x"5574802e",
   375 => x"bb389a15",
   376 => x"80e02d51",
   377 => x"96982d96",
   378 => x"f00896f0",
   379 => x"089bbc0c",
   380 => x"96f00854",
   381 => x"549b9808",
   382 => x"802e9938",
   383 => x"941580e0",
   384 => x"2d519698",
   385 => x"2d96f008",
   386 => x"902b83ff",
   387 => x"f00a0670",
   388 => x"75075153",
   389 => x"729bbc0c",
   390 => x"9bbc0853",
   391 => x"72802e99",
   392 => x"389b9008",
   393 => x"fe147129",
   394 => x"9ba40805",
   395 => x"9bc00c70",
   396 => x"842b9b9c",
   397 => x"0c548cdf",
   398 => x"049ba808",
   399 => x"9bbc0c9b",
   400 => x"ac089bc0",
   401 => x"0c9b9808",
   402 => x"802e8a38",
   403 => x"9b900884",
   404 => x"2b538cdb",
   405 => x"049bb008",
   406 => x"842b5372",
   407 => x"9b9c0c02",
   408 => x"94050d04",
   409 => x"02d8050d",
   410 => x"800b9b98",
   411 => x"0c845487",
   412 => x"9e2d96f0",
   413 => x"08802e95",
   414 => x"38979052",
   415 => x"805189ff",
   416 => x"2d96f008",
   417 => x"802e8638",
   418 => x"fe548d95",
   419 => x"04ff1454",
   420 => x"738024db",
   421 => x"38735573",
   422 => x"802e84f9",
   423 => x"38805681",
   424 => x"0b9bc40c",
   425 => x"885396d8",
   426 => x"5297c651",
   427 => x"8b952d96",
   428 => x"f008762e",
   429 => x"09810687",
   430 => x"3896f008",
   431 => x"9bc40c88",
   432 => x"5396e452",
   433 => x"97e2518b",
   434 => x"952d96f0",
   435 => x"08873896",
   436 => x"f0089bc4",
   437 => x"0c9bc408",
   438 => x"802e80f6",
   439 => x"389ad60b",
   440 => x"80f52d9a",
   441 => x"d70b80f5",
   442 => x"2d71982b",
   443 => x"71902b07",
   444 => x"9ad80b80",
   445 => x"f52d7088",
   446 => x"2b72079a",
   447 => x"d90b80f5",
   448 => x"2d71079b",
   449 => x"8e0b80f5",
   450 => x"2d9b8f0b",
   451 => x"80f52d71",
   452 => x"882b0753",
   453 => x"5f54525a",
   454 => x"56575573",
   455 => x"81abaa2e",
   456 => x"0981068d",
   457 => x"38755195",
   458 => x"e82d96f0",
   459 => x"08568ebe",
   460 => x"04805573",
   461 => x"82d4d52e",
   462 => x"09810683",
   463 => x"d8389790",
   464 => x"52755189",
   465 => x"ff2d96f0",
   466 => x"085596f0",
   467 => x"08802e83",
   468 => x"c4388853",
   469 => x"96e45297",
   470 => x"e2518b95",
   471 => x"2d96f008",
   472 => x"8938810b",
   473 => x"9b980c8f",
   474 => x"82048853",
   475 => x"96d85297",
   476 => x"c6518b95",
   477 => x"2d805596",
   478 => x"f008752e",
   479 => x"09810683",
   480 => x"94389b8e",
   481 => x"0b80f52d",
   482 => x"547380d5",
   483 => x"2e098106",
   484 => x"80ca389b",
   485 => x"8f0b80f5",
   486 => x"2d547381",
   487 => x"aa2e0981",
   488 => x"06ba3880",
   489 => x"0b97900b",
   490 => x"80f52d56",
   491 => x"547481e9",
   492 => x"2e833881",
   493 => x"547481eb",
   494 => x"2e8c3880",
   495 => x"5573752e",
   496 => x"09810682",
   497 => x"d038979b",
   498 => x"0b80f52d",
   499 => x"55748d38",
   500 => x"979c0b80",
   501 => x"f52d5473",
   502 => x"822e8638",
   503 => x"80559295",
   504 => x"04979d0b",
   505 => x"80f52d70",
   506 => x"9b900cff",
   507 => x"059b940c",
   508 => x"979e0b80",
   509 => x"f52d979f",
   510 => x"0b80f52d",
   511 => x"58760577",
   512 => x"82802905",
   513 => x"709ba00c",
   514 => x"97a00b80",
   515 => x"f52d709b",
   516 => x"b40c9b98",
   517 => x"08595758",
   518 => x"76802e81",
   519 => x"a3388853",
   520 => x"96e45297",
   521 => x"e2518b95",
   522 => x"2d96f008",
   523 => x"81e7389b",
   524 => x"90087084",
   525 => x"2b9b9c0c",
   526 => x"709bb00c",
   527 => x"97b50b80",
   528 => x"f52d97b4",
   529 => x"0b80f52d",
   530 => x"71828029",
   531 => x"0597b60b",
   532 => x"80f52d70",
   533 => x"84808029",
   534 => x"1297b70b",
   535 => x"80f52d70",
   536 => x"81800a29",
   537 => x"12709bb8",
   538 => x"0c9bb408",
   539 => x"71299ba0",
   540 => x"0805709b",
   541 => x"a40c97bd",
   542 => x"0b80f52d",
   543 => x"97bc0b80",
   544 => x"f52d7182",
   545 => x"80290597",
   546 => x"be0b80f5",
   547 => x"2d708480",
   548 => x"80291297",
   549 => x"bf0b80f5",
   550 => x"2d70982b",
   551 => x"81f00a06",
   552 => x"7205709b",
   553 => x"a80cfe11",
   554 => x"7e297705",
   555 => x"9bac0c52",
   556 => x"59524354",
   557 => x"5e515259",
   558 => x"525d5759",
   559 => x"57928e04",
   560 => x"97a20b80",
   561 => x"f52d97a1",
   562 => x"0b80f52d",
   563 => x"71828029",
   564 => x"05709b9c",
   565 => x"0c70a029",
   566 => x"83ff0570",
   567 => x"892a709b",
   568 => x"b00c97a7",
   569 => x"0b80f52d",
   570 => x"97a60b80",
   571 => x"f52d7182",
   572 => x"80290570",
   573 => x"9bb80c7b",
   574 => x"71291e70",
   575 => x"9bac0c7d",
   576 => x"9ba80c73",
   577 => x"059ba40c",
   578 => x"555e5151",
   579 => x"55558051",
   580 => x"8bd32d81",
   581 => x"557496f0",
   582 => x"0c02a805",
   583 => x"0d0402ec",
   584 => x"050d7670",
   585 => x"872c7180",
   586 => x"ff065556",
   587 => x"549b9808",
   588 => x"8a387388",
   589 => x"2c7481ff",
   590 => x"06545597",
   591 => x"90529ba0",
   592 => x"08155189",
   593 => x"ff2d96f0",
   594 => x"085496f0",
   595 => x"08802eb3",
   596 => x"389b9808",
   597 => x"802e9838",
   598 => x"72842997",
   599 => x"90057008",
   600 => x"525395e8",
   601 => x"2d96f008",
   602 => x"f00a0653",
   603 => x"93810472",
   604 => x"10979005",
   605 => x"7080e02d",
   606 => x"52539698",
   607 => x"2d96f008",
   608 => x"53725473",
   609 => x"96f00c02",
   610 => x"94050d04",
   611 => x"02cc050d",
   612 => x"7e605e5a",
   613 => x"800b9bbc",
   614 => x"089bc008",
   615 => x"595c5680",
   616 => x"589b9c08",
   617 => x"782e81ae",
   618 => x"38778f06",
   619 => x"a0175754",
   620 => x"738f3897",
   621 => x"90527651",
   622 => x"81175789",
   623 => x"ff2d9790",
   624 => x"56807680",
   625 => x"f52d5654",
   626 => x"74742e83",
   627 => x"38815474",
   628 => x"81e52e80",
   629 => x"f6388170",
   630 => x"7506555c",
   631 => x"73802e80",
   632 => x"ea388b16",
   633 => x"80f52d98",
   634 => x"06597880",
   635 => x"de388b53",
   636 => x"7c527551",
   637 => x"8b952d96",
   638 => x"f00880cf",
   639 => x"389c1608",
   640 => x"5195e82d",
   641 => x"96f00884",
   642 => x"1b0c9a16",
   643 => x"80e02d51",
   644 => x"96982d96",
   645 => x"f00896f0",
   646 => x"08881c0c",
   647 => x"96f00855",
   648 => x"559b9808",
   649 => x"802e9838",
   650 => x"941680e0",
   651 => x"2d519698",
   652 => x"2d96f008",
   653 => x"902b83ff",
   654 => x"f00a0670",
   655 => x"16515473",
   656 => x"881b0c78",
   657 => x"7a0c7b54",
   658 => x"958c0481",
   659 => x"18589b9c",
   660 => x"087826fe",
   661 => x"d4389b98",
   662 => x"08802eae",
   663 => x"387a5192",
   664 => x"9e2d96f0",
   665 => x"0896f008",
   666 => x"80ffffff",
   667 => x"f806555b",
   668 => x"7380ffff",
   669 => x"fff82e92",
   670 => x"3896f008",
   671 => x"fe059b90",
   672 => x"08299ba4",
   673 => x"08055793",
   674 => x"9f048054",
   675 => x"7396f00c",
   676 => x"02b4050d",
   677 => x"0402f405",
   678 => x"0d747008",
   679 => x"8105710c",
   680 => x"70089b94",
   681 => x"08065353",
   682 => x"718e3888",
   683 => x"13085192",
   684 => x"9e2d96f0",
   685 => x"0888140c",
   686 => x"810b96f0",
   687 => x"0c028c05",
   688 => x"0d0402f0",
   689 => x"050d7588",
   690 => x"1108fe05",
   691 => x"9b900829",
   692 => x"9ba40811",
   693 => x"72089b94",
   694 => x"08060579",
   695 => x"55535454",
   696 => x"89ff2d02",
   697 => x"90050d04",
   698 => x"02f4050d",
   699 => x"7470882a",
   700 => x"83fe8006",
   701 => x"7072982a",
   702 => x"0772882b",
   703 => x"87fc8080",
   704 => x"0673982b",
   705 => x"81f00a06",
   706 => x"71730707",
   707 => x"96f00c56",
   708 => x"51535102",
   709 => x"8c050d04",
   710 => x"02f8050d",
   711 => x"028e0580",
   712 => x"f52d7488",
   713 => x"2b077083",
   714 => x"ffff0696",
   715 => x"f00c5102",
   716 => x"88050d04",
   717 => x"719bc80c",
   718 => x"04000000",
   719 => x"00ffffff",
   720 => x"ff00ffff",
   721 => x"ffff00ff",
   722 => x"ffffff00",
   723 => x"434f4c4f",--COLO
   724 => x"4e593720",--NY7
   725 => x"524f4d00",--ROM
   726 => x"46415431",
   727 => x"36202020",
   728 => x"00000000",
   729 => x"46415433",
   730 => x"32202020",
   731 => x"00202020",
	others => x"00000000"
);

begin

process (clk)
begin
	if (clk'event and clk = '1') then
		if (from_zpu.memAWriteEnable = '1') and (from_zpu.memBWriteEnable = '1') and (from_zpu.memAAddr=from_zpu.memBAddr) and (from_zpu.memAWrite/=from_zpu.memBWrite) then
			report "write collision" severity failure;
		end if;
	
		if (from_zpu.memAWriteEnable = '1') then
			ram(to_integer(unsigned(from_zpu.memAAddr(maxAddrBitBRAM downto 2)))) := from_zpu.memAWrite;
			to_zpu.memARead <= from_zpu.memAWrite;
		else
			to_zpu.memARead <= ram(to_integer(unsigned(from_zpu.memAAddr(maxAddrBitBRAM downto 2))));
		end if;
	end if;
end process;

process (clk)
begin
	if (clk'event and clk = '1') then
		if (from_zpu.memBWriteEnable = '1') then
			ram(to_integer(unsigned(from_zpu.memBAddr(maxAddrBitBRAM downto 2)))) := from_zpu.memBWrite;
			to_zpu.memBRead <= from_zpu.memBWrite;
		else
			to_zpu.memBRead <= ram(to_integer(unsigned(from_zpu.memBAddr(maxAddrBitBRAM downto 2))));
		end if;
	end if;
end process;


end arch;

