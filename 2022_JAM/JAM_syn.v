/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Sat Mar  7 22:00:44 2026
/////////////////////////////////////////////////////////////


module JAM_DW01_add_0 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3;
  wire   [9:1] carry;

  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XNOR2X1 U2 ( .A(A[9]), .B(n3), .Y(SUM[9]) );
  XOR2XL U3 ( .A(A[8]), .B(n2), .Y(SUM[8]) );
  XOR2XL U4 ( .A(A[7]), .B(carry[7]), .Y(SUM[7]) );
  XOR2XL U5 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  NAND2X1 U6 ( .A(A[8]), .B(n2), .Y(n3) );
  AND2X2 U7 ( .A(A[7]), .B(carry[7]), .Y(n2) );
endmodule


module JAM ( CLK, RST, W, J, Cost, MatchCount, MinCost, Valid );
  output [2:0] W;
  output [2:0] J;
  input [6:0] Cost;
  output [3:0] MatchCount;
  output [9:0] MinCost;
  input CLK, RST;
  output Valid;
  wire   N115, N116, N117, n503, n504, n505, n506, n507, n508, n509, n510,
         n511, \arr[0][2] , \arr[0][1] , \arr[0][0] , \arr[1][2] , \arr[1][1] ,
         \arr[1][0] , \arr[2][2] , \arr[2][1] , \arr[2][0] , \arr[3][2] ,
         \arr[3][1] , \arr[3][0] , \arr[4][2] , \arr[4][1] , \arr[4][0] ,
         \arr[5][2] , \arr[5][1] , \arr[5][0] , \arr[6][2] , \arr[6][1] ,
         \arr[6][0] , \arr[7][2] , \arr[7][1] , \arr[7][0] , \C[7][2] ,
         \C[7][1] , \C[7][0] , \C[6][2] , \C[6][1] , \C[6][0] , \C[5][2] ,
         \C[5][1] , \C[5][0] , \C[4][2] , \C[4][1] , \C[4][0] , \C[3][2] ,
         \C[3][1] , \C[3][0] , \C[2][2] , \C[2][1] , \C[2][0] , \C[1][2] ,
         \C[1][1] , \C[1][0] , N174, N175, N176, N177, N178, N179, N180, N181,
         N182, N183, N188, N189, N214, N215, N216, N288, N289, N290, n53, n55,
         n57, n59, n61, n63, n68, n69, n70, n71, n73, n74, n75, n77, n79, n80,
         n82, n83, n95, n97, n98, n99, n100, n101, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n118, n121, n122,
         n123, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n163, n164, n165, n166, n167, n168, n169, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n203, n205, n206,
         n209, n211, n212, n213, n214, n215, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n336,
         n337, n338, n339, n352, n353, n355, n356, n357, n358, n359, n360,
         n361, n362, n363, n364, n365, n366, n367, n368, n369, n370, n371,
         n372, n373, n374, n375, n376, n377, n378, n379, n380, n381, n382,
         n383, n384, n388, n389, n390, n391, n392, n393, n394, n395, n396,
         n397, n398, n399, n400, n401, n402, n403, n404, n405, n406, n407,
         n408, n409, n410, n411, n412, n413, n414, n415, n416, n417, n418,
         n419, n420, n421, n422, n423, n424, n425, n426, n427, n428, n429,
         n430, n431, n432, n433, n434, n435, n436, n437, n438, n439, n440,
         n441, n442, n443, n444, n445, n446, n447, n448, n449, n450, n451,
         n452, n453, n454, n455, n456, n457, n458, n459, n460, n461, n462,
         n463, n464, n465, n466, n467, n468, n469, n470, n471, n472, n473,
         n474, n475, n476, n477, n478, n479, n480, n481, n482, n483, n484,
         n485, n486, n487, n488, n489, n490, n491, n492, n493, n494, n495,
         n496, n497, n498, n499;
  wire   [1:0] ns;
  wire   [2:0] idx;
  wire   [9:0] sum;

  OAI31X2 U120 ( .A0(n138), .A1(n487), .A2(n362), .B0(n109), .Y(n137) );
  JAM_DW01_add_0 add_113 ( .A(sum), .B({1'b0, 1'b0, 1'b0, Cost}), .CI(1'b0), 
        .SUM({N183, N182, N181, N180, N179, N178, N177, N176, N175, N174}) );
  DFFRX1 \C_reg[2][0]  ( .D(n269), .CK(CLK), .RN(n367), .Q(\C[2][0] ), .QN(
        n198) );
  DFFRX1 \C_reg[6][0]  ( .D(n281), .CK(CLK), .RN(n367), .Q(\C[6][0] ), .QN(
        n226) );
  DFFRX1 \C_reg[4][0]  ( .D(n275), .CK(CLK), .RN(n368), .Q(\C[4][0] ), .QN(
        n196) );
  DFFRX1 \C_reg[4][1]  ( .D(n274), .CK(CLK), .RN(n368), .Q(\C[4][1] ), .QN(
        n197) );
  DFFRX1 \arr_reg[2][0]  ( .D(n290), .CK(CLK), .RN(n368), .Q(\arr[2][0] ), 
        .QN(n189) );
  DFFRX1 \arr_reg[0][0]  ( .D(n284), .CK(CLK), .RN(n368), .Q(\arr[0][0] ), 
        .QN(n195) );
  DFFRX1 \arr_reg[0][1]  ( .D(n285), .CK(CLK), .RN(n368), .Q(\arr[0][1] ), 
        .QN(n194) );
  DFFRX1 \arr_reg[0][2]  ( .D(n286), .CK(CLK), .RN(n368), .Q(\arr[0][2] ), 
        .QN(n193) );
  DFFRX1 \arr_reg[1][1]  ( .D(n288), .CK(CLK), .RN(n368), .Q(\arr[1][1] ), 
        .QN(n191) );
  DFFRX1 \arr_reg[1][2]  ( .D(n289), .CK(CLK), .RN(n368), .Q(\arr[1][2] ), 
        .QN(n190) );
  DFFRX1 \arr_reg[2][2]  ( .D(n292), .CK(CLK), .RN(n368), .Q(\arr[2][2] ), 
        .QN(n187) );
  DFFRX1 \arr_reg[3][2]  ( .D(n295), .CK(CLK), .RN(n368), .Q(\arr[3][2] ), 
        .QN(n184) );
  DFFRX1 \arr_reg[6][0]  ( .D(n302), .CK(CLK), .RN(n366), .Q(\arr[6][0] ), 
        .QN(n177) );
  DFFRX1 \C_reg[2][2]  ( .D(n267), .CK(CLK), .RN(n367), .Q(\C[2][2] ), .QN(
        n200) );
  DFFRX1 \C_reg[2][1]  ( .D(n268), .CK(CLK), .RN(n367), .Q(\C[2][1] ), .QN(
        n199) );
  DFFRX1 \C_reg[3][2]  ( .D(n270), .CK(CLK), .RN(n366), .Q(\C[3][2] ), .QN(
        n231) );
  DFFRX1 \C_reg[3][0]  ( .D(n272), .CK(CLK), .RN(n367), .Q(\C[3][0] ), .QN(
        n233) );
  DFFRX1 \C_reg[3][1]  ( .D(n271), .CK(CLK), .RN(n368), .Q(\C[3][1] ), .QN(
        n232) );
  DFFRX1 \C_reg[6][2]  ( .D(n279), .CK(CLK), .RN(n366), .Q(\C[6][2] ), .QN(
        n224) );
  DFFRX1 \C_reg[6][1]  ( .D(n280), .CK(CLK), .RN(n367), .Q(\C[6][1] ), .QN(
        n225) );
  DFFRX1 \C_reg[1][1]  ( .D(n265), .CK(CLK), .RN(n367), .Q(\C[1][1] ), .QN(
        n235) );
  DFFRX1 \C_reg[1][0]  ( .D(n266), .CK(CLK), .RN(n367), .Q(\C[1][0] ), .QN(
        n236) );
  DFFRX1 \C_reg[1][2]  ( .D(n264), .CK(CLK), .RN(n367), .Q(\C[1][2] ), .QN(
        n234) );
  DFFRX1 \C_reg[7][2]  ( .D(n305), .CK(CLK), .RN(n367), .Q(\C[7][2] ), .QN(
        n221) );
  DFFRX1 \C_reg[7][0]  ( .D(n283), .CK(CLK), .RN(n367), .Q(\C[7][0] ), .QN(
        n223) );
  DFFRX1 \C_reg[7][1]  ( .D(n282), .CK(CLK), .RN(n367), .Q(\C[7][1] ), .QN(
        n222) );
  DFFRX1 \C_reg[4][2]  ( .D(n273), .CK(CLK), .RN(n367), .Q(\C[4][2] ), .QN(
        n230) );
  DFFRX1 \arr_reg[4][0]  ( .D(n296), .CK(CLK), .RN(n368), .Q(\arr[4][0] ), 
        .QN(n183) );
  DFFRX1 \arr_reg[4][1]  ( .D(n297), .CK(CLK), .RN(n366), .Q(\arr[4][1] ), 
        .QN(n182) );
  DFFRX1 \arr_reg[5][1]  ( .D(n300), .CK(CLK), .RN(n368), .Q(\arr[5][1] ), 
        .QN(n179) );
  DFFRX1 \C_reg[5][2]  ( .D(n276), .CK(CLK), .RN(n367), .Q(\C[5][2] ), .QN(
        n227) );
  DFFRX1 \C_reg[5][1]  ( .D(n277), .CK(CLK), .RN(n368), .Q(\C[5][1] ), .QN(
        n228) );
  DFFRX1 \C_reg[5][0]  ( .D(n278), .CK(CLK), .RN(n366), .Q(\C[5][0] ), .QN(
        n229) );
  DFFRX2 \cnt_reg[1]  ( .D(n307), .CK(CLK), .RN(n366), .QN(n213) );
  DFFRX2 \cnt_reg[0]  ( .D(n308), .CK(CLK), .RN(n366), .QN(n171) );
  DFFRX1 \MatchCount_reg[1]  ( .D(n242), .CK(CLK), .RN(n366), .QN(n238) );
  DFFRX1 \MatchCount_reg[2]  ( .D(n241), .CK(CLK), .RN(n366), .QN(n237) );
  DFFRX1 Valid_reg ( .D(n215), .CK(CLK), .RN(n366), .Q(n511), .QN(n214) );
  DFFRX1 \cs_reg[1]  ( .D(ns[1]), .CK(CLK), .RN(n471), .Q(n481), .QN(n220) );
  DFFSX1 \MinCost_reg[9]  ( .D(n244), .CK(CLK), .SN(n471), .QN(n464) );
  DFFSX1 \MinCost_reg[8]  ( .D(n245), .CK(CLK), .SN(n471), .Q(n504), .QN(n209)
         );
  DFFSX1 \MinCost_reg[7]  ( .D(n246), .CK(CLK), .SN(n471), .QN(n463) );
  DFFSX1 \MinCost_reg[6]  ( .D(n247), .CK(CLK), .SN(n471), .QN(n462) );
  DFFSX1 \MinCost_reg[5]  ( .D(n248), .CK(CLK), .SN(n471), .Q(n505), .QN(n206)
         );
  DFFSX1 \MinCost_reg[4]  ( .D(n249), .CK(CLK), .SN(n471), .Q(n506), .QN(n205)
         );
  DFFSX1 \MinCost_reg[3]  ( .D(n250), .CK(CLK), .SN(n471), .Q(n507), .QN(n461)
         );
  DFFSX1 \MinCost_reg[2]  ( .D(n251), .CK(CLK), .SN(n471), .Q(n508), .QN(n203)
         );
  DFFSX1 \MinCost_reg[1]  ( .D(n252), .CK(CLK), .SN(n471), .Q(n509), .QN(n460)
         );
  DFFSX1 \MinCost_reg[0]  ( .D(n253), .CK(CLK), .SN(n471), .Q(n510), .QN(n201)
         );
  DFFSX1 \arr_reg[7][2]  ( .D(n217), .CK(CLK), .SN(n471), .Q(\arr[7][2] ), 
        .QN(n172) );
  DFFSX1 \arr_reg[7][1]  ( .D(n218), .CK(CLK), .SN(n471), .Q(\arr[7][1] ), 
        .QN(n173) );
  DFFSX1 \arr_reg[7][0]  ( .D(n219), .CK(CLK), .SN(n471), .Q(\arr[7][0] ), 
        .QN(n174) );
  DFFSX1 \arr_reg[6][2]  ( .D(n304), .CK(CLK), .SN(n471), .Q(\arr[6][2] ), 
        .QN(n175) );
  DFFSX1 \arr_reg[6][1]  ( .D(n303), .CK(CLK), .SN(n471), .Q(\arr[6][1] ), 
        .QN(n176) );
  DFFSX1 \arr_reg[2][1]  ( .D(n291), .CK(CLK), .SN(n471), .Q(\arr[2][1] ), 
        .QN(n188) );
  DFFSX1 \arr_reg[3][1]  ( .D(n294), .CK(CLK), .SN(n471), .Q(\arr[3][1] ), 
        .QN(n185) );
  DFFSX1 \arr_reg[3][0]  ( .D(n293), .CK(CLK), .SN(n471), .Q(\arr[3][0] ), 
        .QN(n186) );
  DFFSX1 \arr_reg[1][0]  ( .D(n287), .CK(CLK), .SN(n471), .Q(\arr[1][0] ), 
        .QN(n192) );
  DFFSX1 \arr_reg[4][2]  ( .D(n298), .CK(CLK), .SN(n471), .Q(\arr[4][2] ), 
        .QN(n181) );
  DFFSX1 \arr_reg[5][2]  ( .D(n301), .CK(CLK), .SN(n471), .Q(\arr[5][2] ), 
        .QN(n178) );
  DFFSX1 \arr_reg[5][0]  ( .D(n299), .CK(CLK), .SN(n471), .Q(\arr[5][0] ), 
        .QN(n180) );
  DFFRX1 \cs_reg[0]  ( .D(ns[0]), .CK(CLK), .RN(n471), .Q(ns[1]), .QN(n479) );
  DFFRX1 \sum_reg[0]  ( .D(n263), .CK(CLK), .RN(n471), .Q(sum[0]), .QN(n494)
         );
  DFFRX1 \sum_reg[1]  ( .D(n262), .CK(CLK), .RN(n471), .Q(sum[1]), .QN(n470)
         );
  DFFRX1 \sum_reg[2]  ( .D(n261), .CK(CLK), .RN(n471), .Q(sum[2]), .QN(n495)
         );
  DFFRX1 \sum_reg[3]  ( .D(n260), .CK(CLK), .RN(n471), .Q(sum[3]), .QN(n496)
         );
  DFFRX1 \sum_reg[4]  ( .D(n259), .CK(CLK), .RN(n471), .Q(sum[4]), .QN(n469)
         );
  DFFRX1 \sum_reg[5]  ( .D(n258), .CK(CLK), .RN(n471), .Q(sum[5]), .QN(n468)
         );
  DFFRX1 \sum_reg[6]  ( .D(n257), .CK(CLK), .RN(n471), .Q(sum[6]), .QN(n497)
         );
  DFFRX1 \sum_reg[7]  ( .D(n256), .CK(CLK), .RN(n471), .Q(sum[7]), .QN(n498)
         );
  DFFRX1 \sum_reg[8]  ( .D(n255), .CK(CLK), .RN(n471), .Q(sum[8]), .QN(n466)
         );
  DFFRX1 \sum_reg[9]  ( .D(n254), .CK(CLK), .RN(n471), .Q(sum[9]), .QN(n499)
         );
  DFFSX1 \MatchCount_reg[0]  ( .D(n243), .CK(CLK), .SN(n471), .QN(n239) );
  DFFRX1 \cnt_reg[2]  ( .D(n306), .CK(CLK), .RN(n366), .Q(n339), .QN(n212) );
  DFFRX1 \MatchCount_reg[3]  ( .D(n240), .CK(CLK), .RN(n366), .QN(n211) );
  NOR2X2 U233 ( .A(n436), .B(n365), .Y(n432) );
  NOR2X2 U234 ( .A(n405), .B(N116), .Y(n398) );
  OA22X1 U235 ( .A0(n403), .A1(n127), .B0(N117), .B1(n402), .Y(n336) );
  OA22X1 U236 ( .A0(n127), .A1(n395), .B0(N117), .B1(n394), .Y(n338) );
  OA22X1 U237 ( .A0(n127), .A1(n391), .B0(N117), .B1(n390), .Y(n337) );
  OAI211X4 U238 ( .A0(n493), .A1(n168), .B0(n160), .C0(n164), .Y(idx[0]) );
  BUFX4 U239 ( .A(idx[2]), .Y(n361) );
  INVX16 U240 ( .A(n239), .Y(MatchCount[0]) );
  INVX6 U241 ( .A(RST), .Y(n471) );
  OAI22X1 U242 ( .A0(sum[9]), .A1(n464), .B0(n465), .B1(n453), .Y(N188) );
  BUFX12 U243 ( .A(n505), .Y(MinCost[5]) );
  NAND2X2 U244 ( .A(N288), .B(idx[0]), .Y(n127) );
  INVX12 U245 ( .A(n212), .Y(W[2]) );
  BUFX12 U246 ( .A(n511), .Y(Valid) );
  INVX16 U247 ( .A(n211), .Y(MatchCount[3]) );
  INVX16 U248 ( .A(n237), .Y(MatchCount[2]) );
  INVX16 U249 ( .A(n238), .Y(MatchCount[1]) );
  INVX16 U250 ( .A(n171), .Y(W[0]) );
  INVX12 U251 ( .A(n213), .Y(W[1]) );
  BUFX12 U252 ( .A(n508), .Y(MinCost[2]) );
  INVX12 U253 ( .A(n464), .Y(MinCost[9]) );
  INVX12 U254 ( .A(n462), .Y(MinCost[6]) );
  INVX12 U255 ( .A(n463), .Y(MinCost[7]) );
  BUFX12 U256 ( .A(n510), .Y(MinCost[0]) );
  NOR2BXL U257 ( .AN(n510), .B(sum[0]), .Y(n443) );
  INVX12 U258 ( .A(n460), .Y(MinCost[1]) );
  AO21XL U259 ( .A0(n470), .A1(n443), .B0(n509), .Y(n442) );
  INVX12 U260 ( .A(n461), .Y(MinCost[3]) );
  BUFX12 U261 ( .A(n506), .Y(MinCost[4]) );
  BUFX12 U262 ( .A(n504), .Y(MinCost[8]) );
  AOI32XL U263 ( .A0(n452), .A1(n467), .A2(n451), .B0(n504), .B1(n466), .Y(
        n453) );
  CLKBUFX6 U264 ( .A(n488), .Y(n365) );
  CLKINVX1 U265 ( .A(idx[0]), .Y(n488) );
  CLKINVX1 U266 ( .A(n485), .Y(n352) );
  NAND2XL U267 ( .A(n359), .B(idx[0]), .Y(n129) );
  INVX1 U268 ( .A(N115), .Y(n405) );
  CLKINVX1 U269 ( .A(N116), .Y(n404) );
  NAND3BX1 U270 ( .AN(n55), .B(n492), .C(n57), .Y(n160) );
  NOR2BXL U271 ( .AN(sum[3]), .B(n507), .Y(n457) );
  NOR2XL U272 ( .A(n469), .B(n506), .Y(n456) );
  NOR2XL U273 ( .A(n468), .B(n505), .Y(n448) );
  NOR3BX1 U274 ( .AN(n166), .B(n230), .C(n165), .Y(n57) );
  NAND3X1 U275 ( .A(n235), .B(n236), .C(n234), .Y(n164) );
  AO21X1 U276 ( .A0(n229), .A1(n228), .B0(n227), .Y(n165) );
  NOR2XL U277 ( .A(n466), .B(n504), .Y(n441) );
  NOR2BXL U278 ( .AN(sum[0]), .B(n510), .Y(n438) );
  OAI21X1 U279 ( .A0(n362), .A1(n68), .B0(n70), .Y(n63) );
  NOR2BX1 U280 ( .AN(n144), .B(n362), .Y(n142) );
  INVX1 U281 ( .A(n361), .Y(n436) );
  OAI21X1 U282 ( .A0(n362), .A1(n148), .B0(n116), .Y(n147) );
  AOI2BB1X1 U283 ( .A0N(n152), .A1N(n113), .B0(n362), .Y(n151) );
  OAI21XL U284 ( .A0(n113), .A1(n490), .B0(n477), .Y(n115) );
  NAND3XL U285 ( .A(n361), .B(n422), .C(n475), .Y(n116) );
  INVX1 U286 ( .A(n361), .Y(n491) );
  OA21XL U287 ( .A0(n365), .A1(n422), .B0(n491), .Y(n107) );
  NAND3BXL U288 ( .AN(N188), .B(n455), .C(n454), .Y(n458) );
  INVXL U289 ( .A(n169), .Y(n493) );
  NOR2BX1 U290 ( .AN(n134), .B(n362), .Y(n132) );
  NAND3X1 U291 ( .A(n477), .B(idx[0]), .C(n490), .Y(n70) );
  NAND2X1 U292 ( .A(n361), .B(n360), .Y(n114) );
  OA21XL U293 ( .A0(n75), .A1(MatchCount[0]), .B0(n80), .Y(n79) );
  NAND2X1 U294 ( .A(n353), .B(n364), .Y(n80) );
  OAI32XL U295 ( .A0(MatchCount[2]), .A1(n238), .A2(n74), .B0(n237), .B1(n77), 
        .Y(n241) );
  NAND2XL U296 ( .A(sum[2]), .B(n203), .Y(n454) );
  NAND2XL U297 ( .A(n160), .B(n161), .Y(idx[1]) );
  AOI31XL U298 ( .A0(n55), .A1(n492), .A2(n57), .B0(n481), .Y(n53) );
  NAND2X1 U299 ( .A(n220), .B(n479), .Y(n97) );
  NAND2X1 U300 ( .A(N289), .B(idx[0]), .Y(n128) );
  OAI22X1 U301 ( .A0(n437), .A1(n428), .B0(n360), .B1(n427), .Y(N289) );
  OR3X2 U302 ( .A(n75), .B(n481), .C(n479), .Y(n353) );
  NAND3BXL U303 ( .AN(n75), .B(n80), .C(MatchCount[0]), .Y(n74) );
  NAND2X1 U304 ( .A(n137), .B(n138), .Y(n135) );
  NAND2X1 U305 ( .A(n487), .B(n155), .Y(n154) );
  NAND2BX1 U306 ( .AN(n138), .B(n137), .Y(n136) );
  NAND2X1 U307 ( .A(n142), .B(n143), .Y(n140) );
  NAND2BX1 U308 ( .AN(n68), .B(n63), .Y(n61) );
  NAND2BX1 U309 ( .AN(n152), .B(n151), .Y(n150) );
  NAND2BX1 U310 ( .AN(n143), .B(n142), .Y(n141) );
  NAND2X1 U311 ( .A(n68), .B(n63), .Y(n59) );
  NAND2X1 U312 ( .A(n152), .B(n151), .Y(n149) );
  NAND3X1 U313 ( .A(n486), .B(n487), .C(n485), .Y(n68) );
  NAND2X1 U314 ( .A(n147), .B(n148), .Y(n145) );
  NAND2BX1 U315 ( .AN(n148), .B(n147), .Y(n146) );
  CLKINVX1 U316 ( .A(n126), .Y(n474) );
  NAND2X1 U317 ( .A(n115), .B(n116), .Y(n111) );
  NAND2X1 U318 ( .A(n108), .B(n491), .Y(n110) );
  NAND2X1 U319 ( .A(n107), .B(n105), .Y(n106) );
  CLKINVX1 U320 ( .A(n115), .Y(n473) );
  CLKINVX1 U321 ( .A(n123), .Y(n475) );
  CLKINVX1 U322 ( .A(n128), .Y(N116) );
  NOR2BX1 U323 ( .AN(n365), .B(n361), .Y(n429) );
  CLKINVX1 U324 ( .A(n159), .Y(n492) );
  OAI32X4 U325 ( .A0(n138), .A1(n362), .A2(n127), .B0(n114), .B1(n123), .Y(
        n155) );
  OAI31XL U326 ( .A0(n422), .A1(n361), .A2(n365), .B0(n143), .Y(n144) );
  NAND2X1 U327 ( .A(n155), .B(n127), .Y(n153) );
  NOR3X1 U328 ( .A(n127), .B(n486), .C(n352), .Y(n152) );
  CLKINVX1 U329 ( .A(n128), .Y(n486) );
  NAND2X1 U330 ( .A(n486), .B(n352), .Y(n138) );
  NAND3X1 U331 ( .A(n486), .B(n127), .C(n485), .Y(n143) );
  CLKINVX1 U332 ( .A(n127), .Y(N117) );
  CLKINVX1 U333 ( .A(n129), .Y(N115) );
  NAND4X1 U334 ( .A(n477), .B(n127), .C(n128), .D(n352), .Y(n126) );
  CLKINVX1 U335 ( .A(n127), .Y(n487) );
  NAND3X1 U336 ( .A(n128), .B(n352), .C(n487), .Y(n148) );
  NAND3X1 U337 ( .A(n127), .B(n128), .C(n485), .Y(n133) );
  CLKINVX1 U338 ( .A(n129), .Y(n485) );
  NAND2X1 U339 ( .A(n132), .B(n133), .Y(n130) );
  NAND2BX1 U340 ( .AN(n133), .B(n132), .Y(n131) );
  AOI31X1 U341 ( .A0(n365), .A1(n491), .A2(n422), .B0(n362), .Y(n98) );
  OAI21X1 U342 ( .A0(n114), .A1(n123), .B0(n70), .Y(n121) );
  NOR2X1 U343 ( .A(n362), .B(n107), .Y(n108) );
  NAND2BX1 U344 ( .AN(n108), .B(n109), .Y(n105) );
  NAND3BX1 U345 ( .AN(n113), .B(n114), .C(n111), .Y(n112) );
  NAND3X1 U346 ( .A(n437), .B(n491), .C(n98), .Y(n100) );
  NAND2X1 U347 ( .A(n473), .B(n114), .Y(n118) );
  NAND2X1 U348 ( .A(n121), .B(n365), .Y(n122) );
  NAND2X1 U349 ( .A(n477), .B(n365), .Y(n123) );
  CLKINVX1 U350 ( .A(n114), .Y(n490) );
  CLKINVX1 U351 ( .A(n362), .Y(n477) );
  CLKINVX1 U352 ( .A(n70), .Y(n476) );
  CLKBUFX3 U353 ( .A(n366), .Y(n368) );
  CLKBUFX3 U354 ( .A(n366), .Y(n367) );
  NAND2BX1 U355 ( .AN(N188), .B(N189), .Y(n75) );
  OA21XL U356 ( .A0(n75), .A1(MatchCount[1]), .B0(n79), .Y(n77) );
  OAI21XL U357 ( .A0(n57), .A1(n159), .B0(n160), .Y(idx[2]) );
  NAND3X1 U358 ( .A(n167), .B(n164), .C(n169), .Y(n159) );
  INVX3 U359 ( .A(n364), .Y(n480) );
  CLKINVX1 U360 ( .A(n360), .Y(n437) );
  XNOR2X2 U361 ( .A(N289), .B(n359), .Y(n101) );
  OAI31XL U362 ( .A0(n365), .A1(n361), .A2(n360), .B0(n133), .Y(n134) );
  CLKXOR2X1 U363 ( .A(n156), .B(N288), .Y(n99) );
  NAND2XL U364 ( .A(N289), .B(n359), .Y(n156) );
  OAI2BB2XL U365 ( .B0(n497), .B1(n363), .A0N(N180), .A1N(n478), .Y(n257) );
  OAI2BB2XL U366 ( .B0(n495), .B1(n363), .A0N(N176), .A1N(n478), .Y(n261) );
  OAI2BB2XL U367 ( .B0(n496), .B1(n363), .A0N(N177), .A1N(n478), .Y(n260) );
  OAI2BB2XL U368 ( .B0(n468), .B1(n363), .A0N(N179), .A1N(n478), .Y(n258) );
  OAI2BB2XL U369 ( .B0(n469), .B1(n363), .A0N(N178), .A1N(n478), .Y(n259) );
  NOR2BX1 U370 ( .AN(n365), .B(n360), .Y(n415) );
  OAI2BB2XL U371 ( .B0(n470), .B1(n363), .A0N(N175), .A1N(n478), .Y(n262) );
  CLKINVX1 U372 ( .A(n360), .Y(n422) );
  NOR3X1 U373 ( .A(n365), .B(n360), .C(n491), .Y(n113) );
  NAND3X1 U374 ( .A(n360), .B(n491), .C(n475), .Y(n109) );
  CLKBUFX3 U375 ( .A(n69), .Y(n362) );
  NAND2X1 U376 ( .A(n479), .B(n481), .Y(n69) );
  INVX3 U377 ( .A(n97), .Y(n478) );
  CLKINVX1 U378 ( .A(n158), .Y(n472) );
  CLKBUFX3 U379 ( .A(n95), .Y(n363) );
  NAND2X1 U380 ( .A(n97), .B(n362), .Y(n95) );
  CLKBUFX3 U381 ( .A(n471), .Y(n366) );
  CLKINVX1 U382 ( .A(n455), .Y(n465) );
  CLKINVX1 U383 ( .A(n441), .Y(n467) );
  OA21XL U384 ( .A0(n230), .A1(n489), .B0(n167), .Y(n168) );
  CLKINVX1 U385 ( .A(n165), .Y(n489) );
  OAI222XL U386 ( .A0(n59), .A1(n336), .B0(n61), .B1(n484), .C0(n172), .C1(n63), .Y(n217) );
  OAI222XL U387 ( .A0(n59), .A1(n338), .B0(n61), .B1(n483), .C0(n173), .C1(n63), .Y(n218) );
  OAI222XL U388 ( .A0(n59), .A1(n337), .B0(n61), .B1(n482), .C0(n174), .C1(n63), .Y(n219) );
  OAI222XL U389 ( .A0(n336), .A1(n153), .B0(n484), .B1(n154), .C0(n175), .C1(
        n155), .Y(n304) );
  OAI222XL U390 ( .A0(n338), .A1(n153), .B0(n483), .B1(n154), .C0(n176), .C1(
        n155), .Y(n303) );
  OAI222XL U391 ( .A0(n336), .A1(n145), .B0(n484), .B1(n146), .C0(n181), .C1(
        n147), .Y(n298) );
  OAI222XL U392 ( .A0(n338), .A1(n135), .B0(n483), .B1(n136), .C0(n188), .C1(
        n137), .Y(n291) );
  OAI222XL U393 ( .A0(n338), .A1(n140), .B0(n483), .B1(n141), .C0(n185), .C1(
        n142), .Y(n294) );
  OAI222XL U394 ( .A0(n337), .A1(n140), .B0(n482), .B1(n141), .C0(n186), .C1(
        n142), .Y(n293) );
  OAI222XL U395 ( .A0(n337), .A1(n130), .B0(n482), .B1(n131), .C0(n192), .C1(
        n132), .Y(n287) );
  OAI222XL U396 ( .A0(n484), .A1(n149), .B0(n336), .B1(n150), .C0(n178), .C1(
        n151), .Y(n301) );
  OAI222XL U397 ( .A0(n482), .A1(n149), .B0(n337), .B1(n150), .C0(n180), .C1(
        n151), .Y(n299) );
  OAI222XL U398 ( .A0(n337), .A1(n153), .B0(n482), .B1(n154), .C0(n177), .C1(
        n155), .Y(n302) );
  OAI222XL U399 ( .A0(n338), .A1(n145), .B0(n483), .B1(n146), .C0(n182), .C1(
        n147), .Y(n297) );
  OAI222XL U400 ( .A0(n337), .A1(n145), .B0(n482), .B1(n146), .C0(n183), .C1(
        n147), .Y(n296) );
  OAI222XL U401 ( .A0(n336), .A1(n135), .B0(n484), .B1(n136), .C0(n187), .C1(
        n137), .Y(n292) );
  OAI222XL U402 ( .A0(n337), .A1(n135), .B0(n482), .B1(n136), .C0(n189), .C1(
        n137), .Y(n290) );
  OAI222XL U403 ( .A0(n336), .A1(n140), .B0(n484), .B1(n141), .C0(n184), .C1(
        n142), .Y(n295) );
  OAI222XL U404 ( .A0(n336), .A1(n130), .B0(n484), .B1(n131), .C0(n190), .C1(
        n132), .Y(n289) );
  OAI222XL U405 ( .A0(n338), .A1(n130), .B0(n483), .B1(n131), .C0(n191), .C1(
        n132), .Y(n288) );
  OAI222XL U406 ( .A0(n483), .A1(n149), .B0(n338), .B1(n150), .C0(n179), .C1(
        n151), .Y(n300) );
  INVX12 U407 ( .A(n355), .Y(J[0]) );
  AOI2BB2X1 U408 ( .B0(n339), .B1(n356), .A0N(n339), .A1N(n371), .Y(n355) );
  INVX12 U409 ( .A(n357), .Y(J[1]) );
  AOI2BB2X1 U410 ( .B0(n339), .B1(n358), .A0N(n339), .A1N(n375), .Y(n357) );
  CLKINVX1 U411 ( .A(n372), .Y(n356) );
  CLKINVX1 U412 ( .A(n376), .Y(n358) );
  AND2X2 U413 ( .A(n171), .B(n213), .Y(n378) );
  AO21X1 U414 ( .A0(n71), .A1(MatchCount[3]), .B0(n73), .Y(n240) );
  NOR4X1 U415 ( .A(n237), .B(n238), .C(n74), .D(MatchCount[3]), .Y(n73) );
  OAI21XL U416 ( .A0(n75), .A1(MatchCount[2]), .B0(n77), .Y(n71) );
  CLKBUFX3 U417 ( .A(n83), .Y(n364) );
  NAND3XL U418 ( .A(ns[1]), .B(n220), .C(N188), .Y(n83) );
  OAI21X1 U419 ( .A0(n232), .A1(n233), .B0(n231), .Y(n167) );
  OAI22XL U420 ( .A0(n238), .A1(n79), .B0(n74), .B1(MatchCount[1]), .Y(n242)
         );
  OAI22XL U421 ( .A0(n201), .A1(n480), .B0(n364), .B1(n494), .Y(n253) );
  OAI22XL U422 ( .A0(n463), .A1(n480), .B0(n364), .B1(n498), .Y(n246) );
  OAI22XL U423 ( .A0(n209), .A1(n480), .B0(n364), .B1(n466), .Y(n245) );
  OAI22XL U424 ( .A0(n460), .A1(n480), .B0(n364), .B1(n470), .Y(n252) );
  OAI22XL U425 ( .A0(n203), .A1(n480), .B0(n364), .B1(n495), .Y(n251) );
  OAI22XL U426 ( .A0(n462), .A1(n480), .B0(n364), .B1(n497), .Y(n247) );
  OAI22XL U427 ( .A0(n461), .A1(n480), .B0(n364), .B1(n496), .Y(n250) );
  OAI22XL U428 ( .A0(n205), .A1(n480), .B0(n364), .B1(n469), .Y(n249) );
  OAI22XL U429 ( .A0(n206), .A1(n480), .B0(n364), .B1(n468), .Y(n248) );
  OAI22XL U430 ( .A0(n464), .A1(n480), .B0(n364), .B1(n499), .Y(n244) );
  NOR3X1 U431 ( .A(n222), .B(n221), .C(n223), .Y(n55) );
  NAND2X1 U432 ( .A(n199), .B(n200), .Y(n169) );
  OAI21XL U433 ( .A0(n239), .A1(n80), .B0(n82), .Y(n243) );
  OAI21XL U434 ( .A0(N188), .A1(n239), .B0(n80), .Y(n82) );
  NOR2X1 U435 ( .A(n224), .B(n225), .Y(n166) );
  OAI2BB2XL U436 ( .B0(n498), .B1(n363), .A0N(N181), .A1N(n478), .Y(n256) );
  OAI2BB2XL U437 ( .B0(n466), .B1(n363), .A0N(N182), .A1N(n478), .Y(n255) );
  CLKBUFX3 U438 ( .A(N290), .Y(n359) );
  OAI22XL U439 ( .A0(n437), .A1(n425), .B0(n360), .B1(n424), .Y(N290) );
  OAI2BB2XL U440 ( .B0(n499), .B1(n363), .A0N(N183), .A1N(n478), .Y(n254) );
  CLKBUFX3 U441 ( .A(idx[1]), .Y(n360) );
  OAI21XL U442 ( .A0(n493), .A1(n163), .B0(n164), .Y(n161) );
  OAI31XL U443 ( .A0(n165), .A1(n230), .A2(n166), .B0(n167), .Y(n163) );
  OAI22XL U444 ( .A0(n197), .A1(n111), .B0(n101), .B1(n112), .Y(n274) );
  OAI22XL U445 ( .A0(n199), .A1(n105), .B0(n101), .B1(n106), .Y(n268) );
  OAI22XL U446 ( .A0(n235), .A1(n98), .B0(n101), .B1(n100), .Y(n265) );
  OAI22XL U447 ( .A0(n222), .A1(n476), .B0(n101), .B1(n70), .Y(n282) );
  OAI22XL U448 ( .A0(n225), .A1(n121), .B0(n101), .B1(n122), .Y(n280) );
  OAI22XL U449 ( .A0(n232), .A1(n108), .B0(n101), .B1(n110), .Y(n271) );
  OAI22XL U450 ( .A0(n228), .A1(n473), .B0(n101), .B1(n118), .Y(n277) );
  OAI22XL U451 ( .A0(n230), .A1(n111), .B0(n99), .B1(n112), .Y(n273) );
  OAI22XL U452 ( .A0(n200), .A1(n105), .B0(n99), .B1(n106), .Y(n267) );
  OAI22XL U453 ( .A0(n234), .A1(n98), .B0(n99), .B1(n100), .Y(n264) );
  OAI22XL U454 ( .A0(n221), .A1(n476), .B0(n99), .B1(n70), .Y(n305) );
  OAI22XL U455 ( .A0(n224), .A1(n121), .B0(n99), .B1(n122), .Y(n279) );
  OAI22XL U456 ( .A0(n231), .A1(n108), .B0(n99), .B1(n110), .Y(n270) );
  OAI22XL U457 ( .A0(n227), .A1(n473), .B0(n99), .B1(n118), .Y(n276) );
  OAI22XL U458 ( .A0(n193), .A1(n474), .B0(n484), .B1(n126), .Y(n286) );
  OAI22XL U459 ( .A0(n194), .A1(n474), .B0(n483), .B1(n126), .Y(n285) );
  OAI22XL U460 ( .A0(n195), .A1(n474), .B0(n482), .B1(n126), .Y(n284) );
  INVX3 U461 ( .A(N216), .Y(n482) );
  INVX3 U462 ( .A(N214), .Y(n484) );
  INVX3 U463 ( .A(N215), .Y(n483) );
  OAI2BB2XL U464 ( .B0(n494), .B1(n363), .A0N(N174), .A1N(n478), .Y(n263) );
  OAI22XL U465 ( .A0(n223), .A1(n476), .B0(n359), .B1(n70), .Y(n283) );
  OAI22XL U466 ( .A0(n236), .A1(n98), .B0(n359), .B1(n100), .Y(n266) );
  OAI22XL U467 ( .A0(n196), .A1(n111), .B0(n359), .B1(n112), .Y(n275) );
  OAI22XL U468 ( .A0(n226), .A1(n121), .B0(n359), .B1(n122), .Y(n281) );
  OAI22XL U469 ( .A0(n233), .A1(n108), .B0(n359), .B1(n110), .Y(n272) );
  OAI22XL U470 ( .A0(n229), .A1(n473), .B0(n359), .B1(n118), .Y(n278) );
  OAI22XL U471 ( .A0(n198), .A1(n105), .B0(n359), .B1(n106), .Y(n269) );
  OAI32X1 U472 ( .A0(n472), .A1(n212), .A2(n213), .B0(n53), .B1(n479), .Y(
        ns[0]) );
  XOR2X1 U473 ( .A(n97), .B(n171), .Y(n308) );
  XOR2X1 U474 ( .A(n157), .B(n212), .Y(n306) );
  NAND2BX1 U475 ( .AN(n213), .B(n158), .Y(n157) );
  XOR2X1 U476 ( .A(n213), .B(n472), .Y(n307) );
  NOR2X1 U477 ( .A(n97), .B(n171), .Y(n158) );
  OAI21XL U478 ( .A0(n220), .A1(n479), .B0(n214), .Y(n215) );
  BUFX12 U479 ( .A(n503), .Y(J[2]) );
  NOR2X1 U480 ( .A(n213), .B(W[0]), .Y(n382) );
  NOR2X1 U481 ( .A(n213), .B(n171), .Y(n381) );
  NOR2X1 U482 ( .A(n171), .B(W[1]), .Y(n379) );
  AO22X1 U483 ( .A0(\arr[5][0] ), .A1(n379), .B0(\arr[4][0] ), .B1(n378), .Y(
        n369) );
  AOI221XL U484 ( .A0(\arr[6][0] ), .A1(n382), .B0(\arr[7][0] ), .B1(n381), 
        .C0(n369), .Y(n372) );
  AO22X1 U485 ( .A0(\arr[1][0] ), .A1(n379), .B0(\arr[0][0] ), .B1(n378), .Y(
        n370) );
  AOI221XL U486 ( .A0(\arr[2][0] ), .A1(n382), .B0(\arr[3][0] ), .B1(n381), 
        .C0(n370), .Y(n371) );
  AO22X1 U487 ( .A0(\arr[5][1] ), .A1(n379), .B0(\arr[4][1] ), .B1(n378), .Y(
        n373) );
  AOI221XL U488 ( .A0(\arr[6][1] ), .A1(n382), .B0(\arr[7][1] ), .B1(n381), 
        .C0(n373), .Y(n376) );
  AO22X1 U489 ( .A0(\arr[1][1] ), .A1(n379), .B0(\arr[0][1] ), .B1(n378), .Y(
        n374) );
  AOI221XL U490 ( .A0(\arr[2][1] ), .A1(n382), .B0(\arr[3][1] ), .B1(n381), 
        .C0(n374), .Y(n375) );
  AO22X1 U491 ( .A0(\arr[5][2] ), .A1(n379), .B0(\arr[4][2] ), .B1(n378), .Y(
        n377) );
  AOI221XL U492 ( .A0(\arr[6][2] ), .A1(n382), .B0(\arr[7][2] ), .B1(n381), 
        .C0(n377), .Y(n384) );
  AO22X1 U493 ( .A0(\arr[1][2] ), .A1(n379), .B0(\arr[0][2] ), .B1(n378), .Y(
        n380) );
  AOI221XL U494 ( .A0(\arr[2][2] ), .A1(n382), .B0(\arr[3][2] ), .B1(n381), 
        .C0(n380), .Y(n383) );
  OAI22XL U495 ( .A0(n384), .A1(n212), .B0(W[2]), .B1(n383), .Y(n503) );
  NOR2X1 U496 ( .A(n404), .B(N115), .Y(n401) );
  NOR2X1 U497 ( .A(n404), .B(n405), .Y(n400) );
  NOR2X1 U498 ( .A(N115), .B(N116), .Y(n397) );
  AO22X1 U499 ( .A0(\arr[5][0] ), .A1(n398), .B0(\arr[4][0] ), .B1(n397), .Y(
        n388) );
  AOI221XL U500 ( .A0(\arr[6][0] ), .A1(n401), .B0(\arr[7][0] ), .B1(n400), 
        .C0(n388), .Y(n391) );
  AO22X1 U501 ( .A0(\arr[1][0] ), .A1(n398), .B0(\arr[0][0] ), .B1(n397), .Y(
        n389) );
  AOI221XL U502 ( .A0(\arr[2][0] ), .A1(n401), .B0(\arr[3][0] ), .B1(n400), 
        .C0(n389), .Y(n390) );
  AO22X1 U503 ( .A0(\arr[5][1] ), .A1(n398), .B0(\arr[4][1] ), .B1(n397), .Y(
        n392) );
  AOI221XL U504 ( .A0(\arr[6][1] ), .A1(n401), .B0(\arr[7][1] ), .B1(n400), 
        .C0(n392), .Y(n395) );
  AO22X1 U505 ( .A0(\arr[1][1] ), .A1(n398), .B0(\arr[0][1] ), .B1(n397), .Y(
        n393) );
  AOI221XL U506 ( .A0(\arr[2][1] ), .A1(n401), .B0(\arr[3][1] ), .B1(n400), 
        .C0(n393), .Y(n394) );
  AO22X1 U507 ( .A0(\arr[5][2] ), .A1(n398), .B0(\arr[4][2] ), .B1(n397), .Y(
        n396) );
  AOI221XL U508 ( .A0(\arr[6][2] ), .A1(n401), .B0(\arr[7][2] ), .B1(n400), 
        .C0(n396), .Y(n403) );
  AO22X1 U509 ( .A0(\arr[1][2] ), .A1(n398), .B0(\arr[0][2] ), .B1(n397), .Y(
        n399) );
  AOI221XL U510 ( .A0(\arr[2][2] ), .A1(n401), .B0(\arr[3][2] ), .B1(n400), 
        .C0(n399), .Y(n402) );
  NOR2X1 U511 ( .A(n422), .B(idx[0]), .Y(n419) );
  NOR2X1 U512 ( .A(n422), .B(n365), .Y(n418) );
  NOR2X1 U513 ( .A(n365), .B(n360), .Y(n416) );
  AO22X1 U514 ( .A0(\arr[5][0] ), .A1(n416), .B0(\arr[4][0] ), .B1(n415), .Y(
        n406) );
  AOI221XL U515 ( .A0(\arr[6][0] ), .A1(n419), .B0(\arr[7][0] ), .B1(n418), 
        .C0(n406), .Y(n409) );
  AO22X1 U516 ( .A0(\arr[1][0] ), .A1(n416), .B0(\arr[0][0] ), .B1(n415), .Y(
        n407) );
  AOI221XL U517 ( .A0(\arr[2][0] ), .A1(n419), .B0(\arr[3][0] ), .B1(n418), 
        .C0(n407), .Y(n408) );
  OAI22XL U518 ( .A0(n436), .A1(n409), .B0(n361), .B1(n408), .Y(N216) );
  AO22X1 U519 ( .A0(\arr[5][1] ), .A1(n416), .B0(\arr[4][1] ), .B1(n415), .Y(
        n410) );
  AOI221XL U520 ( .A0(\arr[6][1] ), .A1(n419), .B0(\arr[7][1] ), .B1(n418), 
        .C0(n410), .Y(n413) );
  AO22X1 U521 ( .A0(\arr[1][1] ), .A1(n416), .B0(\arr[0][1] ), .B1(n415), .Y(
        n411) );
  AOI221XL U522 ( .A0(\arr[2][1] ), .A1(n419), .B0(\arr[3][1] ), .B1(n418), 
        .C0(n411), .Y(n412) );
  OAI22XL U523 ( .A0(n436), .A1(n413), .B0(n361), .B1(n412), .Y(N215) );
  AO22X1 U524 ( .A0(\arr[5][2] ), .A1(n416), .B0(\arr[4][2] ), .B1(n415), .Y(
        n414) );
  AOI221XL U525 ( .A0(\arr[6][2] ), .A1(n419), .B0(\arr[7][2] ), .B1(n418), 
        .C0(n414), .Y(n421) );
  AO22X1 U526 ( .A0(\arr[1][2] ), .A1(n416), .B0(\arr[0][2] ), .B1(n415), .Y(
        n417) );
  AOI221XL U527 ( .A0(\arr[2][2] ), .A1(n419), .B0(\arr[3][2] ), .B1(n418), 
        .C0(n417), .Y(n420) );
  OAI22XL U528 ( .A0(n421), .A1(n436), .B0(n361), .B1(n420), .Y(N214) );
  NOR2X1 U529 ( .A(n365), .B(n361), .Y(n433) );
  NOR2X1 U530 ( .A(n436), .B(idx[0]), .Y(n430) );
  AO22X1 U531 ( .A0(\C[6][0] ), .A1(n430), .B0(\C[2][0] ), .B1(n429), .Y(n423)
         );
  AOI221XL U532 ( .A0(\C[3][0] ), .A1(n433), .B0(\C[7][0] ), .B1(n432), .C0(
        n423), .Y(n425) );
  AOI222XL U533 ( .A0(\C[4][0] ), .A1(n365), .B0(\C[1][0] ), .B1(n433), .C0(
        \C[5][0] ), .C1(n432), .Y(n424) );
  AO22X1 U534 ( .A0(\C[6][1] ), .A1(n430), .B0(\C[2][1] ), .B1(n429), .Y(n426)
         );
  AOI221XL U535 ( .A0(\C[3][1] ), .A1(n433), .B0(\C[7][1] ), .B1(n432), .C0(
        n426), .Y(n428) );
  AOI222XL U536 ( .A0(\C[4][1] ), .A1(n365), .B0(\C[1][1] ), .B1(n433), .C0(
        \C[5][1] ), .C1(n432), .Y(n427) );
  AO22X1 U537 ( .A0(\C[6][2] ), .A1(n430), .B0(\C[2][2] ), .B1(n429), .Y(n431)
         );
  AOI221XL U538 ( .A0(\C[3][2] ), .A1(n433), .B0(\C[7][2] ), .B1(n432), .C0(
        n431), .Y(n435) );
  AOI222XL U539 ( .A0(\C[4][2] ), .A1(n365), .B0(\C[1][2] ), .B1(n433), .C0(
        \C[5][2] ), .C1(n432), .Y(n434) );
  OAI22XL U540 ( .A0(n435), .A1(n437), .B0(n360), .B1(n434), .Y(N288) );
  OAI22XL U541 ( .A0(sum[1]), .A1(n438), .B0(n438), .B1(n460), .Y(n440) );
  NAND2X1 U542 ( .A(sum[7]), .B(n463), .Y(n452) );
  NAND2X1 U543 ( .A(sum[6]), .B(n462), .Y(n447) );
  NOR3BXL U544 ( .AN(n447), .B(n441), .C(n448), .Y(n439) );
  NAND3X1 U545 ( .A(n440), .B(n452), .C(n439), .Y(n459) );
  NAND2X1 U546 ( .A(sum[9]), .B(n464), .Y(n455) );
  NOR2X1 U547 ( .A(n457), .B(n456), .Y(n446) );
  OAI211X1 U548 ( .A0(n443), .A1(n470), .B0(n442), .C0(n454), .Y(n444) );
  OAI221XL U549 ( .A0(sum[2]), .A1(n203), .B0(sum[3]), .B1(n461), .C0(n444), 
        .Y(n445) );
  AOI222XL U550 ( .A0(n505), .A1(n468), .B0(n506), .B1(n469), .C0(n446), .C1(
        n445), .Y(n450) );
  NAND2BX1 U551 ( .AN(n448), .B(n447), .Y(n449) );
  OAI222XL U552 ( .A0(n450), .A1(n449), .B0(sum[6]), .B1(n462), .C0(sum[7]), 
        .C1(n463), .Y(n451) );
  NOR4X1 U553 ( .A(n459), .B(n458), .C(n457), .D(n456), .Y(N189) );
endmodule

