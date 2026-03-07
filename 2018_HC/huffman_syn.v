/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Sat Mar  7 23:15:01 2026
/////////////////////////////////////////////////////////////


module huffman_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [7:1] carry;

  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  XOR3X1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Y(SUM[7]) );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2XL U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module huffman_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
endmodule


module huffman_DW01_inc_1 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module huffman_DW01_inc_2 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module huffman_DW01_inc_3 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module huffman_DW01_inc_4 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module huffman_DW01_inc_5 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module huffman_DW01_inc_6 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module huffman ( clk, reset, gray_valid, gray_data, CNT_valid, CNT1, CNT2, 
        CNT3, CNT4, CNT5, CNT6, code_valid, HC1, HC2, HC3, HC4, HC5, HC6, M1, 
        M2, M3, M4, M5, M6 );
  input [7:0] gray_data;
  output [7:0] CNT1;
  output [7:0] CNT2;
  output [7:0] CNT3;
  output [7:0] CNT4;
  output [7:0] CNT5;
  output [7:0] CNT6;
  output [7:0] HC1;
  output [7:0] HC2;
  output [7:0] HC3;
  output [7:0] HC4;
  output [7:0] HC5;
  output [7:0] HC6;
  output [7:0] M1;
  output [7:0] M2;
  output [7:0] M3;
  output [7:0] M4;
  output [7:0] M5;
  output [7:0] M6;
  input clk, reset, gray_valid;
  output CNT_valid, code_valid;
  wire   \group_member[1][6] , \group_member[1][5] , \group_member[1][4] ,
         \group_member[1][3] , \group_member[1][2] , \group_member[2][6] ,
         \group_member[2][5] , \group_member[2][4] , \group_member[2][3] ,
         \group_member[2][2] , \group_member[3][4] , \group_member[3][2] ,
         \group_member[4][5] , \group_member[4][3] , \group_member[5][5] ,
         \group_member[5][4] , \group_member[5][3] , \group_member[5][2] ,
         \group_member[5][1] , \group_member[6][5] , \group_member[6][4] ,
         \group_member[6][3] , \group_member[6][2] , \group_member[6][1] ,
         N265, N266, N267, N268, N269, N270, N271, N272, N273, N274, N275,
         N276, N277, N278, N279, N280, N281, N282, N283, N284, N285, N286,
         N287, N288, N289, N290, N291, N292, N293, N294, N295, N296, N297,
         N298, N299, N300, N301, N302, N303, N304, N305, N306, N307, N308,
         N309, N310, N311, N312, N326, N327, N328, N329, N330, N331, N332,
         N467, N468, N469, N470, N471, N472, N473, N474, N481, N482, N483,
         N484, N485, N486, N487, N488, N489, N490, N491, N492, N493, N494,
         N495, N496, N751, N752, n132, n140, n148, n156, n164, n172, n264,
         n266, n268, n270, n272, n274, n290, n298, n299, n311, n318, n339,
         n390, n410, n430, n449, n467, n471, n525, n526, n527, n528, n529,
         n530, n531, n532, n533, n534, n535, n536, n537, n538, n539, n540,
         n541, n542, n543, n544, n545, n546, n547, n548, n549, n550, n551,
         n552, n553, n554, n555, n556, n557, n558, n559, n560, n561, n562,
         n563, n564, n565, n566, n567, n568, n569, n570, n571, n572, n573,
         n574, n575, n576, n577, n578, n579, n580, n581, n582, n583, n584,
         n585, n586, n587, n588, n589, n590, n591, n592, n593, n594, n595,
         n596, n597, n598, n599, n600, n601, n602, n603, n604, n605, n606,
         n607, n608, n609, n610, n611, n612, n613, n614, n615, n616, n617,
         n618, n619, n620, n621, n622, n623, n624, n625, n626, n627, n628,
         n629, n630, n631, n632, n633, n634, n635, n636, n637, n638, n639,
         n640, n641, n642, n643, n644, n645, n646, n647, n648, n649, n650,
         n651, n652, n653, n654, n655, n656, n657, n658, n659, n660, n661,
         n662, n663, n664, n665, n666, n667, n668, n669, n670, n671, n672,
         n673, n674, n675, n676, n677, n678, n679, n680, n681, n682, n683,
         n684, n685, n686, n687, n688, n689, n690, n691, n692, n693, n694,
         n695, n696, n697, n698, n699, n700, n701, n702, n703, n704, n705,
         n706, n707, n708, n709, n710, n711, n712, n713, n714, n715, n716,
         n717, n718, n719, n720, n721, n722, n723, n724, n725, n726, n727,
         n728, n729, n730, n731, n732, n733, n734, n735, n736, n737, n738,
         n739, n740, n741, n742, n743, n744, n745, n746, n747, n748, n749,
         n750, n751, n752, n753, n754, n755, n756, n757, n758, n759, n760,
         n761, n762, n763, n764, n765, n766, n767, n768, n769, n770, n771,
         n772, n773, n774, n775, n776, n777, n778, n779, n780, n781, n782,
         n783, n784, n785, n786, n787, n788, n789, n790, n791, n792, n793,
         n794, n795, n796, n797, n798, n799, n800, n801, n802, n803, n804,
         n805, n806, n807, n808, n809, n810, n811, n812, n813, n814, n815,
         n816, n817, n818, n819, n820, n821, n822, n823, n824, n825, n826,
         n827, n828, n829, n830, n831, n832, n833, n834, n835, n836, n837,
         n838, n839, n840, n841, n842, n843, n844, n845, n846, n847, n848,
         n849, n850, n851, n852, n853, n854, n855, n856, n857, n858, n859,
         n860, n861, n862, n863, n864, n865, n866, n867, n868, n869, n870,
         n871, n872, n873, n874, n875, n876, n877, n878, n879, n880, n881,
         n882, n883, n884, n885, n886, n887, n888, n889, n890, n891, n892,
         n893, n894, n895, n896, n897, n898, n899, n900, n901, n902, n903,
         n904, n905, n906, n907, n908, n909, n910, n911, n912, n913, n914,
         n915, n916, n917, n918, n919, n920, n921, n922, n923, n924, n925,
         n926, n927, n928, n929, n930, n931, n932, n933, n934, n935, n936,
         n937, n938, n939, n940, n941, n942, n943, n944, n945, n946, n947,
         n948, n949, n950, n951, n952, n953, n954, n955, n956, n957, n958,
         n959, n960, n961, n962, n963, n964, n965, n966, n967, n968, n969,
         n970, n971, n972, n973, n974, n975, n976, n977, n978, n979, n980,
         n981, n982, n983, n984, n985, n986, n987, n988, n989, n990, n991,
         n992, n993, n994, n995, n996, n997, n998, n999, n1000, n1001, n1002,
         n1003, n1004, n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012,
         n1013, n1014, n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022,
         n1023, n1024, n1025, n1026, n1027, n1028, n1029, n1030, n1031, n1032,
         n1033, n1034, n1035, n1036, n1037, n1038, n1039, n1040, n1041, n1042,
         n1043, n1044, n1045, n1046, n1047, n1048, n1049, n1050, n1051, n1052,
         n1053, n1054, n1055, n1056, n1057, n1058, n1059, n1060, n1061, n1062,
         n1063, n1064, n1065, n1066, n1067, n1068, n1069, n1070, n1071, n1072,
         n1073, n1074, n1075, n1076, n1077, n1078, n1079, n1080, n1081, n1082,
         n1083, n1084, n1085, n1086, n1087, n1088, n1089, n1090, n1091, n1092,
         n1093, n1094, n1095, n1096, n1097, n1098, n1099, n1100, n1101, n1102,
         n1103, n1104, n1105, n1106, n1107, n1108, n1109, n1110, n1111, n1112,
         n1113, n1114, n1115, n1116, n1117, n1118, n1119, n1120, n1121, n1122,
         n1123, n1124, n1125, n1126, n1127, n1128, n1129, n1130, n1131, n1132,
         n1133, n1134, n1135, n1136, n1137, n1138, n1139, n1140, n1141, n1142,
         n1143, n1144, n1145, n1146, n1147, n1148, n1149, n1150, n1151, n1152,
         n1153, n1154, n1155, n1156, n1157, n1158, n1159, n1160, n1161, n1162,
         n1163, n1164, n1165, n1166, n1167, n1168, n1169, n1170, n1171, n1172,
         n1173, n1174, n1175, n1176, n1177, n1178, n1179, n1180, n1181, n1182,
         n1183, n1184, n1185, n1186, n1187, n1188, n1189, n1190, n1191, n1192,
         n1193, n1194, n1195, n1196, n1197, n1198, n1199, n1200, n1201, n1202,
         n1203, n1204, n1205, n1206, n1207, n1208, n1209, n1210, n1211, n1212,
         n1213, n1214, n1215, n1216, n1217, n1218, n1219, n1220, n1221, n1222,
         n1223, n1224, n1225, n1226, n1227, n1228, n1229, n1230, n1231, n1232,
         n1233, n1234, n1235, n1236, n1237, n1238, n1239, n1240, n1241, n1242,
         n1243, n1244, n1245, n1246, n1247, n1248, n1249, n1250, n1251, n1252,
         n1253, n1254, n1255, n1256, n1257, n1258, n1259, n1260, n1261, n1262,
         n1263, n1264, n1265, n1266, n1267, n1268, n1269, n1270, n1271, n1272,
         n1273;
  wire   [2:0] cs;
  wire   [6:0] counter;
  wire   [2:0] total_groups;

  EDFFX2 \M_reg[6][0]  ( .D(n695), .E(n673), .CK(clk), .Q(M6[0]), .QN(n172) );
  EDFFX2 \M_reg[5][0]  ( .D(n695), .E(n272), .CK(clk), .Q(M5[0]), .QN(n164) );
  EDFFX2 \M_reg[4][0]  ( .D(n695), .E(n270), .CK(clk), .Q(M4[0]), .QN(n156) );
  EDFFX2 \M_reg[3][0]  ( .D(n695), .E(n268), .CK(clk), .Q(M3[0]), .QN(n148) );
  EDFFX2 \M_reg[1][0]  ( .D(n695), .E(n264), .CK(clk), .Q(M1[0]), .QN(n132) );
  EDFFX1 \group_member_reg[3][5]  ( .D(n1264), .E(n311), .CK(clk), .Q(n652), 
        .QN(n1158) );
  EDFFX1 \group_member_reg[3][3]  ( .D(n1271), .E(n311), .CK(clk), .Q(n656), 
        .QN(n1160) );
  EDFFX1 \group_member_reg[4][4]  ( .D(n1270), .E(n318), .CK(clk), .Q(n658), 
        .QN(n1159) );
  EDFFX1 \group_member_reg[4][2]  ( .D(n1267), .E(n318), .CK(clk), .Q(n657), 
        .QN(n1161) );
  EDFFX1 \group_member_reg[6][6]  ( .D(n1273), .E(n298), .CK(clk), .QN(n1155)
         );
  EDFFX2 \group_count_reg[1][6]  ( .D(n1225), .E(n670), .CK(clk), .Q(CNT1[6]), 
        .QN(n1167) );
  EDFFX1 \group_member_reg[1][1]  ( .D(n1272), .E(n290), .CK(clk), .QN(n1165)
         );
  EDFFX1 \group_member_reg[3][1]  ( .D(n1265), .E(n311), .CK(clk), .QN(n1164)
         );
  EDFFX1 \group_member_reg[5][6]  ( .D(n1269), .E(n339), .CK(clk), .QN(n1154)
         );
  EDFFX2 \group_count_reg[1][7]  ( .D(n1219), .E(n670), .CK(clk), .Q(CNT1[7]), 
        .QN(n1171) );
  EDFFX1 \group_member_reg[4][6]  ( .D(n1266), .E(n318), .CK(clk), .QN(n1156)
         );
  EDFFX2 \group_count_reg[1][3]  ( .D(n1243), .E(n670), .CK(clk), .Q(CNT1[3]), 
        .QN(n1175) );
  EDFFX2 \group_count_reg[2][6]  ( .D(n1223), .E(n669), .CK(clk), .Q(CNT2[6]), 
        .QN(n1178) );
  EDFFX1 \group_member_reg[3][6]  ( .D(n1263), .E(n311), .CK(clk), .Q(n655), 
        .QN(n1157) );
  EDFFX2 \group_count_reg[1][1]  ( .D(n1250), .E(n670), .CK(clk), .Q(CNT1[1]), 
        .QN(n1174) );
  EDFFX2 \group_count_reg[6][7]  ( .D(n1218), .E(n668), .CK(clk), .Q(CNT6[7]), 
        .QN(n1202) );
  EDFFX2 \group_count_reg[1][0]  ( .D(n1261), .E(n670), .CK(clk), .Q(CNT1[0]), 
        .QN(n1173) );
  EDFFX1 \group_member_reg[2][1]  ( .D(n1262), .E(n299), .CK(clk), .Q(n654), 
        .QN(n1163) );
  EDFFX1 \group_member_reg[4][1]  ( .D(n1268), .E(n318), .CK(clk), .Q(n653), 
        .QN(n1162) );
  EDFFX2 \group_count_reg[1][5]  ( .D(n1231), .E(n670), .CK(clk), .Q(CNT1[5]), 
        .QN(n1179) );
  EDFFX2 \group_count_reg[1][2]  ( .D(n1249), .E(n670), .CK(clk), .Q(CNT1[2]), 
        .QN(n1177) );
  EDFFX2 \group_count_reg[1][4]  ( .D(n1237), .E(n670), .CK(clk), .Q(CNT1[4]), 
        .QN(n1181) );
  EDFFX2 \group_count_reg[3][6]  ( .D(n1222), .E(n430), .CK(clk), .Q(CNT3[6]), 
        .QN(n1183) );
  EDFFX2 \group_count_reg[2][7]  ( .D(n1217), .E(n669), .CK(clk), .Q(CNT2[7]), 
        .QN(n1166) );
  EDFFX2 \group_count_reg[2][4]  ( .D(n1235), .E(n669), .CK(clk), .Q(CNT2[4]), 
        .QN(n1180) );
  EDFFX2 \group_count_reg[2][5]  ( .D(n1229), .E(n669), .CK(clk), .Q(CNT2[5]), 
        .QN(n1168) );
  EDFFX2 \group_count_reg[3][7]  ( .D(n1216), .E(n430), .CK(clk), .Q(CNT3[7]), 
        .QN(n1187) );
  EDFFX2 \group_count_reg[5][7]  ( .D(n1214), .E(n467), .CK(clk), .Q(CNT5[7]), 
        .QN(n1203) );
  EDFFX2 \group_count_reg[4][7]  ( .D(n1215), .E(n449), .CK(clk), .Q(CNT4[7]), 
        .QN(n1182) );
  EDFFX2 \group_count_reg[2][3]  ( .D(n1241), .E(n669), .CK(clk), .Q(CNT2[3]), 
        .QN(n1170) );
  EDFFX2 \group_count_reg[3][3]  ( .D(n1240), .E(n430), .CK(clk), .Q(CNT3[3]), 
        .QN(n1191) );
  EDFFX2 \group_count_reg[4][6]  ( .D(n1221), .E(n449), .CK(clk), .Q(CNT4[6]), 
        .QN(n1194) );
  EDFFX2 \group_count_reg[6][2]  ( .D(n1248), .E(n668), .CK(clk), .Q(CNT6[2]), 
        .QN(n1208) );
  EDFFX2 \group_count_reg[6][5]  ( .D(n1230), .E(n668), .CK(clk), .Q(CNT6[5]), 
        .QN(n1199) );
  EDFFX2 \group_count_reg[6][0]  ( .D(n1260), .E(n668), .CK(clk), .Q(CNT6[0]), 
        .QN(n1204) );
  EDFFX2 \group_count_reg[6][4]  ( .D(n1236), .E(n668), .CK(clk), .Q(CNT6[4]), 
        .QN(n1212) );
  EDFFX2 \group_count_reg[6][3]  ( .D(n1242), .E(n668), .CK(clk), .Q(CNT6[3]), 
        .QN(n1200) );
  EDFFX2 \group_count_reg[2][0]  ( .D(n1259), .E(n669), .CK(clk), .Q(CNT2[0]), 
        .QN(n1172) );
  EDFFX2 \group_count_reg[6][1]  ( .D(n1255), .E(n668), .CK(clk), .Q(CNT6[1]), 
        .QN(n1201) );
  EDFFX2 \group_count_reg[2][2]  ( .D(n1247), .E(n669), .CK(clk), .Q(CNT2[2]), 
        .QN(n1176) );
  EDFFX2 \group_count_reg[3][0]  ( .D(n1258), .E(n430), .CK(clk), .Q(CNT3[0]), 
        .QN(n1189) );
  EDFFX2 \group_count_reg[4][4]  ( .D(n1233), .E(n449), .CK(clk), .Q(CNT4[4]), 
        .QN(n1196) );
  EDFFX2 \group_count_reg[2][1]  ( .D(n1254), .E(n669), .CK(clk), .Q(CNT2[1]), 
        .QN(n1169) );
  EDFFX2 \group_count_reg[6][6]  ( .D(n1224), .E(n668), .CK(clk), .Q(CNT6[6]), 
        .QN(n1210) );
  EDFFX2 \group_count_reg[5][3]  ( .D(n1238), .E(n467), .CK(clk), .Q(CNT5[3]), 
        .QN(n1207) );
  EDFFX2 \group_count_reg[5][6]  ( .D(n1220), .E(n467), .CK(clk), .Q(CNT5[6]), 
        .QN(n1198) );
  EDFFX2 \group_count_reg[3][5]  ( .D(n1228), .E(n430), .CK(clk), .Q(CNT3[5]), 
        .QN(n1195) );
  EDFFX2 \group_count_reg[3][1]  ( .D(n1253), .E(n430), .CK(clk), .Q(CNT3[1]), 
        .QN(n1190) );
  EDFFX2 \group_count_reg[4][0]  ( .D(n1257), .E(n449), .CK(clk), .Q(CNT4[0]), 
        .QN(n1188) );
  EDFFX2 \group_count_reg[3][2]  ( .D(n1246), .E(n430), .CK(clk), .Q(CNT3[2]), 
        .QN(n1193) );
  EDFFX2 \group_count_reg[5][2]  ( .D(n1244), .E(n467), .CK(clk), .Q(CNT5[2]), 
        .QN(n1209) );
  EDFFX2 \group_count_reg[4][5]  ( .D(n1227), .E(n449), .CK(clk), .Q(CNT4[5]), 
        .QN(n1184) );
  EDFFX2 \group_count_reg[3][4]  ( .D(n1234), .E(n430), .CK(clk), .Q(CNT3[4]), 
        .QN(n1197) );
  EDFFX2 \group_count_reg[5][4]  ( .D(n1232), .E(n467), .CK(clk), .Q(CNT5[4]), 
        .QN(n1213) );
  EDFFX2 \group_count_reg[4][3]  ( .D(n1239), .E(n449), .CK(clk), .Q(CNT4[3]), 
        .QN(n1186) );
  EDFFX2 \group_count_reg[5][0]  ( .D(n1256), .E(n467), .CK(clk), .Q(CNT5[0]), 
        .QN(n1205) );
  EDFFX2 \group_count_reg[5][1]  ( .D(n1251), .E(n467), .CK(clk), .Q(CNT5[1]), 
        .QN(n1206) );
  EDFFX2 \group_count_reg[5][5]  ( .D(n1226), .E(n467), .CK(clk), .Q(CNT5[5]), 
        .QN(n1211) );
  EDFFX2 \group_count_reg[4][2]  ( .D(n1245), .E(n449), .CK(clk), .Q(CNT4[2]), 
        .QN(n1192) );
  EDFFX2 \group_count_reg[4][1]  ( .D(n1252), .E(n449), .CK(clk), .Q(CNT4[1]), 
        .QN(n1185) );
  DFFX1 \group_member_reg[3][4]  ( .D(n629), .CK(clk), .Q(\group_member[3][4] ), .QN(n776) );
  DFFX1 \group_member_reg[5][4]  ( .D(n634), .CK(clk), .Q(\group_member[5][4] ), .QN(n775) );
  DFFX1 \group_member_reg[2][4]  ( .D(n626), .CK(clk), .Q(\group_member[2][4] ), .QN(n839) );
  DFFX1 \cs_reg[0]  ( .D(n647), .CK(clk), .Q(cs[0]), .QN(n984) );
  DFFX1 \group_member_reg[1][3]  ( .D(n618), .CK(clk), .Q(\group_member[1][3] ), .QN(n1106) );
  DFFX1 \cs_reg[1]  ( .D(n648), .CK(clk), .Q(cs[1]), .QN(n1061) );
  DFFX1 \cs_reg[2]  ( .D(n649), .CK(clk), .Q(cs[2]), .QN(n786) );
  DFFX1 \group_member_reg[4][3]  ( .D(n632), .CK(clk), .Q(\group_member[4][3] ), .QN(n781) );
  DFFX1 \group_member_reg[5][3]  ( .D(n635), .CK(clk), .Q(\group_member[5][3] ), .QN(n824) );
  DFFX1 \group_member_reg[2][3]  ( .D(n627), .CK(clk), .Q(\group_member[2][3] ), .QN(n780) );
  DFFX1 \group_member_reg[2][6]  ( .D(n624), .CK(clk), .Q(\group_member[2][6] ), .QN(n766) );
  DFFX1 \group_member_reg[2][2]  ( .D(n628), .CK(clk), .Q(\group_member[2][2] ), .QN(n835) );
  DFFX1 \group_member_reg[3][2]  ( .D(n630), .CK(clk), .Q(\group_member[3][2] ), .QN(n772) );
  DFFX1 \group_member_reg[5][2]  ( .D(n636), .CK(clk), .Q(\group_member[5][2] ), .QN(n771) );
  DFFX1 \group_member_reg[5][1]  ( .D(n637), .CK(clk), .Q(\group_member[5][1] ), .QN(n774) );
  DFFX1 \group_member_reg[1][5]  ( .D(n616), .CK(clk), .Q(\group_member[1][5] ), .QN(n1091) );
  DFFX1 \group_member_reg[5][5]  ( .D(n633), .CK(clk), .Q(\group_member[5][5] ), .QN(n827) );
  DFFX1 \group_member_reg[4][5]  ( .D(n631), .CK(clk), .Q(\group_member[4][5] ), .QN(n769) );
  DFFX1 \group_member_reg[2][5]  ( .D(n625), .CK(clk), .Q(\group_member[2][5] ), .QN(n768) );
  BUFX20 U648 ( .A(n1007), .Y(n682) );
  INVX3 U650 ( .A(n1085), .Y(n1098) );
  CLKBUFX3 U651 ( .A(n1082), .Y(n678) );
  CLKBUFX3 U652 ( .A(n1081), .Y(n679) );
  CLKBUFX3 U653 ( .A(n1084), .Y(n680) );
  NAND2X2 U654 ( .A(n697), .B(n971), .Y(n962) );
  NAND2X2 U655 ( .A(n697), .B(n961), .Y(n952) );
  NAND2X2 U656 ( .A(n697), .B(n951), .Y(n942) );
  NAND2X2 U657 ( .A(n697), .B(n941), .Y(n932) );
  NAND2X2 U658 ( .A(n697), .B(n931), .Y(n922) );
  OA21X2 U659 ( .A0(n853), .A1(n854), .B0(n696), .Y(n783) );
  NAND2X2 U660 ( .A(n697), .B(n921), .Y(n912) );
  AO22X1 U661 ( .A0(HC4[0]), .A1(n932), .B0(n156), .B1(n933), .Y(n556) );
  AO22X1 U662 ( .A0(HC4[1]), .A1(n932), .B0(n934), .B1(n933), .Y(n555) );
  NOR2BX2 U663 ( .AN(n941), .B(n698), .Y(n933) );
  OAI211X4 U664 ( .A0(n1024), .A1(n1025), .B0(n800), .C0(n1026), .Y(n299) );
  OA21X2 U665 ( .A0(n856), .A1(n857), .B0(n696), .Y(n779) );
  AO22X1 U666 ( .A0(HC1[0]), .A1(n962), .B0(n132), .B1(n963), .Y(n532) );
  AO22X1 U667 ( .A0(HC1[1]), .A1(n962), .B0(n964), .B1(n963), .Y(n531) );
  NOR2BX2 U668 ( .AN(n971), .B(n697), .Y(n963) );
  AO22X1 U669 ( .A0(HC5[0]), .A1(n922), .B0(n164), .B1(n923), .Y(n564) );
  AO22X1 U670 ( .A0(HC5[1]), .A1(n922), .B0(n924), .B1(n923), .Y(n563) );
  NOR2BX2 U671 ( .AN(n931), .B(n698), .Y(n923) );
  OAI211X4 U672 ( .A0(n989), .A1(n990), .B0(n801), .C0(n991), .Y(n318) );
  AO22X1 U673 ( .A0(HC2[0]), .A1(n952), .B0(n140), .B1(n953), .Y(n540) );
  AO22X1 U674 ( .A0(HC2[1]), .A1(n952), .B0(n954), .B1(n953), .Y(n539) );
  NOR2BX2 U675 ( .AN(n961), .B(n697), .Y(n953) );
  AO22X1 U676 ( .A0(HC6[0]), .A1(n912), .B0(n172), .B1(n913), .Y(n572) );
  AO22X1 U677 ( .A0(HC6[1]), .A1(n912), .B0(n914), .B1(n913), .Y(n571) );
  NOR2BX2 U678 ( .AN(n921), .B(n697), .Y(n913) );
  OAI211X4 U679 ( .A0(n985), .A1(n986), .B0(n801), .C0(n987), .Y(n339) );
  INVX3 U680 ( .A(n974), .Y(n290) );
  AO22X1 U681 ( .A0(HC3[0]), .A1(n942), .B0(n148), .B1(n943), .Y(n548) );
  AO22X1 U682 ( .A0(HC3[1]), .A1(n942), .B0(n944), .B1(n943), .Y(n547) );
  NOR2BX2 U683 ( .AN(n951), .B(n697), .Y(n943) );
  OAI211X4 U684 ( .A0(n682), .A1(n1008), .B0(n800), .C0(n991), .Y(n311) );
  NOR2X2 U685 ( .A(n778), .B(n690), .Y(n785) );
  NOR3X2 U686 ( .A(cs[1]), .B(cs[2]), .C(cs[0]), .Y(n778) );
  OAI21X1 U687 ( .A0(n862), .A1(n863), .B0(n696), .Y(n767) );
  OAI21X1 U688 ( .A0(n820), .A1(n821), .B0(n695), .Y(n765) );
  OAI31X4 U689 ( .A0(n1024), .A1(n697), .A2(n1044), .B0(n987), .Y(n298) );
  OAI31X4 U690 ( .A0(n975), .A1(gray_data[1]), .A2(gray_data[0]), .B0(n977), 
        .Y(n449) );
  NAND2X1 U691 ( .A(gray_data[2]), .B(n981), .Y(n975) );
  NAND2X2 U692 ( .A(n664), .B(n665), .Y(n815) );
  NAND2X2 U693 ( .A(n682), .B(n1024), .Y(n813) );
  CLKINVX1 U694 ( .A(n682), .Y(n663) );
  OAI211X1 U695 ( .A0(n1188), .A1(n681), .B0(n1136), .C0(n1137), .Y(N474) );
  NOR2X2 U696 ( .A(total_groups[1]), .B(total_groups[2]), .Y(n1078) );
  NAND2X1 U697 ( .A(N495), .B(n695), .Y(n714) );
  NAND2XL U698 ( .A(total_groups[2]), .B(n682), .Y(n664) );
  OR2XL U699 ( .A(n813), .B(n988), .Y(n659) );
  AND2X2 U700 ( .A(n679), .B(CNT1[0]), .Y(n660) );
  AND2X2 U701 ( .A(n678), .B(n1043), .Y(n661) );
  AND2X2 U702 ( .A(n1083), .B(CNT3[0]), .Y(n662) );
  INVX3 U703 ( .A(n1117), .Y(n1083) );
  OAI211XL U704 ( .A0(n1182), .A1(n681), .B0(n1152), .C0(n1153), .Y(N467) );
  NOR3X1 U705 ( .A(n660), .B(n661), .C(n662), .Y(n1137) );
  CLKINVX1 U706 ( .A(n722), .Y(n718) );
  CLKINVX1 U707 ( .A(n714), .Y(n710) );
  CLKBUFX3 U708 ( .A(n659), .Y(n681) );
  INVX1 U709 ( .A(n706), .Y(n702) );
  NAND2X1 U710 ( .A(n815), .B(n813), .Y(n1085) );
  NAND2X1 U711 ( .A(n1044), .B(n663), .Y(n665) );
  INVXL U712 ( .A(n765), .Y(n818) );
  INVXL U713 ( .A(n767), .Y(n843) );
  NAND4XL U714 ( .A(n785), .B(n697), .C(n699), .D(n685), .Y(n795) );
  NOR2XL U715 ( .A(n778), .B(n783), .Y(n782) );
  NOR2XL U716 ( .A(n778), .B(n779), .Y(n777) );
  MXI2XL U717 ( .A(n774), .B(n819), .S0(n339), .Y(n637) );
  MXI2XL U718 ( .A(n772), .B(n833), .S0(n311), .Y(n630) );
  MXI2XL U719 ( .A(n769), .B(n832), .S0(n318), .Y(n631) );
  MXI2XL U720 ( .A(\group_member[6][1] ), .B(n818), .S0(n298), .Y(n817) );
  MXI2XL U721 ( .A(\group_member[6][2] ), .B(n823), .S0(n298), .Y(n844) );
  MXI2XL U722 ( .A(\group_member[6][3] ), .B(n783), .S0(n298), .Y(n845) );
  MXI2XL U723 ( .A(\group_member[6][4] ), .B(n779), .S0(n298), .Y(n846) );
  MXI2XL U724 ( .A(\group_member[6][5] ), .B(n830), .S0(n298), .Y(n847) );
  MXI2XL U725 ( .A(n771), .B(n822), .S0(n339), .Y(n636) );
  MXI2XL U726 ( .A(n768), .B(n841), .S0(n299), .Y(n625) );
  MXI2XL U727 ( .A(n766), .B(n842), .S0(n299), .Y(n624) );
  MXI2XL U728 ( .A(n827), .B(n828), .S0(n339), .Y(n633) );
  NOR3XL U729 ( .A(n829), .B(n830), .C(n778), .Y(n828) );
  MXI2XL U730 ( .A(\group_member[1][5] ), .B(n830), .S0(n290), .Y(n858) );
  MXI2XL U731 ( .A(\group_member[1][6] ), .B(n843), .S0(n290), .Y(n861) );
  NAND3XL U732 ( .A(n674), .B(n765), .C(n1163), .Y(n1272) );
  INVXL U733 ( .A(n299), .Y(n980) );
  MXI2XL U735 ( .A(n824), .B(n825), .S0(n339), .Y(n635) );
  MXI2XL U736 ( .A(n780), .B(n838), .S0(n299), .Y(n627) );
  MXI2XL U737 ( .A(n781), .B(n831), .S0(n318), .Y(n632) );
  MXI2XL U738 ( .A(n776), .B(n834), .S0(n311), .Y(n629) );
  MXI2XL U739 ( .A(n775), .B(n826), .S0(n339), .Y(n634) );
  MXI2XL U740 ( .A(n839), .B(n840), .S0(n299), .Y(n626) );
  MXI2XL U741 ( .A(n835), .B(n836), .S0(n299), .Y(n628) );
  NOR3XL U742 ( .A(n837), .B(n823), .C(n778), .Y(n836) );
  MXI2XL U743 ( .A(\group_member[1][2] ), .B(n823), .S0(n290), .Y(n849) );
  NAND3XL U744 ( .A(n674), .B(n767), .C(n1154), .Y(n1273) );
  MXI2XL U745 ( .A(\group_member[1][3] ), .B(n783), .S0(n290), .Y(n852) );
  MXI2XL U746 ( .A(\group_member[1][4] ), .B(n779), .S0(n290), .Y(n855) );
  AO22XL U747 ( .A0(n785), .A1(counter[5]), .B0(N331), .B1(n690), .Y(n646) );
  AO22XL U748 ( .A0(n785), .A1(counter[4]), .B0(N330), .B1(n690), .Y(n645) );
  AO22XL U749 ( .A0(n785), .A1(counter[3]), .B0(N329), .B1(n690), .Y(n644) );
  AO22XL U750 ( .A0(n785), .A1(counter[2]), .B0(N328), .B1(n690), .Y(n643) );
  AO22XL U751 ( .A0(n785), .A1(counter[1]), .B0(N327), .B1(n690), .Y(n642) );
  AO22XL U752 ( .A0(n785), .A1(counter[6]), .B0(N332), .B1(n690), .Y(n650) );
  INVX1 U753 ( .A(n679), .Y(n1093) );
  INVX1 U754 ( .A(n730), .Y(n726) );
  INVX1 U755 ( .A(n678), .Y(n1099) );
  INVXL U756 ( .A(n680), .Y(n1097) );
  NAND2XL U757 ( .A(n694), .B(n988), .Y(n986) );
  NOR2XL U758 ( .A(n671), .B(n778), .Y(n804) );
  OA22XL U759 ( .A0(n677), .A1(n1167), .B0(n1183), .B1(n1024), .Y(n1131) );
  AOI2BB2XL U760 ( .B0(n1078), .B1(CNT1[5]), .A0N(n1195), .A1N(n1024), .Y(
        n1129) );
  OA22XL U761 ( .A0(n677), .A1(n1181), .B0(n1197), .B1(n1024), .Y(n1126) );
  AOI2BB2XL U762 ( .B0(n1078), .B1(CNT1[2]), .A0N(n1193), .A1N(n1024), .Y(
        n1122) );
  OA22XL U763 ( .A0(n677), .A1(n1175), .B0(n1191), .B1(n1024), .Y(n1124) );
  AOI2BB2XL U764 ( .B0(CNT6[1]), .B1(n1098), .A0N(n1206), .A1N(n680), .Y(n1138) );
  OA22XL U765 ( .A0(n677), .A1(n1173), .B0(n1189), .B1(n1024), .Y(n1118) );
  OAI211XL U766 ( .A0(n1165), .A1(n1093), .B0(n1115), .C0(n1116), .Y(n821) );
  AOI2BB2XL U767 ( .B0(n654), .B1(n678), .A0N(n1164), .A1N(n1117), .Y(n1115)
         );
  OAI211XL U768 ( .A0(n1156), .A1(n681), .B0(n1079), .C0(n1080), .Y(n863) );
  OA22XL U769 ( .A0(n1154), .A1(n680), .B0(n1155), .B1(n1085), .Y(n1079) );
  OAI211XL U770 ( .A0(n1180), .A1(n685), .B0(n732), .C0(n730), .Y(n1237) );
  OAI211XL U771 ( .A0(n1213), .A1(n685), .B0(n731), .C0(n730), .Y(n1236) );
  OAI211XL U772 ( .A0(n1203), .A1(n687), .B0(n707), .C0(n706), .Y(n1218) );
  OAI211XL U773 ( .A0(n1166), .A1(n686), .B0(n708), .C0(n706), .Y(n1219) );
  OAI211XL U774 ( .A0(n1198), .A1(n687), .B0(n715), .C0(n714), .Y(n1224) );
  OAI211XL U775 ( .A0(n1178), .A1(n686), .B0(n716), .C0(n714), .Y(n1225) );
  OAI211XL U776 ( .A0(n1211), .A1(n700), .B0(n723), .C0(n722), .Y(n1230) );
  OAI211XL U777 ( .A0(n1168), .A1(n686), .B0(n724), .C0(n722), .Y(n1231) );
  AOI2BB2XL U778 ( .B0(n1057), .B1(n1098), .A0N(n1209), .A1N(n680), .Y(n1140)
         );
  AOI2BB2XL U779 ( .B0(CNT6[3]), .B1(n1098), .A0N(n1207), .A1N(n680), .Y(n1142) );
  AOI2BB2XL U780 ( .B0(CNT6[5]), .B1(n1098), .A0N(n1211), .A1N(n680), .Y(n1148) );
  INVX1 U781 ( .A(n1144), .Y(n1143) );
  INVX1 U782 ( .A(n1147), .Y(n1146) );
  OA22XL U783 ( .A0(n1212), .A1(n1085), .B0(n1213), .B1(n680), .Y(n1145) );
  OA22XL U784 ( .A0(n677), .A1(n1174), .B0(n1190), .B1(n1024), .Y(n1120) );
  OAI211XL U785 ( .A0(n1161), .A1(n681), .B0(n1111), .C0(n1112), .Y(n851) );
  AOI2BB2XL U786 ( .B0(n1098), .B1(\group_member[6][2] ), .A0N(n771), .A1N(
        n680), .Y(n1111) );
  OAI211XL U787 ( .A0(n1093), .A1(n1091), .B0(n1094), .C0(n1095), .Y(n860) );
  AOI2BB2XL U788 ( .B0(n652), .B1(n1083), .A0N(n1099), .A1N(n768), .Y(n1094)
         );
  OAI211XL U789 ( .A0(n1159), .A1(n681), .B0(n1102), .C0(n1103), .Y(n857) );
  AOI2BB2XL U790 ( .B0(n1098), .B1(\group_member[6][4] ), .A0N(n775), .A1N(
        n680), .Y(n1102) );
  OAI211XL U791 ( .A0(n1093), .A1(n1106), .B0(n1107), .C0(n1108), .Y(n854) );
  AOI2BB2XL U792 ( .B0(n656), .B1(n1083), .A0N(n1099), .A1N(n780), .Y(n1107)
         );
  AOI2BB2XL U793 ( .B0(CNT6[7]), .B1(n1098), .A0N(n1203), .A1N(n680), .Y(n1152) );
  OA22XL U794 ( .A0(n1198), .A1(n680), .B0(n1210), .B1(n1085), .Y(n1150) );
  AOI2BB2XL U795 ( .B0(\group_member[1][6] ), .B1(n1078), .A0N(n1157), .A1N(
        n1024), .Y(n1075) );
  OA22XL U796 ( .A0(n1091), .A1(n677), .B0(n1158), .B1(n1024), .Y(n1086) );
  OA22XL U797 ( .A0(n677), .A1(n1165), .B0(n1164), .B1(n1024), .Y(n1113) );
  AOI2BB2XL U798 ( .B0(\group_member[1][2] ), .B1(n1078), .A0N(n1024), .A1N(
        n772), .Y(n1109) );
  OA22XL U799 ( .A0(n1106), .A1(n677), .B0(n1160), .B1(n1024), .Y(n1104) );
  AOI2BB2XL U800 ( .B0(\group_member[1][4] ), .B1(n1078), .A0N(n1024), .A1N(
        n776), .Y(n1100) );
  OA22XL U801 ( .A0(n677), .A1(n1171), .B0(n1187), .B1(n1024), .Y(n1134) );
  MXI2XL U802 ( .A(total_groups[0]), .B(n811), .S0(n697), .Y(n641) );
  NAND2XL U803 ( .A(total_groups[0]), .B(n674), .Y(n811) );
  MXI2XL U804 ( .A(n815), .B(total_groups[2]), .S0(n697), .Y(n814) );
  MXI2XL U805 ( .A(n813), .B(total_groups[1]), .S0(n697), .Y(n812) );
  INVX3 U806 ( .A(n666), .Y(n694) );
  CLKBUFX3 U807 ( .A(n700), .Y(n687) );
  INVX3 U808 ( .A(n698), .Y(n696) );
  INVX3 U809 ( .A(n698), .Y(n695) );
  CLKBUFX3 U810 ( .A(n687), .Y(n685) );
  CLKBUFX3 U811 ( .A(n687), .Y(n686) );
  CLKBUFX3 U812 ( .A(n684), .Y(n683) );
  CLKBUFX3 U813 ( .A(n693), .Y(n691) );
  CLKBUFX3 U814 ( .A(n698), .Y(n697) );
  INVX3 U815 ( .A(n692), .Y(n690) );
  CLKBUFX3 U816 ( .A(n693), .Y(n692) );
  INVX3 U817 ( .A(n691), .Y(n688) );
  INVX3 U818 ( .A(n691), .Y(n689) );
  CLKBUFX3 U819 ( .A(n699), .Y(n684) );
  NOR2XL U820 ( .A(n815), .B(n988), .Y(n1082) );
  CLKBUFX3 U821 ( .A(n666), .Y(n698) );
  NAND2XL U822 ( .A(n815), .B(n988), .Y(n1084) );
  NOR2XL U823 ( .A(n815), .B(n813), .Y(n1081) );
  CLKBUFX3 U824 ( .A(n667), .Y(n693) );
  AO21X2 U825 ( .A0(n821), .A1(n696), .B0(n971), .Y(n264) );
  AO21X2 U826 ( .A0(n860), .A1(n696), .B0(n931), .Y(n272) );
  AO21X2 U827 ( .A0(n851), .A1(n696), .B0(n961), .Y(n266) );
  CLKBUFX3 U828 ( .A(n1089), .Y(n676) );
  NOR2XL U829 ( .A(n988), .B(n1044), .Y(n1089) );
  CLKBUFX3 U830 ( .A(n784), .Y(n674) );
  INVXL U831 ( .A(n778), .Y(n784) );
  CLKBUFX3 U832 ( .A(n1090), .Y(n675) );
  NOR2X1 U833 ( .A(n807), .B(n1044), .Y(n1090) );
  CLKBUFX3 U834 ( .A(n1092), .Y(n677) );
  INVXL U835 ( .A(n1078), .Y(n1092) );
  CLKBUFX3 U836 ( .A(n274), .Y(n673) );
  AO21X1 U837 ( .A0(n863), .A1(n696), .B0(n921), .Y(n274) );
  OR3X2 U838 ( .A(n984), .B(cs[1]), .C(n786), .Y(n666) );
  NAND2X4 U839 ( .A(total_groups[1]), .B(total_groups[0]), .Y(n1024) );
  OR3X2 U840 ( .A(cs[1]), .B(cs[2]), .C(n984), .Y(n667) );
  CLKBUFX3 U841 ( .A(n791), .Y(n672) );
  NOR3X1 U842 ( .A(n984), .B(cs[2]), .C(n1061), .Y(n791) );
  NOR2X4 U843 ( .A(total_groups[2]), .B(total_groups[0]), .Y(n1088) );
  CLKBUFX3 U844 ( .A(n806), .Y(n671) );
  NOR3X1 U845 ( .A(cs[0]), .B(cs[1]), .C(n786), .Y(n806) );
  OAI31X4 U846 ( .A0(n975), .A1(gray_data[1]), .A2(n972), .B0(n976), .Y(n467)
         );
  OAI31X4 U847 ( .A0(n978), .A1(n973), .A2(n972), .B0(n979), .Y(n430) );
  NAND2BXL U848 ( .AN(gray_data[2]), .B(n981), .Y(n973) );
  CLKBUFX3 U849 ( .A(n390), .Y(n668) );
  CLKBUFX3 U850 ( .A(n410), .Y(n669) );
  CLKBUFX3 U851 ( .A(n471), .Y(n670) );
  AO21X2 U852 ( .A0(n857), .A1(n696), .B0(n941), .Y(n270) );
  AO21X2 U853 ( .A0(n854), .A1(n696), .B0(n951), .Y(n268) );
  OAI221XL U854 ( .A0(n1182), .A1(n684), .B0(n1202), .B1(n686), .C0(n701), .Y(
        n1214) );
  AOI21X1 U855 ( .A0(N304), .A1(n689), .B0(n702), .Y(n701) );
  OAI221XL U856 ( .A0(n1203), .A1(n683), .B0(n1187), .B1(n685), .C0(n703), .Y(
        n1215) );
  AOI21X1 U857 ( .A0(N296), .A1(n688), .B0(n702), .Y(n703) );
  OAI221XL U858 ( .A0(n1166), .A1(n683), .B0(n1182), .B1(n686), .C0(n704), .Y(
        n1216) );
  AOI21X1 U859 ( .A0(N288), .A1(n688), .B0(n702), .Y(n704) );
  OAI221XL U860 ( .A0(n1187), .A1(n683), .B0(n1171), .B1(n685), .C0(n705), .Y(
        n1217) );
  AOI21X1 U861 ( .A0(N280), .A1(n688), .B0(n702), .Y(n705) );
  NAND2X1 U862 ( .A(N312), .B(n688), .Y(n707) );
  NAND2X1 U863 ( .A(N496), .B(n694), .Y(n706) );
  NAND2X1 U864 ( .A(N272), .B(n688), .Y(n708) );
  OAI221XL U865 ( .A0(n1194), .A1(n684), .B0(n1210), .B1(n686), .C0(n709), .Y(
        n1220) );
  AOI21X1 U866 ( .A0(N303), .A1(n688), .B0(n710), .Y(n709) );
  OAI221XL U867 ( .A0(n1198), .A1(n683), .B0(n1183), .B1(n685), .C0(n711), .Y(
        n1221) );
  AOI21X1 U868 ( .A0(N295), .A1(n688), .B0(n710), .Y(n711) );
  OAI221XL U869 ( .A0(n1178), .A1(n684), .B0(n1194), .B1(n686), .C0(n712), .Y(
        n1222) );
  AOI21X1 U870 ( .A0(N287), .A1(n688), .B0(n710), .Y(n712) );
  OAI221XL U871 ( .A0(n1183), .A1(n684), .B0(n1167), .B1(n685), .C0(n713), .Y(
        n1223) );
  AOI21X1 U872 ( .A0(N279), .A1(n688), .B0(n710), .Y(n713) );
  NAND2X1 U873 ( .A(N311), .B(n688), .Y(n715) );
  NAND2X1 U874 ( .A(N271), .B(n688), .Y(n716) );
  OAI221XL U875 ( .A0(n1184), .A1(n684), .B0(n1199), .B1(n686), .C0(n717), .Y(
        n1226) );
  AOI21X1 U876 ( .A0(N302), .A1(n689), .B0(n718), .Y(n717) );
  OAI221XL U877 ( .A0(n1211), .A1(n684), .B0(n1195), .B1(n686), .C0(n719), .Y(
        n1227) );
  AOI21X1 U878 ( .A0(N294), .A1(n689), .B0(n718), .Y(n719) );
  OAI221XL U879 ( .A0(n1168), .A1(n684), .B0(n1184), .B1(n686), .C0(n720), .Y(
        n1228) );
  AOI21X1 U880 ( .A0(N286), .A1(n689), .B0(n718), .Y(n720) );
  OAI221XL U881 ( .A0(n1195), .A1(n684), .B0(n1179), .B1(n686), .C0(n721), .Y(
        n1229) );
  AOI21X1 U882 ( .A0(N278), .A1(n689), .B0(n718), .Y(n721) );
  NAND2X1 U883 ( .A(N310), .B(n690), .Y(n723) );
  NAND2X1 U884 ( .A(N494), .B(n694), .Y(n722) );
  NAND2X1 U885 ( .A(N270), .B(n688), .Y(n724) );
  OAI221XL U886 ( .A0(n1196), .A1(n684), .B0(n1212), .B1(n686), .C0(n725), .Y(
        n1232) );
  AOI21X1 U887 ( .A0(N301), .A1(n689), .B0(n726), .Y(n725) );
  OAI221XL U888 ( .A0(n1213), .A1(n684), .B0(n1197), .B1(n686), .C0(n727), .Y(
        n1233) );
  AOI21X1 U889 ( .A0(N293), .A1(n689), .B0(n726), .Y(n727) );
  OAI221XL U890 ( .A0(n1180), .A1(n684), .B0(n1196), .B1(n686), .C0(n728), .Y(
        n1234) );
  AOI21X1 U891 ( .A0(N285), .A1(n689), .B0(n726), .Y(n728) );
  OAI221XL U892 ( .A0(n1197), .A1(n684), .B0(n1181), .B1(n686), .C0(n729), .Y(
        n1235) );
  AOI21X1 U893 ( .A0(N277), .A1(n689), .B0(n726), .Y(n729) );
  NAND2X1 U894 ( .A(N309), .B(n690), .Y(n731) );
  NAND2X1 U895 ( .A(N493), .B(n695), .Y(n730) );
  NAND2X1 U896 ( .A(N269), .B(n690), .Y(n732) );
  OAI221XL U897 ( .A0(n1186), .A1(n684), .B0(n1200), .B1(n686), .C0(n733), .Y(
        n1238) );
  AOI21X1 U898 ( .A0(N300), .A1(n689), .B0(n734), .Y(n733) );
  OAI221XL U899 ( .A0(n1207), .A1(n684), .B0(n1191), .B1(n686), .C0(n735), .Y(
        n1239) );
  AOI21X1 U900 ( .A0(N292), .A1(n689), .B0(n734), .Y(n735) );
  OAI221XL U901 ( .A0(n1170), .A1(n683), .B0(n1186), .B1(n700), .C0(n736), .Y(
        n1240) );
  AOI21X1 U902 ( .A0(N284), .A1(n689), .B0(n734), .Y(n736) );
  OAI221XL U903 ( .A0(n1191), .A1(n684), .B0(n1175), .B1(n700), .C0(n737), .Y(
        n1241) );
  AOI21X1 U904 ( .A0(N276), .A1(n689), .B0(n734), .Y(n737) );
  CLKINVX1 U905 ( .A(n738), .Y(n734) );
  OAI211X1 U906 ( .A0(n1207), .A1(n686), .B0(n739), .C0(n738), .Y(n1242) );
  NAND2X1 U907 ( .A(N308), .B(n688), .Y(n739) );
  OAI211X1 U908 ( .A0(n1170), .A1(n685), .B0(n740), .C0(n738), .Y(n1243) );
  NAND2X1 U909 ( .A(N492), .B(n695), .Y(n738) );
  NAND2X1 U910 ( .A(N268), .B(n690), .Y(n740) );
  OAI221XL U911 ( .A0(n1192), .A1(n683), .B0(n1208), .B1(n700), .C0(n741), .Y(
        n1244) );
  AOI21X1 U912 ( .A0(N299), .A1(n689), .B0(n742), .Y(n741) );
  OAI221XL U913 ( .A0(n1209), .A1(n683), .B0(n1193), .B1(n700), .C0(n743), .Y(
        n1245) );
  AOI21X1 U914 ( .A0(N291), .A1(n689), .B0(n742), .Y(n743) );
  OAI221XL U915 ( .A0(n1176), .A1(n683), .B0(n1192), .B1(n700), .C0(n744), .Y(
        n1246) );
  AOI21X1 U916 ( .A0(N283), .A1(n689), .B0(n742), .Y(n744) );
  OAI221XL U917 ( .A0(n1193), .A1(n683), .B0(n1177), .B1(n687), .C0(n745), .Y(
        n1247) );
  AOI21X1 U918 ( .A0(N275), .A1(n688), .B0(n742), .Y(n745) );
  CLKINVX1 U919 ( .A(n746), .Y(n742) );
  OAI211X1 U920 ( .A0(n1209), .A1(n687), .B0(n747), .C0(n746), .Y(n1248) );
  NAND2X1 U921 ( .A(N307), .B(n690), .Y(n747) );
  OAI211X1 U922 ( .A0(n1176), .A1(n685), .B0(n748), .C0(n746), .Y(n1249) );
  NAND2X1 U923 ( .A(N491), .B(n694), .Y(n746) );
  NAND2X1 U924 ( .A(N267), .B(n690), .Y(n748) );
  OAI211X1 U925 ( .A0(n1169), .A1(n686), .B0(n749), .C0(n750), .Y(n1250) );
  NAND2X1 U926 ( .A(N266), .B(n690), .Y(n749) );
  OAI221XL U927 ( .A0(n1185), .A1(n683), .B0(n1201), .B1(n687), .C0(n751), .Y(
        n1251) );
  AOI21X1 U928 ( .A0(N298), .A1(n688), .B0(n752), .Y(n751) );
  OAI221XL U929 ( .A0(n1206), .A1(n683), .B0(n1190), .B1(n685), .C0(n753), .Y(
        n1252) );
  AOI21X1 U930 ( .A0(N290), .A1(n689), .B0(n752), .Y(n753) );
  OAI221XL U931 ( .A0(n1169), .A1(n683), .B0(n1185), .B1(n685), .C0(n754), .Y(
        n1253) );
  AOI21X1 U932 ( .A0(N282), .A1(n689), .B0(n752), .Y(n754) );
  OAI221XL U933 ( .A0(n1190), .A1(n683), .B0(n1174), .B1(n685), .C0(n755), .Y(
        n1254) );
  AOI21X1 U934 ( .A0(N274), .A1(n688), .B0(n752), .Y(n755) );
  CLKINVX1 U935 ( .A(n750), .Y(n752) );
  OAI211X1 U936 ( .A0(n1206), .A1(n687), .B0(n756), .C0(n750), .Y(n1255) );
  NAND2X1 U937 ( .A(N490), .B(n695), .Y(n750) );
  NAND2X1 U938 ( .A(N306), .B(n690), .Y(n756) );
  OAI221XL U939 ( .A0(n1188), .A1(n683), .B0(n1204), .B1(n685), .C0(n757), .Y(
        n1256) );
  AOI21X1 U940 ( .A0(N297), .A1(n689), .B0(n758), .Y(n757) );
  OAI221XL U941 ( .A0(n1205), .A1(n683), .B0(n1189), .B1(n685), .C0(n759), .Y(
        n1257) );
  AOI21X1 U942 ( .A0(N289), .A1(n688), .B0(n758), .Y(n759) );
  OAI221XL U943 ( .A0(n1172), .A1(n683), .B0(n1188), .B1(n685), .C0(n760), .Y(
        n1258) );
  AOI21X1 U944 ( .A0(N281), .A1(n688), .B0(n758), .Y(n760) );
  OAI221XL U945 ( .A0(n1189), .A1(n683), .B0(n1173), .B1(n685), .C0(n761), .Y(
        n1259) );
  AOI21X1 U946 ( .A0(N273), .A1(n688), .B0(n758), .Y(n761) );
  CLKINVX1 U947 ( .A(n762), .Y(n758) );
  OAI211X1 U948 ( .A0(n1205), .A1(n686), .B0(n763), .C0(n762), .Y(n1260) );
  NAND2X1 U949 ( .A(N305), .B(n690), .Y(n763) );
  OAI211X1 U950 ( .A0(n1172), .A1(n687), .B0(n764), .C0(n762), .Y(n1261) );
  NAND2X1 U951 ( .A(N489), .B(n695), .Y(n762) );
  NAND2X1 U952 ( .A(N265), .B(n690), .Y(n764) );
  OAI221XL U953 ( .A0(n1164), .A1(n683), .B0(n1165), .B1(n687), .C0(n765), .Y(
        n1262) );
  OAI221XL U954 ( .A0(n699), .A1(n766), .B0(n1156), .B1(n687), .C0(n767), .Y(
        n1263) );
  OAI221XL U955 ( .A0(n699), .A1(n768), .B0(n685), .B1(n769), .C0(n770), .Y(
        n1264) );
  OAI221XL U956 ( .A0(n1163), .A1(n683), .B0(n1162), .B1(n687), .C0(n765), .Y(
        n1265) );
  OAI221XL U957 ( .A0(n1154), .A1(n684), .B0(n1157), .B1(n687), .C0(n767), .Y(
        n1266) );
  OAI221XL U958 ( .A0(n699), .A1(n771), .B0(n685), .B1(n772), .C0(n773), .Y(
        n1267) );
  OAI221XL U959 ( .A0(n699), .A1(n774), .B0(n1164), .B1(n687), .C0(n765), .Y(
        n1268) );
  OAI221XL U960 ( .A0(n1156), .A1(n684), .B0(n1155), .B1(n687), .C0(n767), .Y(
        n1269) );
  OAI221XL U961 ( .A0(n699), .A1(n775), .B0(n685), .B1(n776), .C0(n777), .Y(
        n1270) );
  OAI221XL U962 ( .A0(n684), .A1(n780), .B0(n685), .B1(n781), .C0(n782), .Y(
        n1271) );
  AO22X1 U963 ( .A0(n785), .A1(counter[0]), .B0(N326), .B1(n690), .Y(n651) );
  OAI31XL U964 ( .A0(n786), .A1(reset), .A2(n787), .B0(n788), .Y(n649) );
  OAI31XL U965 ( .A0(n789), .A1(n790), .A2(n672), .B0(n792), .Y(n788) );
  NOR3X1 U966 ( .A(n684), .B(n793), .C(n794), .Y(n789) );
  OAI21XL U967 ( .A0(reset), .A1(n795), .B0(n796), .Y(n648) );
  OAI31XL U968 ( .A0(n797), .A1(n798), .A2(n799), .B0(n792), .Y(n796) );
  CLKINVX1 U969 ( .A(n800), .Y(n799) );
  CLKINVX1 U970 ( .A(n801), .Y(n798) );
  OAI21XL U971 ( .A0(n691), .A1(n802), .B0(n698), .Y(n797) );
  AOI31X1 U972 ( .A0(n787), .A1(n803), .A2(n804), .B0(n805), .Y(n647) );
  CLKINVX1 U973 ( .A(n792), .Y(n805) );
  NOR2X1 U974 ( .A(N752), .B(reset), .Y(n792) );
  OAI21XL U975 ( .A0(n807), .A1(n808), .B0(n696), .Y(n803) );
  CLKINVX1 U976 ( .A(n809), .Y(n787) );
  OAI2BB1X1 U977 ( .A0N(n802), .A1N(n688), .B0(n795), .Y(n809) );
  NAND4X1 U978 ( .A(counter[2]), .B(counter[6]), .C(counter[5]), .D(n810), .Y(
        n802) );
  NOR4X1 U979 ( .A(counter[4]), .B(counter[3]), .C(counter[1]), .D(counter[0]), 
        .Y(n810) );
  NAND2X1 U980 ( .A(n812), .B(n674), .Y(n640) );
  NAND2X1 U981 ( .A(n814), .B(n674), .Y(n639) );
  OAI21XL U982 ( .A0(n774), .A1(n816), .B0(n817), .Y(n638) );
  AOI221XL U983 ( .A0(\group_member[6][1] ), .A1(n672), .B0(n671), .B1(n653), 
        .C0(n818), .Y(n819) );
  AOI221XL U984 ( .A0(\group_member[6][2] ), .A1(n672), .B0(n671), .B1(n657), 
        .C0(n823), .Y(n822) );
  AOI221XL U985 ( .A0(\group_member[6][3] ), .A1(n672), .B0(
        \group_member[4][3] ), .B1(n671), .C0(n783), .Y(n825) );
  AOI221XL U986 ( .A0(\group_member[6][4] ), .A1(n672), .B0(n671), .B1(n658), 
        .C0(n779), .Y(n826) );
  OAI2BB2XL U987 ( .B0(n684), .B1(n769), .A0N(n672), .A1N(\group_member[6][5] ), .Y(n829) );
  CLKINVX1 U988 ( .A(n671), .Y(n699) );
  AOI221XL U989 ( .A0(n672), .A1(n656), .B0(\group_member[5][3] ), .B1(n671), 
        .C0(n783), .Y(n831) );
  AOI221XL U990 ( .A0(n672), .A1(n652), .B0(\group_member[5][5] ), .B1(n671), 
        .C0(n830), .Y(n832) );
  AOI221XL U991 ( .A0(n672), .A1(n657), .B0(\group_member[2][2] ), .B1(n671), 
        .C0(n823), .Y(n833) );
  AOI221XL U992 ( .A0(n672), .A1(n658), .B0(\group_member[2][4] ), .B1(n671), 
        .C0(n779), .Y(n834) );
  AO22X1 U993 ( .A0(n671), .A1(\group_member[3][2] ), .B0(n672), .B1(
        \group_member[1][2] ), .Y(n837) );
  AOI221XL U994 ( .A0(\group_member[1][3] ), .A1(n672), .B0(n671), .B1(n656), 
        .C0(n783), .Y(n838) );
  AOI221XL U995 ( .A0(\group_member[1][4] ), .A1(n672), .B0(
        \group_member[3][4] ), .B1(n671), .C0(n779), .Y(n840) );
  AOI221XL U996 ( .A0(\group_member[1][5] ), .A1(n672), .B0(n671), .B1(n652), 
        .C0(n830), .Y(n841) );
  AOI221XL U997 ( .A0(\group_member[1][6] ), .A1(n672), .B0(n671), .B1(n655), 
        .C0(n843), .Y(n842) );
  OAI21XL U998 ( .A0(n771), .A1(n816), .B0(n844), .Y(n623) );
  OAI21XL U999 ( .A0(n824), .A1(n816), .B0(n845), .Y(n622) );
  OAI21XL U1000 ( .A0(n775), .A1(n816), .B0(n846), .Y(n621) );
  OAI21XL U1001 ( .A0(n827), .A1(n816), .B0(n847), .Y(n620) );
  NAND2X1 U1002 ( .A(n672), .B(n298), .Y(n816) );
  OAI21XL U1003 ( .A0(n835), .A1(n848), .B0(n849), .Y(n619) );
  CLKINVX1 U1004 ( .A(n773), .Y(n823) );
  OAI21XL U1005 ( .A0(n850), .A1(n851), .B0(n696), .Y(n773) );
  OAI21XL U1006 ( .A0(n780), .A1(n848), .B0(n852), .Y(n618) );
  OAI21XL U1007 ( .A0(n839), .A1(n848), .B0(n855), .Y(n617) );
  OAI21XL U1008 ( .A0(n768), .A1(n848), .B0(n858), .Y(n616) );
  CLKINVX1 U1009 ( .A(n770), .Y(n830) );
  OAI21XL U1010 ( .A0(n859), .A1(n860), .B0(n695), .Y(n770) );
  OAI21XL U1011 ( .A0(n766), .A1(n848), .B0(n861), .Y(n615) );
  NAND2X1 U1012 ( .A(n672), .B(n290), .Y(n848) );
  OAI22XL U1013 ( .A0(n264), .A1(n864), .B0(n865), .B1(n866), .Y(n614) );
  OAI22XL U1014 ( .A0(n673), .A1(n867), .B0(n172), .B1(n868), .Y(n613) );
  OAI22XL U1015 ( .A0(n673), .A1(n869), .B0(n868), .B1(n867), .Y(n612) );
  OAI22XL U1016 ( .A0(n673), .A1(n870), .B0(n868), .B1(n869), .Y(n611) );
  OAI22XL U1017 ( .A0(n673), .A1(n871), .B0(n868), .B1(n870), .Y(n610) );
  OAI22XL U1018 ( .A0(n673), .A1(n872), .B0(n868), .B1(n871), .Y(n609) );
  OAI22XL U1019 ( .A0(n673), .A1(n873), .B0(n868), .B1(n872), .Y(n608) );
  OAI22XL U1020 ( .A0(n673), .A1(n874), .B0(n868), .B1(n873), .Y(n607) );
  NAND2X1 U1021 ( .A(n694), .B(n673), .Y(n868) );
  OAI22XL U1022 ( .A0(n272), .A1(n875), .B0(n164), .B1(n876), .Y(n606) );
  OAI22XL U1023 ( .A0(n272), .A1(n877), .B0(n876), .B1(n875), .Y(n605) );
  OAI22XL U1024 ( .A0(n272), .A1(n878), .B0(n876), .B1(n877), .Y(n604) );
  OAI22XL U1025 ( .A0(n272), .A1(n879), .B0(n876), .B1(n878), .Y(n603) );
  OAI22XL U1026 ( .A0(n272), .A1(n880), .B0(n876), .B1(n879), .Y(n602) );
  OAI22XL U1027 ( .A0(n272), .A1(n881), .B0(n876), .B1(n880), .Y(n601) );
  OAI22XL U1028 ( .A0(n272), .A1(n882), .B0(n876), .B1(n881), .Y(n600) );
  NAND2X1 U1029 ( .A(n694), .B(n272), .Y(n876) );
  OAI22XL U1030 ( .A0(n270), .A1(n883), .B0(n156), .B1(n884), .Y(n599) );
  OAI22XL U1031 ( .A0(n270), .A1(n885), .B0(n884), .B1(n883), .Y(n598) );
  OAI22XL U1032 ( .A0(n270), .A1(n886), .B0(n884), .B1(n885), .Y(n597) );
  OAI22XL U1033 ( .A0(n270), .A1(n887), .B0(n884), .B1(n886), .Y(n596) );
  OAI22XL U1034 ( .A0(n270), .A1(n888), .B0(n884), .B1(n887), .Y(n595) );
  OAI22XL U1035 ( .A0(n270), .A1(n889), .B0(n884), .B1(n888), .Y(n594) );
  OAI22XL U1036 ( .A0(n270), .A1(n890), .B0(n884), .B1(n889), .Y(n593) );
  NAND2X1 U1037 ( .A(n694), .B(n270), .Y(n884) );
  OAI22XL U1038 ( .A0(n268), .A1(n891), .B0(n148), .B1(n892), .Y(n592) );
  OAI22XL U1039 ( .A0(n268), .A1(n893), .B0(n892), .B1(n891), .Y(n591) );
  OAI22XL U1040 ( .A0(n268), .A1(n894), .B0(n892), .B1(n893), .Y(n590) );
  OAI22XL U1041 ( .A0(n268), .A1(n895), .B0(n892), .B1(n894), .Y(n589) );
  OAI22XL U1042 ( .A0(n268), .A1(n896), .B0(n892), .B1(n895), .Y(n588) );
  OAI22XL U1043 ( .A0(n268), .A1(n897), .B0(n892), .B1(n896), .Y(n587) );
  OAI22XL U1044 ( .A0(n268), .A1(n898), .B0(n892), .B1(n897), .Y(n586) );
  NAND2X1 U1045 ( .A(n694), .B(n268), .Y(n892) );
  OAI22XL U1046 ( .A0(n266), .A1(n899), .B0(n140), .B1(n900), .Y(n585) );
  OAI22XL U1047 ( .A0(n266), .A1(n901), .B0(n900), .B1(n899), .Y(n584) );
  CLKINVX1 U1048 ( .A(M2[1]), .Y(n899) );
  OAI22XL U1049 ( .A0(n266), .A1(n902), .B0(n900), .B1(n901), .Y(n583) );
  OAI22XL U1050 ( .A0(n266), .A1(n903), .B0(n900), .B1(n902), .Y(n582) );
  OAI22XL U1051 ( .A0(n266), .A1(n904), .B0(n900), .B1(n903), .Y(n581) );
  OAI22XL U1052 ( .A0(n266), .A1(n905), .B0(n900), .B1(n904), .Y(n580) );
  OAI22XL U1053 ( .A0(n266), .A1(n906), .B0(n900), .B1(n905), .Y(n579) );
  NAND2X1 U1054 ( .A(n694), .B(n266), .Y(n900) );
  OAI22XL U1055 ( .A0(n264), .A1(n907), .B0(n132), .B1(n865), .Y(n578) );
  OAI22XL U1056 ( .A0(n264), .A1(n908), .B0(n865), .B1(n907), .Y(n577) );
  OAI22XL U1057 ( .A0(n264), .A1(n909), .B0(n865), .B1(n908), .Y(n576) );
  OAI22XL U1058 ( .A0(n264), .A1(n910), .B0(n865), .B1(n909), .Y(n575) );
  OAI22XL U1059 ( .A0(n264), .A1(n866), .B0(n865), .B1(n910), .Y(n574) );
  OAI22XL U1060 ( .A0(n264), .A1(n911), .B0(n865), .B1(n864), .Y(n573) );
  NAND2X1 U1061 ( .A(n694), .B(n264), .Y(n865) );
  XNOR2X1 U1062 ( .A(n172), .B(M6[1]), .Y(n914) );
  AO22X1 U1063 ( .A0(HC6[2]), .A1(n912), .B0(n913), .B1(n915), .Y(n570) );
  XNOR2X1 U1064 ( .A(n869), .B(M6[1]), .Y(n915) );
  AO22X1 U1065 ( .A0(HC6[3]), .A1(n912), .B0(n913), .B1(n916), .Y(n569) );
  XNOR2X1 U1066 ( .A(n870), .B(M6[2]), .Y(n916) );
  AO22X1 U1067 ( .A0(HC6[4]), .A1(n912), .B0(n913), .B1(n917), .Y(n568) );
  XNOR2X1 U1068 ( .A(n871), .B(M6[3]), .Y(n917) );
  AO22X1 U1069 ( .A0(HC6[5]), .A1(n912), .B0(n913), .B1(n918), .Y(n567) );
  XNOR2X1 U1070 ( .A(n872), .B(M6[4]), .Y(n918) );
  AO22X1 U1071 ( .A0(HC6[6]), .A1(n912), .B0(n913), .B1(n919), .Y(n566) );
  XNOR2X1 U1072 ( .A(n873), .B(M6[5]), .Y(n919) );
  AO22X1 U1073 ( .A0(HC6[7]), .A1(n912), .B0(n913), .B1(n920), .Y(n565) );
  XNOR2X1 U1074 ( .A(n874), .B(M6[6]), .Y(n920) );
  XNOR2X1 U1075 ( .A(n164), .B(M5[1]), .Y(n924) );
  AO22X1 U1076 ( .A0(HC5[2]), .A1(n922), .B0(n923), .B1(n925), .Y(n562) );
  XNOR2X1 U1077 ( .A(n877), .B(M5[1]), .Y(n925) );
  AO22X1 U1078 ( .A0(HC5[3]), .A1(n922), .B0(n923), .B1(n926), .Y(n561) );
  XNOR2X1 U1079 ( .A(n878), .B(M5[2]), .Y(n926) );
  AO22X1 U1080 ( .A0(HC5[4]), .A1(n922), .B0(n923), .B1(n927), .Y(n560) );
  XNOR2X1 U1081 ( .A(n879), .B(M5[3]), .Y(n927) );
  AO22X1 U1082 ( .A0(HC5[5]), .A1(n922), .B0(n923), .B1(n928), .Y(n559) );
  XNOR2X1 U1083 ( .A(n880), .B(M5[4]), .Y(n928) );
  AO22X1 U1084 ( .A0(HC5[6]), .A1(n922), .B0(n923), .B1(n929), .Y(n558) );
  XNOR2X1 U1085 ( .A(n881), .B(M5[5]), .Y(n929) );
  AO22X1 U1086 ( .A0(HC5[7]), .A1(n922), .B0(n923), .B1(n930), .Y(n557) );
  XNOR2X1 U1087 ( .A(n882), .B(M5[6]), .Y(n930) );
  XNOR2X1 U1088 ( .A(n156), .B(M4[1]), .Y(n934) );
  AO22X1 U1089 ( .A0(HC4[2]), .A1(n932), .B0(n933), .B1(n935), .Y(n554) );
  XNOR2X1 U1090 ( .A(n885), .B(M4[1]), .Y(n935) );
  CLKINVX1 U1091 ( .A(M4[2]), .Y(n885) );
  AO22X1 U1092 ( .A0(HC4[3]), .A1(n932), .B0(n933), .B1(n936), .Y(n553) );
  XNOR2X1 U1093 ( .A(n886), .B(M4[2]), .Y(n936) );
  CLKINVX1 U1094 ( .A(M4[3]), .Y(n886) );
  AO22X1 U1095 ( .A0(HC4[4]), .A1(n932), .B0(n933), .B1(n937), .Y(n552) );
  XNOR2X1 U1096 ( .A(n887), .B(M4[3]), .Y(n937) );
  CLKINVX1 U1097 ( .A(M4[4]), .Y(n887) );
  AO22X1 U1098 ( .A0(HC4[5]), .A1(n932), .B0(n933), .B1(n938), .Y(n551) );
  XNOR2X1 U1099 ( .A(n888), .B(M4[4]), .Y(n938) );
  CLKINVX1 U1100 ( .A(M4[5]), .Y(n888) );
  AO22X1 U1101 ( .A0(HC4[6]), .A1(n932), .B0(n933), .B1(n939), .Y(n550) );
  XNOR2X1 U1102 ( .A(n889), .B(M4[5]), .Y(n939) );
  CLKINVX1 U1103 ( .A(M4[6]), .Y(n889) );
  AO22X1 U1104 ( .A0(HC4[7]), .A1(n932), .B0(n933), .B1(n940), .Y(n549) );
  XNOR2X1 U1105 ( .A(n890), .B(M4[6]), .Y(n940) );
  CLKINVX1 U1106 ( .A(M4[7]), .Y(n890) );
  XNOR2X1 U1107 ( .A(n148), .B(M3[1]), .Y(n944) );
  AO22X1 U1108 ( .A0(HC3[2]), .A1(n942), .B0(n943), .B1(n945), .Y(n546) );
  XNOR2X1 U1109 ( .A(n893), .B(M3[1]), .Y(n945) );
  AO22X1 U1110 ( .A0(HC3[3]), .A1(n942), .B0(n943), .B1(n946), .Y(n545) );
  XNOR2X1 U1111 ( .A(n894), .B(M3[2]), .Y(n946) );
  AO22X1 U1112 ( .A0(HC3[4]), .A1(n942), .B0(n943), .B1(n947), .Y(n544) );
  XNOR2X1 U1113 ( .A(n895), .B(M3[3]), .Y(n947) );
  AO22X1 U1114 ( .A0(HC3[5]), .A1(n942), .B0(n943), .B1(n948), .Y(n543) );
  XNOR2X1 U1115 ( .A(n896), .B(M3[4]), .Y(n948) );
  AO22X1 U1116 ( .A0(HC3[6]), .A1(n942), .B0(n943), .B1(n949), .Y(n542) );
  XNOR2X1 U1117 ( .A(n897), .B(M3[5]), .Y(n949) );
  AO22X1 U1118 ( .A0(HC3[7]), .A1(n942), .B0(n943), .B1(n950), .Y(n541) );
  XNOR2X1 U1119 ( .A(n898), .B(M3[6]), .Y(n950) );
  XNOR2X1 U1120 ( .A(n140), .B(M2[1]), .Y(n954) );
  AO22X1 U1121 ( .A0(HC2[2]), .A1(n952), .B0(n953), .B1(n955), .Y(n538) );
  XNOR2X1 U1122 ( .A(n901), .B(M2[1]), .Y(n955) );
  CLKINVX1 U1123 ( .A(M2[2]), .Y(n901) );
  AO22X1 U1124 ( .A0(HC2[3]), .A1(n952), .B0(n953), .B1(n956), .Y(n537) );
  XNOR2X1 U1125 ( .A(n902), .B(M2[2]), .Y(n956) );
  CLKINVX1 U1126 ( .A(M2[3]), .Y(n902) );
  AO22X1 U1127 ( .A0(HC2[4]), .A1(n952), .B0(n953), .B1(n957), .Y(n536) );
  XNOR2X1 U1128 ( .A(n903), .B(M2[3]), .Y(n957) );
  CLKINVX1 U1129 ( .A(M2[4]), .Y(n903) );
  AO22X1 U1130 ( .A0(HC2[5]), .A1(n952), .B0(n953), .B1(n958), .Y(n535) );
  XNOR2X1 U1131 ( .A(n904), .B(M2[4]), .Y(n958) );
  CLKINVX1 U1132 ( .A(M2[5]), .Y(n904) );
  AO22X1 U1133 ( .A0(HC2[6]), .A1(n952), .B0(n953), .B1(n959), .Y(n534) );
  XNOR2X1 U1134 ( .A(n905), .B(M2[5]), .Y(n959) );
  CLKINVX1 U1135 ( .A(M2[6]), .Y(n905) );
  AO22X1 U1136 ( .A0(HC2[7]), .A1(n952), .B0(n953), .B1(n960), .Y(n533) );
  XNOR2X1 U1137 ( .A(n906), .B(M2[6]), .Y(n960) );
  CLKINVX1 U1138 ( .A(M2[7]), .Y(n906) );
  XNOR2X1 U1139 ( .A(n132), .B(M1[1]), .Y(n964) );
  AO22X1 U1140 ( .A0(HC1[2]), .A1(n962), .B0(n963), .B1(n965), .Y(n530) );
  XNOR2X1 U1141 ( .A(n908), .B(M1[1]), .Y(n965) );
  AO22X1 U1142 ( .A0(HC1[3]), .A1(n962), .B0(n963), .B1(n966), .Y(n529) );
  XNOR2X1 U1143 ( .A(n909), .B(M1[2]), .Y(n966) );
  AO22X1 U1144 ( .A0(HC1[4]), .A1(n962), .B0(n963), .B1(n967), .Y(n528) );
  XNOR2X1 U1145 ( .A(n910), .B(M1[3]), .Y(n967) );
  AO22X1 U1146 ( .A0(HC1[5]), .A1(n962), .B0(n963), .B1(n968), .Y(n527) );
  XNOR2X1 U1147 ( .A(n866), .B(M1[4]), .Y(n968) );
  AO22X1 U1148 ( .A0(HC1[6]), .A1(n962), .B0(n963), .B1(n969), .Y(n526) );
  XNOR2X1 U1149 ( .A(n864), .B(M1[5]), .Y(n969) );
  AO22X1 U1150 ( .A0(HC1[7]), .A1(n962), .B0(n963), .B1(n970), .Y(n525) );
  XNOR2X1 U1151 ( .A(n911), .B(M1[6]), .Y(n970) );
  OAI31XL U1152 ( .A0(n972), .A1(gray_data[1]), .A2(n973), .B0(n974), .Y(n471)
         );
  CLKINVX1 U1153 ( .A(n339), .Y(n976) );
  CLKINVX1 U1154 ( .A(n318), .Y(n977) );
  CLKINVX1 U1155 ( .A(n311), .Y(n979) );
  CLKINVX1 U1156 ( .A(gray_data[0]), .Y(n972) );
  OAI31XL U1157 ( .A0(n978), .A1(gray_data[0]), .A2(n973), .B0(n980), .Y(n410)
         );
  OAI31XL U1158 ( .A0(n978), .A1(gray_data[0]), .A2(n975), .B0(n982), .Y(n390)
         );
  CLKINVX1 U1159 ( .A(n298), .Y(n982) );
  NOR4BBX1 U1160 ( .AN(gray_valid), .BN(n983), .C(gray_data[3]), .D(n691), .Y(
        n981) );
  NOR4X1 U1161 ( .A(gray_data[7]), .B(gray_data[6]), .C(gray_data[5]), .D(
        gray_data[4]), .Y(n983) );
  CLKINVX1 U1162 ( .A(gray_data[1]), .Y(n978) );
  NAND2X1 U1163 ( .A(n794), .B(n671), .Y(n801) );
  OA21XL U1164 ( .A0(n1182), .A1(CNT5[7]), .B0(n992), .Y(n794) );
  OAI222XL U1165 ( .A0(n1203), .A1(CNT4[7]), .B0(n993), .B1(n994), .C0(n1198), 
        .C1(CNT4[6]), .Y(n992) );
  AOI32X1 U1166 ( .A0(n995), .A1(n996), .A2(n997), .B0(n1184), .B1(CNT5[5]), 
        .Y(n994) );
  NAND2X1 U1167 ( .A(CNT4[5]), .B(n1211), .Y(n997) );
  OAI222XL U1168 ( .A0(n1213), .A1(n998), .B0(n999), .B1(n1000), .C0(n1207), 
        .C1(CNT4[3]), .Y(n996) );
  OAI32X1 U1169 ( .A0(n1001), .A1(n1002), .A2(n1003), .B0(n1192), .B1(CNT5[2]), 
        .Y(n1000) );
  NOR2X1 U1170 ( .A(n1209), .B(CNT4[2]), .Y(n1003) );
  CLKINVX1 U1171 ( .A(n1004), .Y(n1002) );
  OAI211X1 U1172 ( .A0(n1005), .A1(n1185), .B0(n1188), .C0(n1006), .Y(n1004)
         );
  NOR2BX1 U1173 ( .AN(n1185), .B(n1206), .Y(n1001) );
  NOR2X1 U1174 ( .A(n1186), .B(CNT5[3]), .Y(n999) );
  NAND2X1 U1175 ( .A(n1213), .B(n998), .Y(n995) );
  NOR2X1 U1176 ( .A(n1194), .B(CNT5[6]), .Y(n993) );
  NAND2X1 U1177 ( .A(n694), .B(n807), .Y(n990) );
  OA21XL U1178 ( .A0(n1009), .A1(n687), .B0(n674), .Y(n991) );
  OA22X1 U1179 ( .A0(CNT3[7]), .A1(n1182), .B0(n1010), .B1(n1011), .Y(n1009)
         );
  NOR2X1 U1180 ( .A(n1187), .B(CNT4[7]), .Y(n1011) );
  AOI32X1 U1181 ( .A0(n1012), .A1(n1013), .A2(n1014), .B0(n1015), .B1(n1016), 
        .Y(n1010) );
  OAI21XL U1182 ( .A0(n1017), .A1(n1194), .B0(n1018), .Y(n1016) );
  NAND2X1 U1183 ( .A(n1017), .B(n1194), .Y(n1015) );
  AOI32X1 U1184 ( .A0(n1197), .A1(n998), .A2(n1013), .B0(CNT4[5]), .B1(n1195), 
        .Y(n1017) );
  AOI2BB2X1 U1185 ( .B0(n1194), .B1(n1018), .A0N(n998), .A1N(n1197), .Y(n1014)
         );
  CLKINVX1 U1186 ( .A(n1196), .Y(n998) );
  NAND2X1 U1187 ( .A(n1184), .B(CNT3[5]), .Y(n1013) );
  OAI211X1 U1188 ( .A0(n1186), .A1(n1019), .B0(n1020), .C0(n1021), .Y(n1012)
         );
  OAI2BB1X1 U1189 ( .A0N(n1019), .A1N(n1186), .B0(n1191), .Y(n1021) );
  OAI222XL U1190 ( .A0(n1191), .A1(CNT4[3]), .B0(n1193), .B1(CNT4[2]), .C0(
        n1022), .C1(n1023), .Y(n1020) );
  NOR2X1 U1191 ( .A(n1185), .B(CNT3[1]), .Y(n1023) );
  AOI211X1 U1192 ( .A0(n1185), .A1(CNT3[1]), .B0(CNT3[0]), .C0(n1188), .Y(
        n1022) );
  NAND2X1 U1193 ( .A(n1193), .B(CNT4[2]), .Y(n1019) );
  NAND2X1 U1194 ( .A(total_groups[2]), .B(n694), .Y(n1008) );
  NAND2X1 U1195 ( .A(n793), .B(n671), .Y(n800) );
  OA21XL U1196 ( .A0(n1166), .A1(CNT3[7]), .B0(n1027), .Y(n793) );
  OAI222XL U1197 ( .A0(n1187), .A1(n1028), .B0(n1029), .B1(n1030), .C0(n1183), 
        .C1(CNT2[6]), .Y(n1027) );
  AOI32X1 U1198 ( .A0(n1031), .A1(n1032), .A2(n1033), .B0(n1168), .B1(CNT3[5]), 
        .Y(n1030) );
  NAND2X1 U1199 ( .A(n1195), .B(n1034), .Y(n1033) );
  OAI222XL U1200 ( .A0(n1197), .A1(n1035), .B0(n1036), .B1(n1037), .C0(n1191), 
        .C1(CNT2[3]), .Y(n1032) );
  OAI32X1 U1201 ( .A0(n1038), .A1(n1039), .A2(n1040), .B0(n1176), .B1(CNT3[2]), 
        .Y(n1037) );
  NOR2X1 U1202 ( .A(n1193), .B(n1041), .Y(n1040) );
  AOI211X1 U1203 ( .A0(n1190), .A1(n1042), .B0(n1043), .C0(n1189), .Y(n1039)
         );
  NOR2X1 U1204 ( .A(n1190), .B(n1042), .Y(n1038) );
  NOR2BX1 U1205 ( .AN(n1191), .B(n1170), .Y(n1036) );
  NAND2X1 U1206 ( .A(n1197), .B(n1035), .Y(n1031) );
  NOR2X1 U1207 ( .A(n1178), .B(n1018), .Y(n1029) );
  NAND2X1 U1208 ( .A(n694), .B(n1044), .Y(n1025) );
  OA21XL U1209 ( .A0(n1045), .A1(n687), .B0(n674), .Y(n987) );
  OA22X1 U1210 ( .A0(CNT5[7]), .A1(n1202), .B0(n1046), .B1(n1047), .Y(n1045)
         );
  NOR2X1 U1211 ( .A(n1203), .B(CNT6[7]), .Y(n1047) );
  AOI32X1 U1212 ( .A0(n1048), .A1(n1049), .A2(n1050), .B0(n1051), .B1(n1052), 
        .Y(n1046) );
  OAI21XL U1213 ( .A0(n1053), .A1(n1210), .B0(CNT5[6]), .Y(n1052) );
  NAND2X1 U1214 ( .A(n1053), .B(n1210), .Y(n1051) );
  AOI32X1 U1215 ( .A0(n1213), .A1(CNT6[4]), .A2(n1049), .B0(CNT6[5]), .B1(
        n1211), .Y(n1053) );
  AOI2BB2X1 U1216 ( .B0(n1210), .B1(CNT5[6]), .A0N(n1213), .A1N(CNT6[4]), .Y(
        n1050) );
  NAND2X1 U1217 ( .A(n1199), .B(CNT5[5]), .Y(n1049) );
  OAI211X1 U1218 ( .A0(n1200), .A1(n1054), .B0(n1055), .C0(n1056), .Y(n1048)
         );
  AO21X1 U1219 ( .A0(n1054), .A1(n1200), .B0(CNT5[3]), .Y(n1056) );
  OAI222XL U1220 ( .A0(n1207), .A1(CNT6[3]), .B0(n1209), .B1(n1057), .C0(n1058), .C1(n1059), .Y(n1055) );
  NOR2X1 U1221 ( .A(n1201), .B(n1005), .Y(n1059) );
  AOI211X1 U1222 ( .A0(n1201), .A1(n1005), .B0(n1006), .C0(n1204), .Y(n1058)
         );
  NAND2X1 U1223 ( .A(n1209), .B(n1057), .Y(n1054) );
  NOR2BX1 U1224 ( .AN(n1026), .B(n790), .Y(n974) );
  NOR3X1 U1225 ( .A(n807), .B(n697), .C(n808), .Y(n790) );
  OA21XL U1226 ( .A0(n1060), .A1(n687), .B0(n674), .Y(n1026) );
  CLKINVX1 U1227 ( .A(n672), .Y(n700) );
  OA22X1 U1228 ( .A0(CNT1[7]), .A1(n1166), .B0(n1062), .B1(n1063), .Y(n1060)
         );
  NOR2X1 U1229 ( .A(n1171), .B(n1028), .Y(n1063) );
  AOI32X1 U1230 ( .A0(n1064), .A1(n1065), .A2(n1066), .B0(n1067), .B1(n1068), 
        .Y(n1062) );
  OAI21XL U1231 ( .A0(n1069), .A1(n1178), .B0(CNT1[6]), .Y(n1068) );
  NAND2X1 U1232 ( .A(n1069), .B(n1178), .Y(n1067) );
  AOI32X1 U1233 ( .A0(n1181), .A1(n1035), .A2(n1065), .B0(n1034), .B1(n1179), 
        .Y(n1069) );
  AOI2BB2X1 U1234 ( .B0(n1178), .B1(CNT1[6]), .A0N(n1035), .A1N(n1181), .Y(
        n1066) );
  CLKINVX1 U1235 ( .A(n1180), .Y(n1035) );
  NAND2X1 U1236 ( .A(CNT1[5]), .B(n1168), .Y(n1065) );
  OAI211X1 U1237 ( .A0(n1170), .A1(n1070), .B0(n1071), .C0(n1072), .Y(n1064)
         );
  OAI2BB1X1 U1238 ( .A0N(n1070), .A1N(n1170), .B0(n1175), .Y(n1072) );
  OAI222XL U1239 ( .A0(n1175), .A1(CNT2[3]), .B0(n1177), .B1(n1041), .C0(n1073), .C1(n1074), .Y(n1071) );
  NOR2X1 U1240 ( .A(n1169), .B(CNT1[1]), .Y(n1074) );
  AOI211X1 U1241 ( .A0(n1169), .A1(CNT1[1]), .B0(CNT1[0]), .C0(n1172), .Y(
        n1073) );
  NAND2X1 U1242 ( .A(n1177), .B(n1041), .Y(n1070) );
  OAI2BB1X1 U1243 ( .A0N(n862), .A1N(n696), .B0(n674), .Y(n921) );
  OAI211X1 U1244 ( .A0(n1156), .A1(n682), .B0(n1075), .C0(n1076), .Y(n862) );
  CLKINVX1 U1245 ( .A(n1077), .Y(n1076) );
  OAI222XL U1246 ( .A0(n766), .A1(n808), .B0(n989), .B1(n1154), .C0(n985), 
        .C1(n1155), .Y(n1077) );
  AOI222XL U1247 ( .A0(\group_member[1][6] ), .A1(n679), .B0(
        \group_member[2][6] ), .B1(n678), .C0(n1083), .C1(n655), .Y(n1080) );
  OAI2BB1X1 U1248 ( .A0N(n859), .A1N(n696), .B0(n674), .Y(n931) );
  OAI211X1 U1249 ( .A0(n682), .A1(n769), .B0(n1086), .C0(n1087), .Y(n859) );
  AOI222XL U1250 ( .A0(\group_member[2][5] ), .A1(n1088), .B0(
        \group_member[5][5] ), .B1(n676), .C0(\group_member[6][5] ), .C1(n675), 
        .Y(n1087) );
  AOI222XL U1251 ( .A0(\group_member[4][5] ), .A1(n1096), .B0(
        \group_member[5][5] ), .B1(n1097), .C0(\group_member[6][5] ), .C1(
        n1098), .Y(n1095) );
  OAI2BB1X1 U1252 ( .A0N(n856), .A1N(n696), .B0(n674), .Y(n941) );
  OAI211X1 U1253 ( .A0(n1159), .A1(n682), .B0(n1100), .C0(n1101), .Y(n856) );
  AOI222XL U1254 ( .A0(\group_member[2][4] ), .A1(n1088), .B0(
        \group_member[5][4] ), .B1(n676), .C0(\group_member[6][4] ), .C1(n675), 
        .Y(n1101) );
  AOI222XL U1255 ( .A0(\group_member[1][4] ), .A1(n679), .B0(
        \group_member[2][4] ), .B1(n678), .C0(\group_member[3][4] ), .C1(n1083), .Y(n1103) );
  OAI2BB1X1 U1256 ( .A0N(n853), .A1N(n696), .B0(n674), .Y(n951) );
  OAI211X1 U1257 ( .A0(n682), .A1(n781), .B0(n1104), .C0(n1105), .Y(n853) );
  AOI222XL U1258 ( .A0(\group_member[2][3] ), .A1(n1088), .B0(
        \group_member[5][3] ), .B1(n676), .C0(\group_member[6][3] ), .C1(n675), 
        .Y(n1105) );
  AOI222XL U1259 ( .A0(\group_member[4][3] ), .A1(n1096), .B0(
        \group_member[5][3] ), .B1(n1097), .C0(\group_member[6][3] ), .C1(
        n1098), .Y(n1108) );
  OAI2BB1X1 U1260 ( .A0N(n850), .A1N(n696), .B0(n674), .Y(n961) );
  OAI211X1 U1261 ( .A0(n1161), .A1(n682), .B0(n1109), .C0(n1110), .Y(n850) );
  AOI222XL U1262 ( .A0(\group_member[2][2] ), .A1(n1088), .B0(
        \group_member[5][2] ), .B1(n676), .C0(\group_member[6][2] ), .C1(n675), 
        .Y(n1110) );
  AOI222XL U1263 ( .A0(\group_member[1][2] ), .A1(n679), .B0(
        \group_member[2][2] ), .B1(n678), .C0(\group_member[3][2] ), .C1(n1083), .Y(n1112) );
  OAI2BB1X1 U1264 ( .A0N(n820), .A1N(n696), .B0(n674), .Y(n971) );
  OAI211X1 U1265 ( .A0(n1162), .A1(n682), .B0(n1113), .C0(n1114), .Y(n820) );
  AOI222XL U1266 ( .A0(n1088), .A1(n654), .B0(n676), .B1(\group_member[5][1] ), 
        .C0(n675), .C1(\group_member[6][1] ), .Y(n1114) );
  AOI222XL U1267 ( .A0(n1096), .A1(n653), .B0(\group_member[5][1] ), .B1(n1097), .C0(\group_member[6][1] ), .C1(n1098), .Y(n1116) );
  NOR3X1 U1268 ( .A(n786), .B(cs[0]), .C(n1061), .Y(N752) );
  NOR3X1 U1269 ( .A(n1061), .B(cs[2]), .C(cs[0]), .Y(N751) );
  OAI211X1 U1270 ( .A0(n1188), .A1(n682), .B0(n1118), .C0(n1119), .Y(N488) );
  AOI222XL U1271 ( .A0(n1088), .A1(n1043), .B0(n676), .B1(n1006), .C0(n675), 
        .C1(CNT6[0]), .Y(n1119) );
  CLKINVX1 U1272 ( .A(n1205), .Y(n1006) );
  OAI211X1 U1273 ( .A0(n1185), .A1(n682), .B0(n1120), .C0(n1121), .Y(N487) );
  AOI222XL U1274 ( .A0(n1088), .A1(n1042), .B0(n676), .B1(n1005), .C0(n675), 
        .C1(CNT6[1]), .Y(n1121) );
  CLKINVX1 U1275 ( .A(n1206), .Y(n1005) );
  OAI211X1 U1276 ( .A0(n1192), .A1(n682), .B0(n1122), .C0(n1123), .Y(N486) );
  AOI222XL U1277 ( .A0(n1088), .A1(n1041), .B0(n676), .B1(CNT5[2]), .C0(n675), 
        .C1(n1057), .Y(n1123) );
  OAI211X1 U1278 ( .A0(n1186), .A1(n682), .B0(n1124), .C0(n1125), .Y(N485) );
  AOI222XL U1279 ( .A0(n1088), .A1(CNT2[3]), .B0(n676), .B1(CNT5[3]), .C0(n675), .C1(CNT6[3]), .Y(n1125) );
  OAI211X1 U1280 ( .A0(n1196), .A1(n682), .B0(n1126), .C0(n1127), .Y(N484) );
  CLKINVX1 U1281 ( .A(n1128), .Y(n1127) );
  OAI222XL U1282 ( .A0(n808), .A1(n1180), .B0(n989), .B1(n1213), .C0(n985), 
        .C1(n1212), .Y(n1128) );
  OAI211X1 U1283 ( .A0(n1184), .A1(n682), .B0(n1129), .C0(n1130), .Y(N483) );
  AOI222XL U1284 ( .A0(n1088), .A1(n1034), .B0(n676), .B1(CNT5[5]), .C0(n675), 
        .C1(CNT6[5]), .Y(n1130) );
  OAI211X1 U1285 ( .A0(n1194), .A1(n682), .B0(n1131), .C0(n1132), .Y(N482) );
  CLKINVX1 U1286 ( .A(n1133), .Y(n1132) );
  OAI222XL U1287 ( .A0(n808), .A1(n1178), .B0(n989), .B1(n1198), .C0(n985), 
        .C1(n1210), .Y(n1133) );
  CLKINVX1 U1288 ( .A(n675), .Y(n985) );
  CLKINVX1 U1289 ( .A(n676), .Y(n989) );
  CLKINVX1 U1290 ( .A(n1088), .Y(n808) );
  OAI211X1 U1291 ( .A0(n1182), .A1(n682), .B0(n1134), .C0(n1135), .Y(N481) );
  AOI222XL U1292 ( .A0(n1088), .A1(n1028), .B0(n676), .B1(CNT5[7]), .C0(n675), 
        .C1(CNT6[7]), .Y(n1135) );
  CLKINVX1 U1294 ( .A(n1172), .Y(n1043) );
  AOI2BB2X1 U1295 ( .B0(CNT6[0]), .B1(n1098), .A0N(n1205), .A1N(n680), .Y(
        n1136) );
  OAI211X1 U1296 ( .A0(n1185), .A1(n681), .B0(n1138), .C0(n1139), .Y(N473) );
  AOI222XL U1297 ( .A0(n679), .A1(CNT1[1]), .B0(n678), .B1(n1042), .C0(n1083), 
        .C1(CNT3[1]), .Y(n1139) );
  CLKINVX1 U1298 ( .A(n1169), .Y(n1042) );
  OAI211X1 U1299 ( .A0(n1192), .A1(n681), .B0(n1140), .C0(n1141), .Y(N472) );
  AOI222XL U1300 ( .A0(n679), .A1(CNT1[2]), .B0(n678), .B1(n1041), .C0(n1083), 
        .C1(CNT3[2]), .Y(n1141) );
  CLKINVX1 U1301 ( .A(n1176), .Y(n1041) );
  CLKINVX1 U1302 ( .A(n1208), .Y(n1057) );
  OAI211X1 U1303 ( .A0(n1186), .A1(n681), .B0(n1142), .C0(n1143), .Y(N471) );
  OAI222XL U1304 ( .A0(n1093), .A1(n1175), .B0(n1099), .B1(n1170), .C0(n1117), 
        .C1(n1191), .Y(n1144) );
  OAI211X1 U1305 ( .A0(n1196), .A1(n681), .B0(n1145), .C0(n1146), .Y(N470) );
  OAI222XL U1306 ( .A0(n1093), .A1(n1181), .B0(n1099), .B1(n1180), .C0(n1117), 
        .C1(n1197), .Y(n1147) );
  OAI211X1 U1307 ( .A0(n1184), .A1(n681), .B0(n1148), .C0(n1149), .Y(N469) );
  AOI222XL U1308 ( .A0(n679), .A1(CNT1[5]), .B0(n678), .B1(n1034), .C0(n1083), 
        .C1(CNT3[5]), .Y(n1149) );
  CLKINVX1 U1309 ( .A(n1168), .Y(n1034) );
  OAI211X1 U1310 ( .A0(n1194), .A1(n681), .B0(n1150), .C0(n1151), .Y(N468) );
  AOI222XL U1311 ( .A0(n679), .A1(CNT1[6]), .B0(n678), .B1(CNT2[6]), .C0(n1083), .C1(n1018), .Y(n1151) );
  CLKINVX1 U1312 ( .A(n1183), .Y(n1018) );
  AOI222XL U1313 ( .A0(n679), .A1(CNT1[7]), .B0(n678), .B1(n1028), .C0(n1083), 
        .C1(CNT3[7]), .Y(n1153) );
  NAND2X1 U1314 ( .A(n813), .B(n988), .Y(n1117) );
  CLKINVX1 U1315 ( .A(n1166), .Y(n1028) );
  NOR2X1 U1316 ( .A(n813), .B(n988), .Y(n1096) );
  huffman_DW01_add_0 add_174 ( .A({N467, N468, N469, N470, N471, N472, N473, 
        N474}), .B({N481, N482, N483, N484, N485, N486, N487, N488}), .CI(1'b0), .SUM({N496, N495, N494, N493, N492, N491, N490, N489}) );
  huffman_DW01_inc_0 add_121 ( .A(counter), .SUM({N332, N331, N330, N329, N328, 
        N327, N326}) );
  huffman_DW01_inc_1 add_118 ( .A(CNT6), .SUM({N312, N311, N310, N309, N308, 
        N307, N306, N305}) );
  huffman_DW01_inc_2 add_117 ( .A(CNT5), .SUM({N304, N303, N302, N301, N300, 
        N299, N298, N297}) );
  huffman_DW01_inc_3 add_116 ( .A(CNT4), .SUM({N296, N295, N294, N293, N292, 
        N291, N290, N289}) );
  huffman_DW01_inc_4 add_115 ( .A(CNT3), .SUM({N288, N287, N286, N285, N284, 
        N283, N282, N281}) );
  huffman_DW01_inc_5 add_114 ( .A(CNT2), .SUM({N280, N279, N278, N277, N276, 
        N275, N274, N273}) );
  huffman_DW01_inc_6 add_113 ( .A(CNT1), .SUM({N272, N271, N270, N269, N268, 
        N267, N266, N265}) );
  DFFX1 \total_groups_reg[2]  ( .D(n639), .CK(clk), .Q(total_groups[2]), .QN(
        n1044) );
  DFFX1 \total_groups_reg[1]  ( .D(n640), .CK(clk), .Q(total_groups[1]), .QN(
        n807) );
  DFFQX1 \counter_reg[0]  ( .D(n651), .CK(clk), .Q(counter[0]) );
  DFFQX1 \counter_reg[4]  ( .D(n645), .CK(clk), .Q(counter[4]) );
  DFFQX1 \counter_reg[3]  ( .D(n644), .CK(clk), .Q(counter[3]) );
  DFFQX1 \counter_reg[2]  ( .D(n643), .CK(clk), .Q(counter[2]) );
  DFFQX1 \counter_reg[1]  ( .D(n642), .CK(clk), .Q(counter[1]) );
  DFFQX1 \counter_reg[5]  ( .D(n646), .CK(clk), .Q(counter[5]) );
  DFFQX1 \counter_reg[6]  ( .D(n650), .CK(clk), .Q(counter[6]) );
  DFFQX1 \group_member_reg[6][4]  ( .D(n621), .CK(clk), .Q(
        \group_member[6][4] ) );
  DFFQX1 \group_member_reg[1][4]  ( .D(n617), .CK(clk), .Q(
        \group_member[1][4] ) );
  DFFQX1 \group_member_reg[6][3]  ( .D(n622), .CK(clk), .Q(
        \group_member[6][3] ) );
  DFFQX1 \group_member_reg[1][6]  ( .D(n615), .CK(clk), .Q(
        \group_member[1][6] ) );
  DFFQX1 \group_member_reg[6][2]  ( .D(n623), .CK(clk), .Q(
        \group_member[6][2] ) );
  DFFQX1 \group_member_reg[1][2]  ( .D(n619), .CK(clk), .Q(
        \group_member[1][2] ) );
  DFFQX1 \group_member_reg[6][1]  ( .D(n638), .CK(clk), .Q(
        \group_member[6][1] ) );
  DFFQX1 \group_member_reg[6][5]  ( .D(n620), .CK(clk), .Q(
        \group_member[6][5] ) );
  DFFQX2 \M_reg[2][1]  ( .D(n585), .CK(clk), .Q(M2[1]) );
  DFFX2 \total_groups_reg[0]  ( .D(n641), .CK(clk), .Q(total_groups[0]), .QN(
        n988) );
  DFFX2 \M_reg[4][1]  ( .D(n599), .CK(clk), .Q(M4[1]), .QN(n883) );
  DFFX2 \M_reg[6][1]  ( .D(n613), .CK(clk), .Q(M6[1]), .QN(n867) );
  DFFX2 \M_reg[5][1]  ( .D(n606), .CK(clk), .Q(M5[1]), .QN(n875) );
  DFFX2 \M_reg[3][1]  ( .D(n592), .CK(clk), .Q(M3[1]), .QN(n891) );
  DFFX2 \M_reg[1][1]  ( .D(n578), .CK(clk), .Q(M1[1]), .QN(n907) );
  DFFQX2 \M_reg[2][6]  ( .D(n580), .CK(clk), .Q(M2[6]) );
  DFFQX2 \M_reg[2][5]  ( .D(n581), .CK(clk), .Q(M2[5]) );
  DFFQX2 \M_reg[2][4]  ( .D(n582), .CK(clk), .Q(M2[4]) );
  DFFQX2 \M_reg[2][3]  ( .D(n583), .CK(clk), .Q(M2[3]) );
  DFFQX2 \M_reg[2][2]  ( .D(n584), .CK(clk), .Q(M2[2]) );
  DFFQX2 \M_reg[4][6]  ( .D(n594), .CK(clk), .Q(M4[6]) );
  DFFQX2 \M_reg[4][5]  ( .D(n595), .CK(clk), .Q(M4[5]) );
  DFFQX2 \M_reg[4][4]  ( .D(n596), .CK(clk), .Q(M4[4]) );
  DFFQX2 \M_reg[4][3]  ( .D(n597), .CK(clk), .Q(M4[3]) );
  DFFQX2 \M_reg[4][2]  ( .D(n598), .CK(clk), .Q(M4[2]) );
  DFFX2 \M_reg[5][6]  ( .D(n601), .CK(clk), .Q(M5[6]), .QN(n881) );
  DFFX2 \M_reg[5][5]  ( .D(n602), .CK(clk), .Q(M5[5]), .QN(n880) );
  DFFX2 \M_reg[5][4]  ( .D(n603), .CK(clk), .Q(M5[4]), .QN(n879) );
  DFFX2 \M_reg[5][3]  ( .D(n604), .CK(clk), .Q(M5[3]), .QN(n878) );
  DFFX2 \M_reg[5][2]  ( .D(n605), .CK(clk), .Q(M5[2]), .QN(n877) );
  DFFX2 \M_reg[6][6]  ( .D(n608), .CK(clk), .Q(M6[6]), .QN(n873) );
  DFFX2 \M_reg[6][5]  ( .D(n609), .CK(clk), .Q(M6[5]), .QN(n872) );
  DFFX2 \M_reg[6][4]  ( .D(n610), .CK(clk), .Q(M6[4]), .QN(n871) );
  DFFX2 \M_reg[6][3]  ( .D(n611), .CK(clk), .Q(M6[3]), .QN(n870) );
  DFFX2 \M_reg[6][2]  ( .D(n612), .CK(clk), .Q(M6[2]), .QN(n869) );
  DFFX2 \M_reg[3][6]  ( .D(n587), .CK(clk), .Q(M3[6]), .QN(n897) );
  DFFX2 \M_reg[3][5]  ( .D(n588), .CK(clk), .Q(M3[5]), .QN(n896) );
  DFFX2 \M_reg[3][4]  ( .D(n589), .CK(clk), .Q(M3[4]), .QN(n895) );
  DFFX2 \M_reg[3][3]  ( .D(n590), .CK(clk), .Q(M3[3]), .QN(n894) );
  DFFX2 \M_reg[3][2]  ( .D(n591), .CK(clk), .Q(M3[2]), .QN(n893) );
  DFFX2 \M_reg[1][6]  ( .D(n614), .CK(clk), .Q(M1[6]), .QN(n864) );
  DFFX2 \M_reg[1][5]  ( .D(n574), .CK(clk), .Q(M1[5]), .QN(n866) );
  DFFX2 \M_reg[1][4]  ( .D(n575), .CK(clk), .Q(M1[4]), .QN(n910) );
  DFFX2 \M_reg[1][3]  ( .D(n576), .CK(clk), .Q(M1[3]), .QN(n909) );
  DFFX2 \M_reg[1][2]  ( .D(n577), .CK(clk), .Q(M1[2]), .QN(n908) );
  DFFQX2 \M_reg[2][7]  ( .D(n579), .CK(clk), .Q(M2[7]) );
  DFFQX2 \M_reg[4][7]  ( .D(n593), .CK(clk), .Q(M4[7]) );
  DFFQX2 \HC_reg[5][1]  ( .D(n563), .CK(clk), .Q(HC5[1]) );
  DFFQX2 \HC_reg[5][0]  ( .D(n564), .CK(clk), .Q(HC5[0]) );
  DFFQX2 \HC_reg[2][1]  ( .D(n539), .CK(clk), .Q(HC2[1]) );
  DFFQX2 \HC_reg[2][0]  ( .D(n540), .CK(clk), .Q(HC2[0]) );
  DFFQX2 \HC_reg[4][1]  ( .D(n555), .CK(clk), .Q(HC4[1]) );
  DFFQX2 \HC_reg[4][0]  ( .D(n556), .CK(clk), .Q(HC4[0]) );
  DFFQX2 \HC_reg[3][1]  ( .D(n547), .CK(clk), .Q(HC3[1]) );
  DFFQX2 \HC_reg[3][0]  ( .D(n548), .CK(clk), .Q(HC3[0]) );
  DFFQX2 \HC_reg[5][7]  ( .D(n557), .CK(clk), .Q(HC5[7]) );
  DFFQX2 \HC_reg[5][6]  ( .D(n558), .CK(clk), .Q(HC5[6]) );
  DFFQX2 \HC_reg[5][5]  ( .D(n559), .CK(clk), .Q(HC5[5]) );
  DFFQX2 \HC_reg[5][4]  ( .D(n560), .CK(clk), .Q(HC5[4]) );
  DFFQX2 \HC_reg[5][3]  ( .D(n561), .CK(clk), .Q(HC5[3]) );
  DFFQX2 \HC_reg[5][2]  ( .D(n562), .CK(clk), .Q(HC5[2]) );
  DFFQX2 \HC_reg[2][7]  ( .D(n533), .CK(clk), .Q(HC2[7]) );
  DFFQX2 \HC_reg[2][6]  ( .D(n534), .CK(clk), .Q(HC2[6]) );
  DFFQX2 \HC_reg[2][5]  ( .D(n535), .CK(clk), .Q(HC2[5]) );
  DFFQX2 \HC_reg[2][4]  ( .D(n536), .CK(clk), .Q(HC2[4]) );
  DFFQX2 \HC_reg[2][3]  ( .D(n537), .CK(clk), .Q(HC2[3]) );
  DFFQX2 \HC_reg[2][2]  ( .D(n538), .CK(clk), .Q(HC2[2]) );
  DFFQX2 \HC_reg[4][7]  ( .D(n549), .CK(clk), .Q(HC4[7]) );
  DFFQX2 \HC_reg[4][6]  ( .D(n550), .CK(clk), .Q(HC4[6]) );
  DFFQX2 \HC_reg[4][5]  ( .D(n551), .CK(clk), .Q(HC4[5]) );
  DFFQX2 \HC_reg[4][4]  ( .D(n552), .CK(clk), .Q(HC4[4]) );
  DFFQX2 \HC_reg[4][3]  ( .D(n553), .CK(clk), .Q(HC4[3]) );
  DFFQX2 \HC_reg[4][2]  ( .D(n554), .CK(clk), .Q(HC4[2]) );
  DFFQX2 \HC_reg[1][1]  ( .D(n531), .CK(clk), .Q(HC1[1]) );
  DFFQX2 \HC_reg[1][0]  ( .D(n532), .CK(clk), .Q(HC1[0]) );
  DFFQX2 \HC_reg[3][7]  ( .D(n541), .CK(clk), .Q(HC3[7]) );
  DFFQX2 \HC_reg[3][6]  ( .D(n542), .CK(clk), .Q(HC3[6]) );
  DFFQX2 \HC_reg[3][5]  ( .D(n543), .CK(clk), .Q(HC3[5]) );
  DFFQX2 \HC_reg[3][4]  ( .D(n544), .CK(clk), .Q(HC3[4]) );
  DFFQX2 \HC_reg[3][3]  ( .D(n545), .CK(clk), .Q(HC3[3]) );
  DFFQX2 \HC_reg[3][2]  ( .D(n546), .CK(clk), .Q(HC3[2]) );
  DFFQX2 \HC_reg[1][7]  ( .D(n525), .CK(clk), .Q(HC1[7]) );
  DFFQX2 \HC_reg[1][6]  ( .D(n526), .CK(clk), .Q(HC1[6]) );
  DFFQX2 \HC_reg[1][5]  ( .D(n527), .CK(clk), .Q(HC1[5]) );
  DFFQX2 \HC_reg[1][4]  ( .D(n528), .CK(clk), .Q(HC1[4]) );
  DFFQX2 \HC_reg[1][3]  ( .D(n529), .CK(clk), .Q(HC1[3]) );
  DFFQX2 \HC_reg[1][2]  ( .D(n530), .CK(clk), .Q(HC1[2]) );
  DFFQX2 \HC_reg[6][1]  ( .D(n571), .CK(clk), .Q(HC6[1]) );
  DFFQX2 \HC_reg[6][0]  ( .D(n572), .CK(clk), .Q(HC6[0]) );
  DFFQX2 \HC_reg[6][7]  ( .D(n565), .CK(clk), .Q(HC6[7]) );
  DFFQX2 \HC_reg[6][6]  ( .D(n566), .CK(clk), .Q(HC6[6]) );
  DFFQX2 \HC_reg[6][5]  ( .D(n567), .CK(clk), .Q(HC6[5]) );
  DFFQX2 \HC_reg[6][4]  ( .D(n568), .CK(clk), .Q(HC6[4]) );
  DFFQX2 \HC_reg[6][3]  ( .D(n569), .CK(clk), .Q(HC6[3]) );
  DFFQX2 \HC_reg[6][2]  ( .D(n570), .CK(clk), .Q(HC6[2]) );
  DFFQX2 CNT_valid_reg ( .D(N751), .CK(clk), .Q(CNT_valid) );
  DFFQX2 code_valid_reg ( .D(N752), .CK(clk), .Q(code_valid) );
  DFFX2 \M_reg[5][7]  ( .D(n600), .CK(clk), .Q(M5[7]), .QN(n882) );
  DFFX2 \M_reg[6][7]  ( .D(n607), .CK(clk), .Q(M6[7]), .QN(n874) );
  DFFX2 \M_reg[3][7]  ( .D(n586), .CK(clk), .Q(M3[7]), .QN(n898) );
  DFFX2 \M_reg[1][7]  ( .D(n573), .CK(clk), .Q(M1[7]), .QN(n911) );
  EDFFX2 \M_reg[2][0]  ( .D(n695), .E(n266), .CK(clk), .Q(M2[0]), .QN(n140) );
  NAND2X1 U649 ( .A(n807), .B(n988), .Y(n1007) );
endmodule

