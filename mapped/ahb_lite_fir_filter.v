/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sat Oct 30 20:42:36 2021
/////////////////////////////////////////////////////////////


module ahb_lite_slave ( clk, n_rst, sample_data, data_ready, 
        new_coefficient_set, clear_new_coefficient, processed, coefficient_num, 
        fir_coefficient, modwait, fir_out, err, hsel, haddr, hsize, htrans, 
        hwrite, hwdata, hrdata, hresp );
  output [15:0] sample_data;
  input [1:0] coefficient_num;
  output [15:0] fir_coefficient;
  input [15:0] fir_out;
  input [3:0] haddr;
  input [1:0] htrans;
  input [15:0] hwdata;
  output [15:0] hrdata;
  input clk, n_rst, clear_new_coefficient, processed, modwait, err, hsel,
         hsize, hwrite;
  output data_ready, new_coefficient_set, hresp;
  wire   N82, N83, N84, N85, N93, N94, write1, \register[15][7] ,
         \register[15][6] , \register[15][5] , \register[15][4] ,
         \register[15][3] , \register[15][2] , \register[15][1] ,
         \register[15][0] , \register[14][7] , \register[14][6] ,
         \register[14][5] , \register[14][4] , \register[14][3] ,
         \register[14][2] , \register[14][1] , \register[13][7] ,
         \register[13][6] , \register[13][5] , \register[13][4] ,
         \register[13][3] , \register[13][2] , \register[13][1] ,
         \register[13][0] , \register[12][7] , \register[12][6] ,
         \register[12][5] , \register[12][4] , \register[12][3] ,
         \register[12][2] , \register[12][1] , \register[12][0] ,
         \register[11][7] , \register[11][6] , \register[11][5] ,
         \register[11][4] , \register[11][3] , \register[11][2] ,
         \register[11][1] , \register[11][0] , \register[10][7] ,
         \register[10][6] , \register[10][5] , \register[10][4] ,
         \register[10][3] , \register[10][2] , \register[10][1] ,
         \register[10][0] , \register[9][7] , \register[9][6] ,
         \register[9][5] , \register[9][4] , \register[9][3] ,
         \register[9][2] , \register[9][1] , \register[9][0] ,
         \register[8][7] , \register[8][6] , \register[8][5] ,
         \register[8][4] , \register[8][3] , \register[8][2] ,
         \register[8][1] , \register[8][0] , \register[7][7] ,
         \register[7][6] , \register[7][5] , \register[7][4] ,
         \register[7][3] , \register[7][2] , \register[7][1] ,
         \register[7][0] , \register[6][7] , \register[6][6] ,
         \register[6][5] , \register[6][4] , \register[6][3] ,
         \register[6][2] , \register[6][1] , \register[6][0] ,
         \register[3][7] , \register[3][6] , \register[3][5] ,
         \register[3][4] , \register[3][3] , \register[3][2] ,
         \register[3][1] , \register[3][0] , \register[2][7] ,
         \register[2][6] , \register[2][5] , \register[2][4] ,
         \register[2][3] , \register[2][2] , \register[2][1] ,
         \register[2][0] , \register[1][7] , \register[1][6] ,
         \register[1][5] , \register[1][4] , \register[1][3] ,
         \register[1][2] , \register[1][1] , \register[1][0] ,
         \register[0][7] , \register[0][6] , \register[0][5] ,
         \register[0][4] , \register[0][3] , \register[0][2] ,
         \register[0][1] , \register[0][0] , next_data_ready,
         \nexregister[14][7] , \nexregister[14][6] , \nexregister[14][5] ,
         \nexregister[14][4] , \nexregister[14][3] , \nexregister[14][2] ,
         \nexregister[14][1] , \nexregister[14][0] , \nexregister[3][7] ,
         \nexregister[3][6] , \nexregister[3][5] , \nexregister[3][4] ,
         \nexregister[3][3] , \nexregister[3][2] , \nexregister[3][1] ,
         \nexregister[3][0] , \nexregister[2][7] , \nexregister[2][6] ,
         \nexregister[2][5] , \nexregister[2][4] , \nexregister[2][3] ,
         \nexregister[2][2] , \nexregister[2][1] , \nexregister[2][0] ,
         \nexregister[1][7] , \nexregister[1][6] , \nexregister[1][5] ,
         \nexregister[1][4] , \nexregister[1][3] , \nexregister[1][2] ,
         \nexregister[1][1] , \nexregister[1][0] , \nexregister[0][7] ,
         \nexregister[0][6] , \nexregister[0][5] , \nexregister[0][4] ,
         \nexregister[0][3] , \nexregister[0][2] , \nexregister[0][1] ,
         \nexregister[0][0] , N402, N403, N404, N405, N406, N407, N408, N409,
         N411, N412, N413, N414, N415, N416, N417, N434, N435, N436, N437,
         N438, N439, N440, N441, N442, N443, N444, N445, N446, N447, N448,
         N449, N450, N451, N452, N453, N454, N455, N456, N457, N458, N459,
         N460, N461, N462, N463, N464, N465, N466, N467, N468, N469, N470,
         N471, N472, N473, N474, N475, N476, N477, N478, N479, N480, N481,
         N482, N483, N484, N485, N486, N487, N488, N489, N490, N491, N492,
         N493, N494, N495, N496, N497, N498, N499, N500, N501, N502, N503,
         N504, N505, N506, N507, N508, N509, N510, N511, N512, N513, N522,
         N523, N524, N525, N526, N527, N528, N529, N965, N966, N967, N968,
         N969, N970, N971, N972, N973, N974, N975, N976, N977, N978, N979,
         N980, N981, N982, N983, N984, N985, N986, N987, N988, n14, n15, n16,
         n17, n18, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n77, n78, n79, n80, n82, n84, n86,
         n89, n97, n113, n116, n131, n132, n133, n134, n135, n136, n138, n140,
         n142, n144, n146, n148, n150, n152, n154, n156, n157, n158, n159,
         n162, n163, n165, n173, n174, n175, n176, n177, n178, n179, n181,
         n182, n185, n187, n189, n191, n193, n195, n197, n198, n199, n201,
         n203, n204, n206, n214, n215, n216, n217, n218, n220, n221, n224,
         n226, n228, n230, n232, n234, n236, n237, n238, n240, n241, n243,
         n251, n252, n253, n256, n257, n258, n260, n261, n264, n266, n268,
         n270, n272, n274, n276, n277, n278, n280, n282, n284, n292, n293,
         n294, n296, n297, n300, n302, n304, n306, n308, n310, n312, n313,
         n314, n316, n318, n320, n324, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n336, n339, n340, n343, n344, n345, n347, n348,
         n349, n350, n351, n352, n386, n388, n390, n392, n394, n396, n398,
         n400, n410, n412, n414, n416, n418, n420, n422, n424, n426, n428,
         n430, n432, n434, n436, n438, n440, n442, n444, n446, n448, n450,
         n452, n454, n456, n458, n460, n462, n464, n466, n468, n470, n472,
         n474, n476, n478, n480, n482, n484, n486, n488, n490, n492, n494,
         n496, n498, n500, n502, n504, n506, n508, n510, n512, n514, n516,
         n518, n520, n522, n524, n526, n528, n530, n532, n534, n536, n538,
         n540, n542, n544, n546, n548, n550, n552, n554, n556, n558, n560,
         n562, n564, n566, n568, n574, n727, n728, n729, n730, n731, n732,
         n733, n734, n735, n736, n737, n738, n739, n740, n741, n742, n743,
         n744, n748, n749, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n76, n81, n83,
         n85, n87, n88, n90, n91, n92, n93, n94, n95, n96, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n114, n115, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n137, n139, n141, n143, n145,
         n147, n149, n151, n153, n155, n160, n161, n164, n166, n167, n168,
         n169, n170, n171, n172, n180, n183, n184, n186, n188, n190, n192,
         n194, n196, n200, n202, n205, n207, n208, n209, n210, n211, n212,
         n213, n219, n222, n223, n225, n227, n229, n231, n233, n235, n239,
         n242, n244, n245, n246, n247, n248, n249, n250, n254, n255, n259,
         n262, n263, n265, n267, n269, n271, n273, n275, n279, n281, n283,
         n285, n286, n287, n288, n289, n290, n291, n295, n298, n299, n301,
         n303, n305, n307, n309, n311, n315, n317, n319, n321, n322, n323,
         n325, n335, n337, n338, n341, n342, n346, n591, n592, n593, n594,
         n595, n596, n597, n598, n599, n600, n601, n602, n603, n604, n605,
         n606, n607, n608, n609, n610, n611, n612, n613, n614, n615, n616,
         n617, n618, n619, n620, n621, n622, n623, n624, n625, n626, n627,
         n628, n629, n630, n631, n632, n633, n634, n635, n636, n637, n638,
         n639, n640, n641, n642, n643, n644, n645, n646, n647, n648, n649,
         n650, n651, n652, n653, n654, n655, n656, n657, n658, n659, n660,
         n661, n662, n663, n664, n665, n666, n667, n668, n669, n670, n671,
         n672, n673, n674, n675, n676, n677, n678, n679, n680, n681, n682,
         n683, n684, n685, n686, n687, n688, n689, n690, n691, n692, n693,
         n694, n695, n696, n697, n698, n699, n700, n701, n702, n703, n704,
         n705, n706, n707, n708, n709, n710, n711, n712, n713, n714, n715,
         n716, n717, n718, n719, n720, n721, n722, n723, n724, n725, n726,
         n745, n746, n747, n750, n751, n752, n753, n754, n755, n756, n757,
         n758, n759, n760, n761, n762, n763, n764, n765, n766, n767, n768,
         n769, n770, n771, n772, n773, n774, n775, n776, n777, n778, n779,
         n780, n781, n782, n783, n784, n785, n786, n787, n788, n789, n790,
         n791, n792, n793, n794, n795, n796, n797, n798, n799, n800, n801,
         n802, n803, n804, n805, n806, n807, n808, n809, n810, n811, n812,
         n813, n814, n815, n816, n817, n818, n819, n820, n821, n822, n823,
         n824, n825, n826, n827, n828, n829, n830, n831, n832, n833, n834,
         n835, n836, n837, n838, n839, n840, n841, n842, n843, n844, n845,
         n846, n847, n848, n849, n850, n851, n852, n853, n854, n855, n856,
         n857, n858, n859, n860, n861, n862, n863, n864, n865, n866, n867,
         n868, n869, n870, n871, n872, n873, n874, n875, n876, n877, n878,
         n879, n880, n881, n882, n883, n884, n885, n886, n887, n888, n889,
         n890, n891, n892, n893, n894, n895, n896, n897, n898, n899, n900,
         n901, n902, n903, n904, n905, n906, n907, n908, n909, n910, n911,
         n912, n913, n914, n915, n916, n917, n918, n919, n920, n921, n922,
         n923, n924, n925, n926, n927, n928, n929, n930, n931, n932, n933,
         n934, n935, n936, n937, n938, n939, n940, n941, n942, n943, n944,
         n945, n946, n947, n948, n949, n950, n951, n952, n953, n954, n955,
         n956, n957, n958, n959, n960, n961, n962, n963, n964, n965, n966,
         n967, n968, n969, n970, n971, n972, n973, n974, n975, n976, n977,
         n978, n979, n980, n981, n982, n983, n984, n985, n986, n987, n988,
         n989, n990, n991, n992, n993, n994, n995, n996, n997, n998, n999,
         n1000;
  wire   [3:1] storeadd;
  wire   [15:0] nexhrdata;
  assign N82 = haddr[0];
  assign N83 = haddr[1];
  assign N84 = haddr[2];
  assign N85 = haddr[3];

  DFFSR \hrdata_reg[15]  ( .D(nexhrdata[15]), .CLK(clk), .R(n811), .S(1'b1), 
        .Q(hrdata[15]) );
  DFFSR \hrdata_reg[14]  ( .D(nexhrdata[14]), .CLK(clk), .R(n811), .S(1'b1), 
        .Q(hrdata[14]) );
  DFFSR \hrdata_reg[13]  ( .D(nexhrdata[13]), .CLK(clk), .R(n811), .S(1'b1), 
        .Q(hrdata[13]) );
  DFFSR \hrdata_reg[12]  ( .D(nexhrdata[12]), .CLK(clk), .R(n811), .S(1'b1), 
        .Q(hrdata[12]) );
  DFFSR \hrdata_reg[11]  ( .D(nexhrdata[11]), .CLK(clk), .R(n811), .S(1'b1), 
        .Q(hrdata[11]) );
  DFFSR \hrdata_reg[10]  ( .D(nexhrdata[10]), .CLK(clk), .R(n810), .S(1'b1), 
        .Q(hrdata[10]) );
  DFFSR \hrdata_reg[9]  ( .D(nexhrdata[9]), .CLK(clk), .R(n810), .S(1'b1), .Q(
        hrdata[9]) );
  DFFSR \hrdata_reg[8]  ( .D(nexhrdata[8]), .CLK(clk), .R(n810), .S(1'b1), .Q(
        hrdata[8]) );
  DFFSR \hrdata_reg[7]  ( .D(n828), .CLK(clk), .R(n810), .S(1'b1), .Q(
        hrdata[7]) );
  DFFSR \hrdata_reg[6]  ( .D(n831), .CLK(clk), .R(n810), .S(1'b1), .Q(
        hrdata[6]) );
  DFFSR \hrdata_reg[5]  ( .D(n834), .CLK(clk), .R(n810), .S(1'b1), .Q(
        hrdata[5]) );
  DFFSR \hrdata_reg[4]  ( .D(n837), .CLK(clk), .R(n810), .S(1'b1), .Q(
        hrdata[4]) );
  DFFSR \hrdata_reg[3]  ( .D(n840), .CLK(clk), .R(n810), .S(1'b1), .Q(
        hrdata[3]) );
  DFFSR \hrdata_reg[2]  ( .D(n843), .CLK(clk), .R(n810), .S(1'b1), .Q(
        hrdata[2]) );
  DFFSR \hrdata_reg[1]  ( .D(n846), .CLK(clk), .R(n810), .S(1'b1), .Q(
        hrdata[1]) );
  DFFSR \hrdata_reg[0]  ( .D(n849), .CLK(clk), .R(n810), .S(1'b1), .Q(
        hrdata[0]) );
  DFFSR write1_reg ( .D(n574), .CLK(clk), .R(n810), .S(1'b1), .Q(write1) );
  DFFSR \storeadd_reg[3]  ( .D(n744), .CLK(clk), .R(n809), .S(1'b1), .Q(
        storeadd[3]) );
  DFFSR \storeadd_reg[2]  ( .D(n748), .CLK(clk), .R(n809), .S(1'b1), .Q(
        storeadd[2]) );
  DFFSR \storeadd_reg[1]  ( .D(n749), .CLK(clk), .R(n809), .S(1'b1), .Q(
        storeadd[1]) );
  DFFSR data_ready_reg ( .D(next_data_ready), .CLK(clk), .R(n809), .S(1'b1), 
        .Q(data_ready) );
  DFFSR \register_reg[5][7]  ( .D(n568), .CLK(clk), .R(n809), .S(1'b1), .Q(
        sample_data[15]) );
  DFFSR \register_reg[5][6]  ( .D(n566), .CLK(clk), .R(n809), .S(1'b1), .Q(
        sample_data[14]) );
  DFFSR \register_reg[5][5]  ( .D(n564), .CLK(clk), .R(n809), .S(1'b1), .Q(
        sample_data[13]) );
  DFFSR \register_reg[5][4]  ( .D(n562), .CLK(clk), .R(n809), .S(1'b1), .Q(
        sample_data[12]) );
  DFFSR \register_reg[5][3]  ( .D(n560), .CLK(clk), .R(n809), .S(1'b1), .Q(
        sample_data[11]) );
  DFFSR \register_reg[5][2]  ( .D(n558), .CLK(clk), .R(n809), .S(1'b1), .Q(
        sample_data[10]) );
  DFFSR \register_reg[5][1]  ( .D(n556), .CLK(clk), .R(n809), .S(1'b1), .Q(
        sample_data[9]) );
  DFFSR \register_reg[5][0]  ( .D(n554), .CLK(clk), .R(n809), .S(1'b1), .Q(
        sample_data[8]) );
  DFFSR \register_reg[4][7]  ( .D(n552), .CLK(clk), .R(n808), .S(1'b1), .Q(
        sample_data[7]) );
  DFFSR \register_reg[4][6]  ( .D(n550), .CLK(clk), .R(n808), .S(1'b1), .Q(
        sample_data[6]) );
  DFFSR \register_reg[4][5]  ( .D(n548), .CLK(clk), .R(n808), .S(1'b1), .Q(
        sample_data[5]) );
  DFFSR \register_reg[4][4]  ( .D(n546), .CLK(clk), .R(n808), .S(1'b1), .Q(
        sample_data[4]) );
  DFFSR \register_reg[4][3]  ( .D(n544), .CLK(clk), .R(n808), .S(1'b1), .Q(
        sample_data[3]) );
  DFFSR \register_reg[4][2]  ( .D(n542), .CLK(clk), .R(n808), .S(1'b1), .Q(
        sample_data[2]) );
  DFFSR \register_reg[4][1]  ( .D(n540), .CLK(clk), .R(n808), .S(1'b1), .Q(
        sample_data[1]) );
  DFFSR \register_reg[4][0]  ( .D(n538), .CLK(clk), .R(n808), .S(1'b1), .Q(
        sample_data[0]) );
  DFFSR \register_reg[7][7]  ( .D(n536), .CLK(clk), .R(n808), .S(1'b1), .Q(
        \register[7][7] ) );
  DFFSR \register_reg[7][6]  ( .D(n534), .CLK(clk), .R(n808), .S(1'b1), .Q(
        \register[7][6] ) );
  DFFSR \register_reg[7][5]  ( .D(n532), .CLK(clk), .R(n808), .S(1'b1), .Q(
        \register[7][5] ) );
  DFFSR \register_reg[7][4]  ( .D(n530), .CLK(clk), .R(n808), .S(1'b1), .Q(
        \register[7][4] ) );
  DFFSR \register_reg[7][3]  ( .D(n528), .CLK(clk), .R(n807), .S(1'b1), .Q(
        \register[7][3] ) );
  DFFSR \register_reg[7][2]  ( .D(n526), .CLK(clk), .R(n807), .S(1'b1), .Q(
        \register[7][2] ) );
  DFFSR \register_reg[7][1]  ( .D(n524), .CLK(clk), .R(n807), .S(1'b1), .Q(
        \register[7][1] ) );
  DFFSR \register_reg[7][0]  ( .D(n522), .CLK(clk), .R(n807), .S(1'b1), .Q(
        \register[7][0] ) );
  DFFSR \register_reg[6][7]  ( .D(n520), .CLK(clk), .R(n807), .S(1'b1), .Q(
        \register[6][7] ) );
  DFFSR \register_reg[6][6]  ( .D(n518), .CLK(clk), .R(n807), .S(1'b1), .Q(
        \register[6][6] ) );
  DFFSR \register_reg[6][5]  ( .D(n516), .CLK(clk), .R(n807), .S(1'b1), .Q(
        \register[6][5] ) );
  DFFSR \register_reg[6][4]  ( .D(n514), .CLK(clk), .R(n807), .S(1'b1), .Q(
        \register[6][4] ) );
  DFFSR \register_reg[6][3]  ( .D(n512), .CLK(clk), .R(n807), .S(1'b1), .Q(
        \register[6][3] ) );
  DFFSR \register_reg[6][2]  ( .D(n510), .CLK(clk), .R(n807), .S(1'b1), .Q(
        \register[6][2] ) );
  DFFSR \register_reg[6][1]  ( .D(n508), .CLK(clk), .R(n807), .S(1'b1), .Q(
        \register[6][1] ) );
  DFFSR \register_reg[6][0]  ( .D(n506), .CLK(clk), .R(n807), .S(1'b1), .Q(
        \register[6][0] ) );
  DFFSR \register_reg[9][7]  ( .D(n504), .CLK(clk), .R(n806), .S(1'b1), .Q(
        \register[9][7] ) );
  DFFSR \register_reg[9][6]  ( .D(n502), .CLK(clk), .R(n806), .S(1'b1), .Q(
        \register[9][6] ) );
  DFFSR \register_reg[9][5]  ( .D(n500), .CLK(clk), .R(n806), .S(1'b1), .Q(
        \register[9][5] ) );
  DFFSR \register_reg[9][4]  ( .D(n498), .CLK(clk), .R(n806), .S(1'b1), .Q(
        \register[9][4] ) );
  DFFSR \register_reg[9][3]  ( .D(n496), .CLK(clk), .R(n806), .S(1'b1), .Q(
        \register[9][3] ) );
  DFFSR \register_reg[9][2]  ( .D(n494), .CLK(clk), .R(n806), .S(1'b1), .Q(
        \register[9][2] ) );
  DFFSR \register_reg[9][1]  ( .D(n492), .CLK(clk), .R(n806), .S(1'b1), .Q(
        \register[9][1] ) );
  DFFSR \register_reg[9][0]  ( .D(n490), .CLK(clk), .R(n806), .S(1'b1), .Q(
        \register[9][0] ) );
  DFFSR \register_reg[8][7]  ( .D(n488), .CLK(clk), .R(n806), .S(1'b1), .Q(
        \register[8][7] ) );
  DFFSR \register_reg[8][6]  ( .D(n486), .CLK(clk), .R(n806), .S(1'b1), .Q(
        \register[8][6] ) );
  DFFSR \register_reg[8][5]  ( .D(n484), .CLK(clk), .R(n806), .S(1'b1), .Q(
        \register[8][5] ) );
  DFFSR \register_reg[8][4]  ( .D(n482), .CLK(clk), .R(n806), .S(1'b1), .Q(
        \register[8][4] ) );
  DFFSR \register_reg[8][3]  ( .D(n480), .CLK(clk), .R(n805), .S(1'b1), .Q(
        \register[8][3] ) );
  DFFSR \register_reg[8][2]  ( .D(n478), .CLK(clk), .R(n805), .S(1'b1), .Q(
        \register[8][2] ) );
  DFFSR \register_reg[8][1]  ( .D(n476), .CLK(clk), .R(n805), .S(1'b1), .Q(
        \register[8][1] ) );
  DFFSR \register_reg[8][0]  ( .D(n474), .CLK(clk), .R(n805), .S(1'b1), .Q(
        \register[8][0] ) );
  DFFSR \register_reg[11][7]  ( .D(n472), .CLK(clk), .R(n805), .S(1'b1), .Q(
        \register[11][7] ) );
  DFFSR \register_reg[11][6]  ( .D(n470), .CLK(clk), .R(n805), .S(1'b1), .Q(
        \register[11][6] ) );
  DFFSR \register_reg[11][5]  ( .D(n468), .CLK(clk), .R(n805), .S(1'b1), .Q(
        \register[11][5] ) );
  DFFSR \register_reg[11][4]  ( .D(n466), .CLK(clk), .R(n805), .S(1'b1), .Q(
        \register[11][4] ) );
  DFFSR \register_reg[11][3]  ( .D(n464), .CLK(clk), .R(n805), .S(1'b1), .Q(
        \register[11][3] ) );
  DFFSR \register_reg[11][2]  ( .D(n462), .CLK(clk), .R(n805), .S(1'b1), .Q(
        \register[11][2] ) );
  DFFSR \register_reg[11][1]  ( .D(n460), .CLK(clk), .R(n805), .S(1'b1), .Q(
        \register[11][1] ) );
  DFFSR \register_reg[11][0]  ( .D(n458), .CLK(clk), .R(n805), .S(1'b1), .Q(
        \register[11][0] ) );
  DFFSR \register_reg[10][7]  ( .D(n456), .CLK(clk), .R(n804), .S(1'b1), .Q(
        \register[10][7] ) );
  DFFSR \register_reg[10][6]  ( .D(n454), .CLK(clk), .R(n804), .S(1'b1), .Q(
        \register[10][6] ) );
  DFFSR \register_reg[10][5]  ( .D(n452), .CLK(clk), .R(n804), .S(1'b1), .Q(
        \register[10][5] ) );
  DFFSR \register_reg[10][4]  ( .D(n450), .CLK(clk), .R(n804), .S(1'b1), .Q(
        \register[10][4] ) );
  DFFSR \register_reg[10][3]  ( .D(n448), .CLK(clk), .R(n804), .S(1'b1), .Q(
        \register[10][3] ) );
  DFFSR \register_reg[10][2]  ( .D(n446), .CLK(clk), .R(n804), .S(1'b1), .Q(
        \register[10][2] ) );
  DFFSR \register_reg[10][1]  ( .D(n444), .CLK(clk), .R(n804), .S(1'b1), .Q(
        \register[10][1] ) );
  DFFSR \register_reg[10][0]  ( .D(n442), .CLK(clk), .R(n804), .S(1'b1), .Q(
        \register[10][0] ) );
  DFFSR \register_reg[13][7]  ( .D(n440), .CLK(clk), .R(n804), .S(1'b1), .Q(
        \register[13][7] ) );
  DFFSR \register_reg[13][6]  ( .D(n438), .CLK(clk), .R(n804), .S(1'b1), .Q(
        \register[13][6] ) );
  DFFSR \register_reg[13][5]  ( .D(n436), .CLK(clk), .R(n804), .S(1'b1), .Q(
        \register[13][5] ) );
  DFFSR \register_reg[13][4]  ( .D(n434), .CLK(clk), .R(n804), .S(1'b1), .Q(
        \register[13][4] ) );
  DFFSR \register_reg[13][3]  ( .D(n432), .CLK(clk), .R(n803), .S(1'b1), .Q(
        \register[13][3] ) );
  DFFSR \register_reg[13][2]  ( .D(n430), .CLK(clk), .R(n803), .S(1'b1), .Q(
        \register[13][2] ) );
  DFFSR \register_reg[13][1]  ( .D(n428), .CLK(clk), .R(n803), .S(1'b1), .Q(
        \register[13][1] ) );
  DFFSR \register_reg[13][0]  ( .D(n426), .CLK(clk), .R(n803), .S(1'b1), .Q(
        \register[13][0] ) );
  DFFSR \register_reg[12][7]  ( .D(n424), .CLK(clk), .R(n803), .S(1'b1), .Q(
        \register[12][7] ) );
  DFFSR \register_reg[12][6]  ( .D(n422), .CLK(clk), .R(n803), .S(1'b1), .Q(
        \register[12][6] ) );
  DFFSR \register_reg[12][5]  ( .D(n420), .CLK(clk), .R(n803), .S(1'b1), .Q(
        \register[12][5] ) );
  DFFSR \register_reg[12][4]  ( .D(n418), .CLK(clk), .R(n803), .S(1'b1), .Q(
        \register[12][4] ) );
  DFFSR \register_reg[12][3]  ( .D(n416), .CLK(clk), .R(n803), .S(1'b1), .Q(
        \register[12][3] ) );
  DFFSR \register_reg[12][2]  ( .D(n414), .CLK(clk), .R(n803), .S(1'b1), .Q(
        \register[12][2] ) );
  DFFSR \register_reg[12][1]  ( .D(n412), .CLK(clk), .R(n803), .S(1'b1), .Q(
        \register[12][1] ) );
  DFFSR \register_reg[12][0]  ( .D(n410), .CLK(clk), .R(n803), .S(1'b1), .Q(
        \register[12][0] ) );
  DFFSR \register_reg[14][7]  ( .D(\nexregister[14][7] ), .CLK(clk), .R(n802), 
        .S(1'b1), .Q(\register[14][7] ) );
  DFFSR \register_reg[14][6]  ( .D(\nexregister[14][6] ), .CLK(clk), .R(n802), 
        .S(1'b1), .Q(\register[14][6] ) );
  DFFSR \register_reg[14][5]  ( .D(\nexregister[14][5] ), .CLK(clk), .R(n802), 
        .S(1'b1), .Q(\register[14][5] ) );
  DFFSR \register_reg[14][4]  ( .D(\nexregister[14][4] ), .CLK(clk), .R(n802), 
        .S(1'b1), .Q(\register[14][4] ) );
  DFFSR \register_reg[14][3]  ( .D(\nexregister[14][3] ), .CLK(clk), .R(n802), 
        .S(1'b1), .Q(\register[14][3] ) );
  DFFSR \register_reg[14][2]  ( .D(\nexregister[14][2] ), .CLK(clk), .R(n802), 
        .S(1'b1), .Q(\register[14][2] ) );
  DFFSR \register_reg[14][1]  ( .D(\nexregister[14][1] ), .CLK(clk), .R(n802), 
        .S(1'b1), .Q(\register[14][1] ) );
  DFFSR \register_reg[14][0]  ( .D(\nexregister[14][0] ), .CLK(clk), .R(n802), 
        .S(1'b1), .Q(new_coefficient_set) );
  DFFSR \register_reg[15][7]  ( .D(n400), .CLK(clk), .R(n802), .S(1'b1), .Q(
        \register[15][7] ) );
  DFFSR \register_reg[15][6]  ( .D(n398), .CLK(clk), .R(n802), .S(1'b1), .Q(
        \register[15][6] ) );
  DFFSR \register_reg[15][5]  ( .D(n396), .CLK(clk), .R(n802), .S(1'b1), .Q(
        \register[15][5] ) );
  DFFSR \register_reg[15][4]  ( .D(n394), .CLK(clk), .R(n802), .S(1'b1), .Q(
        \register[15][4] ) );
  DFFSR \register_reg[15][3]  ( .D(n392), .CLK(clk), .R(n801), .S(1'b1), .Q(
        \register[15][3] ) );
  DFFSR \register_reg[15][2]  ( .D(n390), .CLK(clk), .R(n801), .S(1'b1), .Q(
        \register[15][2] ) );
  DFFSR \register_reg[15][1]  ( .D(n388), .CLK(clk), .R(n801), .S(1'b1), .Q(
        \register[15][1] ) );
  DFFSR \register_reg[15][0]  ( .D(n386), .CLK(clk), .R(n801), .S(1'b1), .Q(
        \register[15][0] ) );
  DFFSR \register_reg[2][0]  ( .D(\nexregister[2][0] ), .CLK(clk), .R(n801), 
        .S(1'b1), .Q(\register[2][0] ) );
  DFFSR \register_reg[2][1]  ( .D(\nexregister[2][1] ), .CLK(clk), .R(n801), 
        .S(1'b1), .Q(\register[2][1] ) );
  DFFSR \register_reg[2][2]  ( .D(\nexregister[2][2] ), .CLK(clk), .R(n801), 
        .S(1'b1), .Q(\register[2][2] ) );
  DFFSR \register_reg[2][3]  ( .D(\nexregister[2][3] ), .CLK(clk), .R(n801), 
        .S(1'b1), .Q(\register[2][3] ) );
  DFFSR \register_reg[2][4]  ( .D(\nexregister[2][4] ), .CLK(clk), .R(n801), 
        .S(1'b1), .Q(\register[2][4] ) );
  DFFSR \register_reg[2][5]  ( .D(\nexregister[2][5] ), .CLK(clk), .R(n801), 
        .S(1'b1), .Q(\register[2][5] ) );
  DFFSR \register_reg[2][6]  ( .D(\nexregister[2][6] ), .CLK(clk), .R(n801), 
        .S(1'b1), .Q(\register[2][6] ) );
  DFFSR \register_reg[2][7]  ( .D(\nexregister[2][7] ), .CLK(clk), .R(n801), 
        .S(1'b1), .Q(\register[2][7] ) );
  DFFSR \register_reg[3][0]  ( .D(\nexregister[3][0] ), .CLK(clk), .R(n800), 
        .S(1'b1), .Q(\register[3][0] ) );
  DFFSR \register_reg[3][1]  ( .D(\nexregister[3][1] ), .CLK(clk), .R(n800), 
        .S(1'b1), .Q(\register[3][1] ) );
  DFFSR \register_reg[3][2]  ( .D(\nexregister[3][2] ), .CLK(clk), .R(n800), 
        .S(1'b1), .Q(\register[3][2] ) );
  DFFSR \register_reg[3][3]  ( .D(\nexregister[3][3] ), .CLK(clk), .R(n800), 
        .S(1'b1), .Q(\register[3][3] ) );
  DFFSR \register_reg[3][4]  ( .D(\nexregister[3][4] ), .CLK(clk), .R(n800), 
        .S(1'b1), .Q(\register[3][4] ) );
  DFFSR \register_reg[3][5]  ( .D(\nexregister[3][5] ), .CLK(clk), .R(n800), 
        .S(1'b1), .Q(\register[3][5] ) );
  DFFSR \register_reg[3][6]  ( .D(\nexregister[3][6] ), .CLK(clk), .R(n800), 
        .S(1'b1), .Q(\register[3][6] ) );
  DFFSR \register_reg[3][7]  ( .D(\nexregister[3][7] ), .CLK(clk), .R(n800), 
        .S(1'b1), .Q(\register[3][7] ) );
  DFFSR \register_reg[1][7]  ( .D(\nexregister[1][7] ), .CLK(clk), .R(n800), 
        .S(1'b1), .Q(\register[1][7] ) );
  DFFSR \register_reg[1][6]  ( .D(\nexregister[1][6] ), .CLK(clk), .R(n800), 
        .S(1'b1), .Q(\register[1][6] ) );
  DFFSR \register_reg[1][5]  ( .D(\nexregister[1][5] ), .CLK(clk), .R(n800), 
        .S(1'b1), .Q(\register[1][5] ) );
  DFFSR \register_reg[1][4]  ( .D(\nexregister[1][4] ), .CLK(clk), .R(n800), 
        .S(1'b1), .Q(\register[1][4] ) );
  DFFSR \register_reg[1][3]  ( .D(\nexregister[1][3] ), .CLK(clk), .R(n799), 
        .S(1'b1), .Q(\register[1][3] ) );
  DFFSR \register_reg[1][2]  ( .D(\nexregister[1][2] ), .CLK(clk), .R(n799), 
        .S(1'b1), .Q(\register[1][2] ) );
  DFFSR \register_reg[1][1]  ( .D(\nexregister[1][1] ), .CLK(clk), .R(n799), 
        .S(1'b1), .Q(\register[1][1] ) );
  DFFSR \register_reg[0][7]  ( .D(\nexregister[0][7] ), .CLK(clk), .R(n799), 
        .S(1'b1), .Q(\register[0][7] ) );
  DFFSR \register_reg[0][6]  ( .D(\nexregister[0][6] ), .CLK(clk), .R(n799), 
        .S(1'b1), .Q(\register[0][6] ) );
  DFFSR \register_reg[0][5]  ( .D(\nexregister[0][5] ), .CLK(clk), .R(n799), 
        .S(1'b1), .Q(\register[0][5] ) );
  DFFSR \register_reg[0][4]  ( .D(\nexregister[0][4] ), .CLK(clk), .R(n799), 
        .S(1'b1), .Q(\register[0][4] ) );
  DFFSR \register_reg[0][3]  ( .D(\nexregister[0][3] ), .CLK(clk), .R(n799), 
        .S(1'b1), .Q(\register[0][3] ) );
  DFFSR \register_reg[0][2]  ( .D(\nexregister[0][2] ), .CLK(clk), .R(n799), 
        .S(1'b1), .Q(\register[0][2] ) );
  DFFSR \register_reg[0][1]  ( .D(\nexregister[0][1] ), .CLK(clk), .R(n799), 
        .S(1'b1), .Q(\register[0][1] ) );
  DFFSR \register_reg[0][0]  ( .D(\nexregister[0][0] ), .CLK(clk), .R(n799), 
        .S(1'b1), .Q(\register[0][0] ) );
  DFFSR \register_reg[1][0]  ( .D(\nexregister[1][0] ), .CLK(clk), .R(n799), 
        .S(1'b1), .Q(\register[1][0] ) );
  OAI21X1 U3 ( .A(processed), .B(n876), .C(n14), .Y(next_data_ready) );
  NAND2X1 U4 ( .A(hsel), .B(n15), .Y(n14) );
  OAI21X1 U5 ( .A(n16), .B(n17), .C(n786), .Y(n15) );
  NAND2X1 U6 ( .A(n977), .B(n979), .Y(n17) );
  OAI22X1 U8 ( .A(hsel), .B(n813), .C(n797), .D(n812), .Y(\nexregister[3][7] )
         );
  OAI22X1 U10 ( .A(hsel), .B(n815), .C(n797), .D(n814), .Y(\nexregister[3][6] ) );
  OAI22X1 U12 ( .A(hsel), .B(n817), .C(n797), .D(n816), .Y(\nexregister[3][5] ) );
  OAI22X1 U14 ( .A(hsel), .B(n819), .C(n797), .D(n818), .Y(\nexregister[3][4] ) );
  OAI22X1 U16 ( .A(hsel), .B(n821), .C(n797), .D(n820), .Y(\nexregister[3][3] ) );
  OAI22X1 U18 ( .A(hsel), .B(n823), .C(n797), .D(n822), .Y(\nexregister[3][2] ) );
  OAI22X1 U20 ( .A(hsel), .B(n825), .C(n797), .D(n824), .Y(\nexregister[3][1] ) );
  OAI22X1 U22 ( .A(hsel), .B(n827), .C(n797), .D(n826), .Y(\nexregister[3][0] ) );
  OAI22X1 U24 ( .A(hsel), .B(n830), .C(n797), .D(n829), .Y(\nexregister[2][7] ) );
  OAI22X1 U26 ( .A(hsel), .B(n833), .C(n797), .D(n832), .Y(\nexregister[2][6] ) );
  OAI22X1 U28 ( .A(hsel), .B(n836), .C(n797), .D(n835), .Y(\nexregister[2][5] ) );
  OAI22X1 U30 ( .A(hsel), .B(n839), .C(n797), .D(n838), .Y(\nexregister[2][4] ) );
  OAI22X1 U32 ( .A(hsel), .B(n842), .C(n797), .D(n841), .Y(\nexregister[2][3] ) );
  OAI22X1 U34 ( .A(hsel), .B(n845), .C(n797), .D(n844), .Y(\nexregister[2][2] ) );
  OAI22X1 U36 ( .A(hsel), .B(n848), .C(n797), .D(n847), .Y(\nexregister[2][1] ) );
  OAI22X1 U38 ( .A(hsel), .B(n851), .C(n797), .D(n850), .Y(\nexregister[2][0] ) );
  OAI22X1 U47 ( .A(hsel), .B(n853), .C(n797), .D(n852), .Y(\nexregister[1][0] ) );
  OAI21X1 U49 ( .A(n57), .B(n58), .C(n59), .Y(\nexregister[14][7] ) );
  AOI22X1 U50 ( .A(\register[14][7] ), .B(n60), .C(n61), .D(hwdata[7]), .Y(n59) );
  OAI21X1 U51 ( .A(n62), .B(n58), .C(n63), .Y(\nexregister[14][6] ) );
  AOI22X1 U52 ( .A(\register[14][6] ), .B(n60), .C(n61), .D(hwdata[6]), .Y(n63) );
  OAI21X1 U53 ( .A(n64), .B(n58), .C(n65), .Y(\nexregister[14][5] ) );
  AOI22X1 U54 ( .A(\register[14][5] ), .B(n60), .C(n61), .D(hwdata[5]), .Y(n65) );
  OAI21X1 U55 ( .A(n66), .B(n58), .C(n67), .Y(\nexregister[14][4] ) );
  AOI22X1 U56 ( .A(\register[14][4] ), .B(n60), .C(n61), .D(hwdata[4]), .Y(n67) );
  OAI21X1 U57 ( .A(n68), .B(n58), .C(n69), .Y(\nexregister[14][3] ) );
  AOI22X1 U58 ( .A(\register[14][3] ), .B(n60), .C(n61), .D(hwdata[3]), .Y(n69) );
  OAI21X1 U59 ( .A(n70), .B(n58), .C(n71), .Y(\nexregister[14][2] ) );
  AOI22X1 U60 ( .A(\register[14][2] ), .B(n60), .C(n61), .D(hwdata[2]), .Y(n71) );
  OAI21X1 U61 ( .A(n72), .B(n58), .C(n73), .Y(\nexregister[14][1] ) );
  AOI22X1 U62 ( .A(\register[14][1] ), .B(n60), .C(n61), .D(hwdata[1]), .Y(n73) );
  OAI21X1 U63 ( .A(n74), .B(n58), .C(n75), .Y(\nexregister[14][0] ) );
  AOI22X1 U64 ( .A(new_coefficient_set), .B(n60), .C(n61), .D(hwdata[0]), .Y(
        n75) );
  NOR3X1 U65 ( .A(n798), .B(n77), .C(n78), .Y(n61) );
  NOR2X1 U66 ( .A(clear_new_coefficient), .B(hsel), .Y(n60) );
  OAI21X1 U67 ( .A(n79), .B(n80), .C(n23), .Y(n58) );
  NAND2X1 U68 ( .A(n977), .B(N83), .Y(n80) );
  OAI22X1 U77 ( .A(n797), .B(n862), .C(hsel), .D(n82), .Y(\nexregister[0][0] )
         );
  OAI21X1 U81 ( .A(n84), .B(n981), .C(n86), .Y(n79) );
  AOI21X1 U82 ( .A(n976), .B(hsel), .C(hresp), .Y(n86) );
  OAI22X1 U91 ( .A(n89), .B(n874), .C(n779), .D(n967), .Y(n748) );
  OAI22X1 U92 ( .A(n89), .B(n875), .C(n979), .D(n967), .Y(n749) );
  OAI22X1 U93 ( .A(n796), .B(n964), .C(n992), .D(n97), .Y(n386) );
  OAI22X1 U94 ( .A(n796), .B(n963), .C(n991), .D(n97), .Y(n388) );
  OAI22X1 U95 ( .A(n796), .B(n962), .C(n990), .D(n97), .Y(n390) );
  OAI22X1 U96 ( .A(n796), .B(n961), .C(n989), .D(n97), .Y(n392) );
  OAI22X1 U97 ( .A(n796), .B(n960), .C(n988), .D(n97), .Y(n394) );
  OAI22X1 U98 ( .A(n796), .B(n959), .C(n987), .D(n97), .Y(n396) );
  OAI22X1 U99 ( .A(n796), .B(n958), .C(n986), .D(n97), .Y(n398) );
  OAI22X1 U100 ( .A(n796), .B(n957), .C(n985), .D(n97), .Y(n400) );
  NAND2X1 U102 ( .A(n867), .B(hsel), .Y(n97) );
  OAI22X1 U103 ( .A(n113), .B(n956), .C(n1000), .D(n116), .Y(n410) );
  OAI22X1 U104 ( .A(n113), .B(n955), .C(n999), .D(n116), .Y(n412) );
  OAI22X1 U105 ( .A(n113), .B(n954), .C(n998), .D(n116), .Y(n414) );
  OAI22X1 U106 ( .A(n113), .B(n953), .C(n997), .D(n116), .Y(n416) );
  OAI22X1 U107 ( .A(n113), .B(n952), .C(n996), .D(n116), .Y(n418) );
  OAI22X1 U108 ( .A(n113), .B(n951), .C(n995), .D(n116), .Y(n420) );
  OAI22X1 U109 ( .A(n113), .B(n950), .C(n994), .D(n116), .Y(n422) );
  OAI22X1 U110 ( .A(n113), .B(n949), .C(n993), .D(n116), .Y(n424) );
  NAND2X1 U111 ( .A(hsel), .B(n131), .Y(n116) );
  OAI21X1 U112 ( .A(n77), .B(n132), .C(n133), .Y(n131) );
  OAI21X1 U114 ( .A(n135), .B(n136), .C(n794), .Y(n134) );
  NAND2X1 U115 ( .A(n978), .B(N84), .Y(n136) );
  OAI21X1 U116 ( .A(n138), .B(n948), .C(n140), .Y(n426) );
  AOI22X1 U117 ( .A(n866), .B(hwdata[8]), .C(n142), .D(hwdata[0]), .Y(n140) );
  OAI21X1 U118 ( .A(n138), .B(n947), .C(n144), .Y(n428) );
  AOI22X1 U119 ( .A(n866), .B(hwdata[9]), .C(n142), .D(hwdata[1]), .Y(n144) );
  OAI21X1 U120 ( .A(n138), .B(n946), .C(n146), .Y(n430) );
  AOI22X1 U121 ( .A(n866), .B(hwdata[10]), .C(n142), .D(hwdata[2]), .Y(n146)
         );
  OAI21X1 U122 ( .A(n138), .B(n945), .C(n148), .Y(n432) );
  AOI22X1 U123 ( .A(n866), .B(hwdata[11]), .C(n142), .D(hwdata[3]), .Y(n148)
         );
  OAI21X1 U124 ( .A(n138), .B(n944), .C(n150), .Y(n434) );
  AOI22X1 U125 ( .A(n866), .B(hwdata[12]), .C(n142), .D(hwdata[4]), .Y(n150)
         );
  OAI21X1 U126 ( .A(n138), .B(n943), .C(n152), .Y(n436) );
  AOI22X1 U127 ( .A(n866), .B(hwdata[13]), .C(n142), .D(hwdata[5]), .Y(n152)
         );
  OAI21X1 U128 ( .A(n138), .B(n942), .C(n154), .Y(n438) );
  AOI22X1 U129 ( .A(n866), .B(hwdata[14]), .C(n142), .D(hwdata[6]), .Y(n154)
         );
  OAI21X1 U130 ( .A(n138), .B(n941), .C(n156), .Y(n440) );
  AOI22X1 U131 ( .A(n866), .B(hwdata[15]), .C(n142), .D(hwdata[7]), .Y(n156)
         );
  NOR2X1 U132 ( .A(n157), .B(n77), .Y(n142) );
  NAND3X1 U134 ( .A(hsel), .B(n159), .C(n793), .Y(n158) );
  AOI21X1 U135 ( .A(n133), .B(n159), .C(n798), .Y(n138) );
  NAND3X1 U136 ( .A(n973), .B(N84), .C(n162), .Y(n159) );
  OAI22X1 U137 ( .A(n163), .B(n940), .C(n1000), .D(n165), .Y(n442) );
  OAI22X1 U138 ( .A(n163), .B(n939), .C(n999), .D(n165), .Y(n444) );
  OAI22X1 U139 ( .A(n163), .B(n938), .C(n998), .D(n165), .Y(n446) );
  OAI22X1 U140 ( .A(n163), .B(n937), .C(n997), .D(n165), .Y(n448) );
  OAI22X1 U141 ( .A(n163), .B(n936), .C(n996), .D(n165), .Y(n450) );
  OAI22X1 U142 ( .A(n163), .B(n935), .C(n995), .D(n165), .Y(n452) );
  OAI22X1 U143 ( .A(n163), .B(n934), .C(n994), .D(n165), .Y(n454) );
  OAI22X1 U144 ( .A(n163), .B(n933), .C(n993), .D(n165), .Y(n456) );
  NAND2X1 U145 ( .A(hsel), .B(n173), .Y(n165) );
  OAI21X1 U146 ( .A(n78), .B(n174), .C(n792), .Y(n173) );
  OAI21X1 U148 ( .A(n177), .B(n178), .C(n792), .Y(n176) );
  OAI21X1 U149 ( .A(n179), .B(n932), .C(n181), .Y(n458) );
  AOI22X1 U150 ( .A(n182), .B(hwdata[0]), .C(n865), .D(hwdata[8]), .Y(n181) );
  OAI21X1 U151 ( .A(n179), .B(n931), .C(n185), .Y(n460) );
  AOI22X1 U152 ( .A(n182), .B(hwdata[1]), .C(n865), .D(hwdata[9]), .Y(n185) );
  OAI21X1 U153 ( .A(n179), .B(n930), .C(n187), .Y(n462) );
  AOI22X1 U154 ( .A(n182), .B(hwdata[2]), .C(n865), .D(hwdata[10]), .Y(n187)
         );
  OAI21X1 U155 ( .A(n179), .B(n929), .C(n189), .Y(n464) );
  AOI22X1 U156 ( .A(n182), .B(hwdata[3]), .C(n865), .D(hwdata[11]), .Y(n189)
         );
  OAI21X1 U157 ( .A(n179), .B(n928), .C(n191), .Y(n466) );
  AOI22X1 U158 ( .A(n182), .B(hwdata[4]), .C(n865), .D(hwdata[12]), .Y(n191)
         );
  OAI21X1 U159 ( .A(n179), .B(n927), .C(n193), .Y(n468) );
  AOI22X1 U160 ( .A(n182), .B(hwdata[5]), .C(n865), .D(hwdata[13]), .Y(n193)
         );
  OAI21X1 U161 ( .A(n179), .B(n926), .C(n195), .Y(n470) );
  AOI22X1 U162 ( .A(n182), .B(hwdata[6]), .C(n865), .D(hwdata[14]), .Y(n195)
         );
  OAI21X1 U163 ( .A(n179), .B(n925), .C(n197), .Y(n472) );
  AOI22X1 U164 ( .A(n182), .B(hwdata[7]), .C(n865), .D(hwdata[15]), .Y(n197)
         );
  NAND3X1 U166 ( .A(hsel), .B(n199), .C(n791), .Y(n198) );
  AOI21X1 U168 ( .A(n175), .B(n199), .C(n798), .Y(n179) );
  NAND2X1 U169 ( .A(n972), .B(n203), .Y(n199) );
  OAI22X1 U170 ( .A(n204), .B(n924), .C(n1000), .D(n206), .Y(n474) );
  OAI22X1 U171 ( .A(n204), .B(n923), .C(n999), .D(n206), .Y(n476) );
  OAI22X1 U172 ( .A(n204), .B(n922), .C(n998), .D(n206), .Y(n478) );
  OAI22X1 U173 ( .A(n204), .B(n921), .C(n997), .D(n206), .Y(n480) );
  OAI22X1 U174 ( .A(n204), .B(n920), .C(n996), .D(n206), .Y(n482) );
  OAI22X1 U175 ( .A(n204), .B(n919), .C(n995), .D(n206), .Y(n484) );
  OAI22X1 U176 ( .A(n204), .B(n918), .C(n994), .D(n206), .Y(n486) );
  OAI22X1 U177 ( .A(n204), .B(n917), .C(n993), .D(n206), .Y(n488) );
  NAND2X1 U178 ( .A(hsel), .B(n214), .Y(n206) );
  OAI21X1 U179 ( .A(n132), .B(n174), .C(n215), .Y(n214) );
  OAI21X1 U181 ( .A(n217), .B(n177), .C(n790), .Y(n216) );
  OAI21X1 U182 ( .A(n218), .B(n916), .C(n220), .Y(n490) );
  AOI22X1 U183 ( .A(n221), .B(hwdata[0]), .C(n864), .D(hwdata[8]), .Y(n220) );
  OAI21X1 U184 ( .A(n218), .B(n915), .C(n224), .Y(n492) );
  AOI22X1 U185 ( .A(n221), .B(hwdata[1]), .C(n864), .D(hwdata[9]), .Y(n224) );
  OAI21X1 U186 ( .A(n218), .B(n914), .C(n226), .Y(n494) );
  AOI22X1 U187 ( .A(n221), .B(hwdata[2]), .C(n864), .D(hwdata[10]), .Y(n226)
         );
  OAI21X1 U188 ( .A(n218), .B(n913), .C(n228), .Y(n496) );
  AOI22X1 U189 ( .A(n221), .B(hwdata[3]), .C(n864), .D(hwdata[11]), .Y(n228)
         );
  OAI21X1 U190 ( .A(n218), .B(n912), .C(n230), .Y(n498) );
  AOI22X1 U191 ( .A(n221), .B(hwdata[4]), .C(n864), .D(hwdata[12]), .Y(n230)
         );
  OAI21X1 U192 ( .A(n218), .B(n911), .C(n232), .Y(n500) );
  AOI22X1 U193 ( .A(n221), .B(hwdata[5]), .C(n864), .D(hwdata[13]), .Y(n232)
         );
  OAI21X1 U194 ( .A(n218), .B(n910), .C(n234), .Y(n502) );
  AOI22X1 U195 ( .A(n221), .B(hwdata[6]), .C(n864), .D(hwdata[14]), .Y(n234)
         );
  OAI21X1 U196 ( .A(n218), .B(n909), .C(n236), .Y(n504) );
  AOI22X1 U197 ( .A(n221), .B(hwdata[7]), .C(n864), .D(hwdata[15]), .Y(n236)
         );
  NAND3X1 U199 ( .A(hsel), .B(n238), .C(n789), .Y(n237) );
  NOR2X1 U201 ( .A(n174), .B(n157), .Y(n201) );
  NAND2X1 U202 ( .A(N85), .B(n779), .Y(n174) );
  AOI21X1 U203 ( .A(n215), .B(n238), .C(n798), .Y(n218) );
  NAND2X1 U204 ( .A(n972), .B(n162), .Y(n238) );
  NAND2X1 U206 ( .A(n973), .B(n779), .Y(n177) );
  NAND3X1 U208 ( .A(n240), .B(n981), .C(N85), .Y(n135) );
  OAI22X1 U209 ( .A(n241), .B(n908), .C(n1000), .D(n243), .Y(n506) );
  OAI22X1 U210 ( .A(n241), .B(n907), .C(n999), .D(n243), .Y(n508) );
  OAI22X1 U211 ( .A(n241), .B(n906), .C(n998), .D(n243), .Y(n510) );
  OAI22X1 U212 ( .A(n241), .B(n905), .C(n997), .D(n243), .Y(n512) );
  OAI22X1 U213 ( .A(n241), .B(n904), .C(n996), .D(n243), .Y(n514) );
  OAI22X1 U214 ( .A(n241), .B(n903), .C(n995), .D(n243), .Y(n516) );
  OAI22X1 U215 ( .A(n241), .B(n902), .C(n994), .D(n243), .Y(n518) );
  OAI22X1 U216 ( .A(n241), .B(n901), .C(n993), .D(n243), .Y(n520) );
  NAND2X1 U217 ( .A(hsel), .B(n251), .Y(n243) );
  OAI21X1 U218 ( .A(n78), .B(n252), .C(n788), .Y(n251) );
  NAND3X1 U219 ( .A(N83), .B(n980), .C(n974), .Y(n78) );
  OAI21X1 U221 ( .A(n257), .B(n178), .C(n788), .Y(n256) );
  NAND2X1 U222 ( .A(N83), .B(n980), .Y(n178) );
  OAI21X1 U223 ( .A(n258), .B(n900), .C(n260), .Y(n522) );
  AOI22X1 U224 ( .A(n261), .B(hwdata[0]), .C(n869), .D(hwdata[8]), .Y(n260) );
  OAI21X1 U225 ( .A(n258), .B(n899), .C(n264), .Y(n524) );
  AOI22X1 U226 ( .A(n261), .B(hwdata[1]), .C(n869), .D(hwdata[9]), .Y(n264) );
  OAI21X1 U227 ( .A(n258), .B(n898), .C(n266), .Y(n526) );
  AOI22X1 U228 ( .A(n261), .B(hwdata[2]), .C(n869), .D(hwdata[10]), .Y(n266)
         );
  OAI21X1 U229 ( .A(n258), .B(n897), .C(n268), .Y(n528) );
  AOI22X1 U230 ( .A(n261), .B(hwdata[3]), .C(n869), .D(hwdata[11]), .Y(n268)
         );
  OAI21X1 U231 ( .A(n258), .B(n896), .C(n270), .Y(n530) );
  AOI22X1 U232 ( .A(n261), .B(hwdata[4]), .C(n869), .D(hwdata[12]), .Y(n270)
         );
  OAI21X1 U233 ( .A(n258), .B(n895), .C(n272), .Y(n532) );
  AOI22X1 U234 ( .A(n261), .B(hwdata[5]), .C(n869), .D(hwdata[13]), .Y(n272)
         );
  OAI21X1 U235 ( .A(n258), .B(n894), .C(n274), .Y(n534) );
  AOI22X1 U236 ( .A(n261), .B(hwdata[6]), .C(n869), .D(hwdata[14]), .Y(n274)
         );
  OAI21X1 U237 ( .A(n258), .B(n893), .C(n276), .Y(n536) );
  AOI22X1 U238 ( .A(n261), .B(hwdata[7]), .C(n869), .D(hwdata[15]), .Y(n276)
         );
  NAND3X1 U240 ( .A(hsel), .B(n278), .C(n787), .Y(n277) );
  AOI21X1 U242 ( .A(n253), .B(n278), .C(n798), .Y(n258) );
  NAND2X1 U243 ( .A(n969), .B(n203), .Y(n278) );
  OAI22X1 U244 ( .A(n282), .B(n892), .C(n1000), .D(n284), .Y(n538) );
  OAI22X1 U245 ( .A(n282), .B(n891), .C(n999), .D(n284), .Y(n540) );
  OAI22X1 U246 ( .A(n282), .B(n890), .C(n998), .D(n284), .Y(n542) );
  OAI22X1 U247 ( .A(n282), .B(n889), .C(n997), .D(n284), .Y(n544) );
  OAI22X1 U248 ( .A(n282), .B(n888), .C(n996), .D(n284), .Y(n546) );
  OAI22X1 U249 ( .A(n282), .B(n887), .C(n995), .D(n284), .Y(n548) );
  OAI22X1 U250 ( .A(n282), .B(n886), .C(n994), .D(n284), .Y(n550) );
  OAI22X1 U251 ( .A(n282), .B(n885), .C(n993), .D(n284), .Y(n552) );
  NAND2X1 U252 ( .A(hsel), .B(n292), .Y(n284) );
  OAI21X1 U253 ( .A(n132), .B(n252), .C(n785), .Y(n292) );
  NAND2X1 U254 ( .A(n978), .B(n974), .Y(n132) );
  OAI21X1 U257 ( .A(n217), .B(n257), .C(n784), .Y(n293) );
  NAND2X1 U258 ( .A(n979), .B(n980), .Y(n217) );
  OAI21X1 U259 ( .A(n294), .B(n884), .C(n296), .Y(n554) );
  AOI22X1 U260 ( .A(n297), .B(hwdata[0]), .C(n870), .D(hwdata[8]), .Y(n296) );
  OAI21X1 U261 ( .A(n294), .B(n883), .C(n300), .Y(n556) );
  AOI22X1 U262 ( .A(n297), .B(hwdata[1]), .C(n870), .D(hwdata[9]), .Y(n300) );
  OAI21X1 U263 ( .A(n294), .B(n882), .C(n302), .Y(n558) );
  AOI22X1 U264 ( .A(n297), .B(hwdata[2]), .C(n870), .D(hwdata[10]), .Y(n302)
         );
  OAI21X1 U265 ( .A(n294), .B(n881), .C(n304), .Y(n560) );
  AOI22X1 U266 ( .A(n297), .B(hwdata[3]), .C(n870), .D(hwdata[11]), .Y(n304)
         );
  OAI21X1 U267 ( .A(n294), .B(n880), .C(n306), .Y(n562) );
  AOI22X1 U268 ( .A(n297), .B(hwdata[4]), .C(n870), .D(hwdata[12]), .Y(n306)
         );
  OAI21X1 U269 ( .A(n294), .B(n879), .C(n308), .Y(n564) );
  AOI22X1 U270 ( .A(n297), .B(hwdata[5]), .C(n870), .D(hwdata[13]), .Y(n308)
         );
  OAI21X1 U271 ( .A(n294), .B(n878), .C(n310), .Y(n566) );
  AOI22X1 U272 ( .A(n297), .B(hwdata[6]), .C(n870), .D(hwdata[14]), .Y(n310)
         );
  OAI21X1 U273 ( .A(n294), .B(n877), .C(n312), .Y(n568) );
  AOI22X1 U274 ( .A(n297), .B(hwdata[7]), .C(n870), .D(hwdata[15]), .Y(n312)
         );
  NAND3X1 U276 ( .A(hsel), .B(n314), .C(n871), .Y(n313) );
  NOR2X1 U278 ( .A(n252), .B(n157), .Y(n280) );
  NAND3X1 U279 ( .A(n974), .B(N82), .C(hsel), .Y(n157) );
  NAND3X1 U281 ( .A(hwrite), .B(htrans[1]), .C(n316), .Y(n16) );
  NOR2X1 U282 ( .A(n975), .B(n318), .Y(n316) );
  NAND2X1 U283 ( .A(n981), .B(n983), .Y(n318) );
  AOI21X1 U285 ( .A(n781), .B(n314), .C(n798), .Y(n294) );
  NAND2X1 U286 ( .A(n969), .B(n162), .Y(n314) );
  NOR2X1 U287 ( .A(n980), .B(N83), .Y(n162) );
  NAND3X1 U289 ( .A(n240), .B(n981), .C(n970), .Y(n257) );
  NAND2X1 U291 ( .A(N84), .B(n971), .Y(n252) );
  OAI21X1 U292 ( .A(hsel), .B(n868), .C(n967), .Y(n574) );
  AOI22X1 U294 ( .A(N973), .B(n966), .C(N965), .D(n965), .Y(n324) );
  AOI22X1 U296 ( .A(N974), .B(n966), .C(N966), .D(n965), .Y(n326) );
  AOI22X1 U298 ( .A(N975), .B(n966), .C(N967), .D(n965), .Y(n327) );
  AOI22X1 U300 ( .A(N976), .B(n966), .C(N968), .D(n965), .Y(n328) );
  AOI22X1 U302 ( .A(N977), .B(n966), .C(N969), .D(n965), .Y(n329) );
  AOI22X1 U304 ( .A(N978), .B(n966), .C(N970), .D(n965), .Y(n330) );
  AOI22X1 U306 ( .A(N979), .B(n966), .C(N971), .D(n965), .Y(n331) );
  AOI22X1 U308 ( .A(N980), .B(n966), .C(N972), .D(n965), .Y(n332) );
  NAND3X1 U310 ( .A(hsel), .B(n981), .C(n976), .Y(n333) );
  NAND3X1 U312 ( .A(n976), .B(hsel), .C(hsize), .Y(n334) );
  OAI21X1 U314 ( .A(n984), .B(n336), .C(n320), .Y(n240) );
  NAND2X1 U315 ( .A(htrans[1]), .B(n983), .Y(n336) );
  OAI22X1 U317 ( .A(n795), .B(n851), .C(n24), .D(n1000), .Y(n727) );
  OAI22X1 U319 ( .A(n795), .B(n848), .C(n24), .D(n999), .Y(n728) );
  OAI22X1 U321 ( .A(n795), .B(n845), .C(n24), .D(n998), .Y(n729) );
  OAI22X1 U323 ( .A(n795), .B(n842), .C(n24), .D(n997), .Y(n730) );
  OAI22X1 U325 ( .A(n795), .B(n839), .C(n24), .D(n996), .Y(n731) );
  OAI22X1 U327 ( .A(n795), .B(n836), .C(n24), .D(n995), .Y(n732) );
  OAI22X1 U329 ( .A(n795), .B(n833), .C(n24), .D(n994), .Y(n733) );
  OAI22X1 U331 ( .A(n795), .B(n830), .C(n24), .D(n993), .Y(n734) );
  OAI22X1 U333 ( .A(n795), .B(n827), .C(n24), .D(n992), .Y(n735) );
  OAI22X1 U335 ( .A(n795), .B(n825), .C(n24), .D(n991), .Y(n736) );
  OAI22X1 U337 ( .A(n795), .B(n823), .C(n24), .D(n990), .Y(n737) );
  OAI22X1 U339 ( .A(n795), .B(n821), .C(n24), .D(n989), .Y(n738) );
  OAI22X1 U341 ( .A(n795), .B(n819), .C(n24), .D(n988), .Y(n739) );
  OAI22X1 U343 ( .A(n795), .B(n817), .C(n24), .D(n987), .Y(n740) );
  OAI22X1 U345 ( .A(n795), .B(n815), .C(n24), .D(n986), .Y(n741) );
  OAI22X1 U347 ( .A(n795), .B(n813), .C(n24), .D(n985), .Y(n742) );
  OAI22X1 U351 ( .A(n340), .B(n853), .C(n992), .D(n872), .Y(n743) );
  OAI22X1 U353 ( .A(n89), .B(n873), .C(n971), .D(n967), .Y(n744) );
  NOR2X1 U355 ( .A(n981), .B(n343), .Y(n89) );
  OAI21X1 U356 ( .A(N85), .B(N84), .C(n968), .Y(n343) );
  OAI21X1 U358 ( .A(n798), .B(n320), .C(n344), .Y(hresp) );
  NAND3X1 U359 ( .A(n779), .B(n971), .C(n968), .Y(n344) );
  NAND3X1 U361 ( .A(hsel), .B(hwrite), .C(n345), .Y(n84) );
  NOR2X1 U362 ( .A(n982), .B(n347), .Y(n345) );
  NAND2X1 U363 ( .A(n320), .B(n983), .Y(n347) );
  NAND2X1 U368 ( .A(n977), .B(n203), .Y(n320) );
  NOR2X1 U369 ( .A(n979), .B(n980), .Y(n203) );
  NAND2X1 U373 ( .A(N85), .B(N84), .Y(n77) );
  NAND2X1 U375 ( .A(N93), .B(n863), .Y(N94) );
  XOR2X1 U376 ( .A(n863), .B(coefficient_num[1]), .Y(N93) );
  OAI22X1 U378 ( .A(n985), .B(n348), .C(n867), .D(n957), .Y(N529) );
  OAI22X1 U380 ( .A(n986), .B(n348), .C(n867), .D(n958), .Y(N528) );
  OAI22X1 U382 ( .A(n987), .B(n348), .C(n867), .D(n959), .Y(N527) );
  OAI22X1 U384 ( .A(n988), .B(n348), .C(n867), .D(n960), .Y(N526) );
  OAI22X1 U386 ( .A(n989), .B(n348), .C(n867), .D(n961), .Y(N525) );
  OAI22X1 U388 ( .A(n990), .B(n348), .C(n867), .D(n962), .Y(N524) );
  OAI22X1 U390 ( .A(n991), .B(n348), .C(n867), .D(n963), .Y(N523) );
  OAI22X1 U392 ( .A(n992), .B(n348), .C(n867), .D(n964), .Y(N522) );
  AOI22X1 U395 ( .A(hwdata[7]), .B(n867), .C(\register[14][7] ), .D(n349), .Y(
        n57) );
  AOI22X1 U397 ( .A(hwdata[6]), .B(n867), .C(n349), .D(\register[14][6] ), .Y(
        n62) );
  AOI22X1 U399 ( .A(hwdata[5]), .B(n867), .C(n349), .D(\register[14][5] ), .Y(
        n64) );
  AOI22X1 U401 ( .A(hwdata[4]), .B(n867), .C(n349), .D(\register[14][4] ), .Y(
        n66) );
  AOI22X1 U403 ( .A(hwdata[3]), .B(n867), .C(n349), .D(\register[14][3] ), .Y(
        n68) );
  AOI22X1 U405 ( .A(hwdata[2]), .B(n867), .C(n349), .D(\register[14][2] ), .Y(
        n70) );
  AOI22X1 U407 ( .A(hwdata[1]), .B(n867), .C(n349), .D(\register[14][1] ), .Y(
        n72) );
  AOI22X1 U409 ( .A(hwdata[0]), .B(n867), .C(n349), .D(new_coefficient_set), 
        .Y(n74) );
  NOR2X1 U410 ( .A(clear_new_coefficient), .B(n867), .Y(n349) );
  NAND3X1 U412 ( .A(storeadd[1]), .B(storeadd[2]), .C(n350), .Y(n348) );
  OAI22X1 U413 ( .A(n985), .B(n794), .C(n793), .D(n941), .Y(N513) );
  OAI22X1 U415 ( .A(n986), .B(n133), .C(n793), .D(n942), .Y(N512) );
  OAI22X1 U417 ( .A(n987), .B(n794), .C(n793), .D(n943), .Y(N511) );
  OAI22X1 U419 ( .A(n988), .B(n133), .C(n793), .D(n944), .Y(N510) );
  OAI22X1 U421 ( .A(n989), .B(n794), .C(n793), .D(n945), .Y(N509) );
  OAI22X1 U423 ( .A(n990), .B(n133), .C(n793), .D(n946), .Y(N508) );
  OAI22X1 U425 ( .A(n991), .B(n794), .C(n793), .D(n947), .Y(N507) );
  OAI22X1 U427 ( .A(n992), .B(n133), .C(n793), .D(n948), .Y(N506) );
  OAI22X1 U429 ( .A(n993), .B(n794), .C(n793), .D(n949), .Y(N505) );
  OAI22X1 U431 ( .A(n994), .B(n794), .C(n793), .D(n950), .Y(N504) );
  OAI22X1 U433 ( .A(n995), .B(n794), .C(n793), .D(n951), .Y(N503) );
  OAI22X1 U435 ( .A(n996), .B(n133), .C(n793), .D(n952), .Y(N502) );
  OAI22X1 U437 ( .A(n997), .B(n794), .C(n793), .D(n953), .Y(N501) );
  OAI22X1 U439 ( .A(n998), .B(n133), .C(n793), .D(n954), .Y(N500) );
  OAI22X1 U441 ( .A(n999), .B(n794), .C(n793), .D(n955), .Y(N499) );
  OAI22X1 U443 ( .A(n1000), .B(n794), .C(n793), .D(n956), .Y(N498) );
  NAND3X1 U446 ( .A(storeadd[2]), .B(n875), .C(n350), .Y(n133) );
  OAI22X1 U447 ( .A(n985), .B(n792), .C(n791), .D(n925), .Y(N497) );
  OAI22X1 U449 ( .A(n986), .B(n175), .C(n791), .D(n926), .Y(N496) );
  OAI22X1 U451 ( .A(n987), .B(n792), .C(n791), .D(n927), .Y(N495) );
  OAI22X1 U453 ( .A(n988), .B(n175), .C(n791), .D(n928), .Y(N494) );
  OAI22X1 U455 ( .A(n989), .B(n792), .C(n791), .D(n929), .Y(N493) );
  OAI22X1 U457 ( .A(n990), .B(n175), .C(n791), .D(n930), .Y(N492) );
  OAI22X1 U459 ( .A(n991), .B(n792), .C(n791), .D(n931), .Y(N491) );
  OAI22X1 U461 ( .A(n992), .B(n175), .C(n791), .D(n932), .Y(N490) );
  OAI22X1 U463 ( .A(n993), .B(n792), .C(n791), .D(n933), .Y(N489) );
  OAI22X1 U465 ( .A(n994), .B(n792), .C(n791), .D(n934), .Y(N488) );
  OAI22X1 U467 ( .A(n995), .B(n792), .C(n791), .D(n935), .Y(N487) );
  OAI22X1 U469 ( .A(n996), .B(n175), .C(n791), .D(n936), .Y(N486) );
  OAI22X1 U471 ( .A(n997), .B(n792), .C(n791), .D(n937), .Y(N485) );
  OAI22X1 U473 ( .A(n998), .B(n175), .C(n791), .D(n938), .Y(N484) );
  OAI22X1 U475 ( .A(n999), .B(n792), .C(n791), .D(n939), .Y(N483) );
  OAI22X1 U477 ( .A(n1000), .B(n175), .C(n791), .D(n940), .Y(N482) );
  NAND3X1 U480 ( .A(storeadd[1]), .B(n874), .C(n350), .Y(n175) );
  OAI22X1 U481 ( .A(n985), .B(n790), .C(n789), .D(n909), .Y(N481) );
  OAI22X1 U483 ( .A(n986), .B(n215), .C(n789), .D(n910), .Y(N480) );
  OAI22X1 U485 ( .A(n987), .B(n790), .C(n789), .D(n911), .Y(N479) );
  OAI22X1 U487 ( .A(n988), .B(n215), .C(n789), .D(n912), .Y(N478) );
  OAI22X1 U489 ( .A(n989), .B(n790), .C(n789), .D(n913), .Y(N477) );
  OAI22X1 U491 ( .A(n990), .B(n215), .C(n789), .D(n914), .Y(N476) );
  OAI22X1 U493 ( .A(n991), .B(n790), .C(n789), .D(n915), .Y(N475) );
  OAI22X1 U495 ( .A(n992), .B(n215), .C(n789), .D(n916), .Y(N474) );
  OAI22X1 U497 ( .A(n993), .B(n790), .C(n789), .D(n917), .Y(N473) );
  OAI22X1 U499 ( .A(n994), .B(n790), .C(n789), .D(n918), .Y(N472) );
  OAI22X1 U501 ( .A(n995), .B(n790), .C(n789), .D(n919), .Y(N471) );
  OAI22X1 U503 ( .A(n996), .B(n215), .C(n789), .D(n920), .Y(N470) );
  OAI22X1 U505 ( .A(n997), .B(n790), .C(n789), .D(n921), .Y(N469) );
  OAI22X1 U507 ( .A(n998), .B(n215), .C(n789), .D(n922), .Y(N468) );
  OAI22X1 U509 ( .A(n999), .B(n790), .C(n789), .D(n923), .Y(N467) );
  OAI22X1 U511 ( .A(n1000), .B(n790), .C(n789), .D(n924), .Y(N466) );
  NAND3X1 U514 ( .A(n875), .B(n874), .C(n350), .Y(n215) );
  NOR2X1 U515 ( .A(n873), .B(n868), .Y(n350) );
  OAI22X1 U518 ( .A(n985), .B(n788), .C(n787), .D(n893), .Y(N465) );
  OAI22X1 U520 ( .A(n986), .B(n253), .C(n787), .D(n894), .Y(N464) );
  OAI22X1 U522 ( .A(n987), .B(n788), .C(n787), .D(n895), .Y(N463) );
  OAI22X1 U524 ( .A(n988), .B(n253), .C(n787), .D(n896), .Y(N462) );
  OAI22X1 U526 ( .A(n989), .B(n788), .C(n787), .D(n897), .Y(N461) );
  OAI22X1 U528 ( .A(n990), .B(n253), .C(n787), .D(n898), .Y(N460) );
  OAI22X1 U530 ( .A(n991), .B(n788), .C(n787), .D(n899), .Y(N459) );
  OAI22X1 U532 ( .A(n992), .B(n253), .C(n787), .D(n900), .Y(N458) );
  OAI22X1 U534 ( .A(n993), .B(n788), .C(n787), .D(n901), .Y(N457) );
  OAI22X1 U536 ( .A(n994), .B(n788), .C(n787), .D(n902), .Y(N456) );
  OAI22X1 U538 ( .A(n995), .B(n788), .C(n787), .D(n903), .Y(N455) );
  OAI22X1 U540 ( .A(n996), .B(n253), .C(n787), .D(n904), .Y(N454) );
  OAI22X1 U542 ( .A(n997), .B(n788), .C(n787), .D(n905), .Y(N453) );
  OAI22X1 U544 ( .A(n998), .B(n253), .C(n787), .D(n906), .Y(N452) );
  OAI22X1 U546 ( .A(n999), .B(n788), .C(n787), .D(n907), .Y(N451) );
  OAI22X1 U548 ( .A(n1000), .B(n253), .C(n787), .D(n908), .Y(N450) );
  NAND3X1 U551 ( .A(storeadd[1]), .B(write1), .C(n351), .Y(n253) );
  NOR2X1 U552 ( .A(storeadd[3]), .B(n874), .Y(n351) );
  OAI22X1 U553 ( .A(n985), .B(n785), .C(n871), .D(n877), .Y(N449) );
  OAI22X1 U555 ( .A(n986), .B(n784), .C(n871), .D(n878), .Y(N448) );
  OAI22X1 U557 ( .A(n987), .B(n786), .C(n871), .D(n879), .Y(N447) );
  OAI22X1 U559 ( .A(n988), .B(n785), .C(n871), .D(n880), .Y(N446) );
  OAI22X1 U561 ( .A(n989), .B(n783), .C(n871), .D(n881), .Y(N445) );
  OAI22X1 U563 ( .A(n990), .B(n782), .C(n871), .D(n882), .Y(N444) );
  OAI22X1 U565 ( .A(n991), .B(n783), .C(n871), .D(n883), .Y(N443) );
  OAI22X1 U567 ( .A(n992), .B(n782), .C(n871), .D(n884), .Y(N442) );
  OAI22X1 U570 ( .A(n993), .B(n784), .C(n871), .D(n885), .Y(N441) );
  OAI22X1 U572 ( .A(n994), .B(n783), .C(n871), .D(n886), .Y(N440) );
  OAI22X1 U574 ( .A(n995), .B(n782), .C(n871), .D(n887), .Y(N439) );
  OAI22X1 U576 ( .A(n996), .B(n781), .C(n871), .D(n888), .Y(N438) );
  OAI22X1 U578 ( .A(n997), .B(n781), .C(n871), .D(n889), .Y(N437) );
  OAI22X1 U580 ( .A(n998), .B(n786), .C(n871), .D(n890), .Y(N436) );
  OAI22X1 U582 ( .A(n999), .B(n782), .C(n871), .D(n891), .Y(N435) );
  OAI22X1 U584 ( .A(n1000), .B(n781), .C(n871), .D(n892), .Y(N434) );
  NAND3X1 U587 ( .A(write1), .B(storeadd[2]), .C(n352), .Y(n18) );
  NOR2X1 U588 ( .A(storeadd[3]), .B(storeadd[1]), .Y(n352) );
  NOR2X1 U589 ( .A(n872), .B(n985), .Y(N417) );
  NOR2X1 U591 ( .A(n872), .B(n986), .Y(N416) );
  NOR2X1 U593 ( .A(n872), .B(n987), .Y(N415) );
  NOR2X1 U595 ( .A(n872), .B(n988), .Y(N414) );
  NOR2X1 U597 ( .A(n872), .B(n989), .Y(N413) );
  NOR2X1 U599 ( .A(n872), .B(n990), .Y(N412) );
  NOR2X1 U601 ( .A(n872), .B(n991), .Y(N411) );
  NOR2X1 U603 ( .A(n872), .B(n993), .Y(N409) );
  NOR2X1 U605 ( .A(n872), .B(n994), .Y(N408) );
  NOR2X1 U607 ( .A(n872), .B(n995), .Y(N407) );
  NOR2X1 U609 ( .A(n872), .B(n996), .Y(N406) );
  NOR2X1 U611 ( .A(n872), .B(n997), .Y(N405) );
  NOR2X1 U613 ( .A(n872), .B(n998), .Y(N404) );
  NOR2X1 U615 ( .A(n872), .B(n999), .Y(N403) );
  OAI22X1 U617 ( .A(n1000), .B(n872), .C(n340), .D(n82), .Y(N402) );
  NOR2X1 U618 ( .A(modwait), .B(new_coefficient_set), .Y(n82) );
  NOR2X1 U620 ( .A(n339), .B(storeadd[1]), .Y(n340) );
  NAND3X1 U621 ( .A(n874), .B(n873), .C(write1), .Y(n339) );
  AND2X2 U40 ( .A(n23), .B(N417), .Y(\nexregister[1][7] ) );
  AND2X2 U41 ( .A(n23), .B(N416), .Y(\nexregister[1][6] ) );
  AND2X2 U42 ( .A(n23), .B(N415), .Y(\nexregister[1][5] ) );
  AND2X2 U43 ( .A(n23), .B(N414), .Y(\nexregister[1][4] ) );
  AND2X2 U44 ( .A(n23), .B(N413), .Y(\nexregister[1][3] ) );
  AND2X2 U45 ( .A(n23), .B(N412), .Y(\nexregister[1][2] ) );
  AND2X2 U46 ( .A(n23), .B(N411), .Y(\nexregister[1][1] ) );
  AND2X2 U69 ( .A(n23), .B(N409), .Y(\nexregister[0][7] ) );
  AND2X2 U70 ( .A(n23), .B(N408), .Y(\nexregister[0][6] ) );
  AND2X2 U71 ( .A(n23), .B(N407), .Y(\nexregister[0][5] ) );
  AND2X2 U72 ( .A(n23), .B(N406), .Y(\nexregister[0][4] ) );
  AND2X2 U73 ( .A(n23), .B(N405), .Y(\nexregister[0][3] ) );
  AND2X2 U74 ( .A(n23), .B(N404), .Y(\nexregister[0][2] ) );
  AND2X2 U75 ( .A(n23), .B(N403), .Y(\nexregister[0][1] ) );
  AND2X2 U83 ( .A(N987), .B(n966), .Y(nexhrdata[9]) );
  AND2X2 U84 ( .A(N988), .B(n966), .Y(nexhrdata[8]) );
  AND2X2 U85 ( .A(N981), .B(n966), .Y(nexhrdata[15]) );
  AND2X2 U86 ( .A(N982), .B(n966), .Y(nexhrdata[14]) );
  AND2X2 U87 ( .A(N983), .B(n966), .Y(nexhrdata[13]) );
  AND2X2 U88 ( .A(N984), .B(n966), .Y(nexhrdata[12]) );
  AND2X2 U89 ( .A(N985), .B(n966), .Y(nexhrdata[11]) );
  AND2X2 U90 ( .A(N986), .B(n966), .Y(nexhrdata[10]) );
  AND2X2 U113 ( .A(hsel), .B(n134), .Y(n113) );
  AND2X2 U147 ( .A(hsel), .B(n176), .Y(n163) );
  AND2X2 U167 ( .A(n201), .B(N83), .Y(n182) );
  AND2X2 U180 ( .A(hsel), .B(n216), .Y(n204) );
  AND2X2 U200 ( .A(n201), .B(n979), .Y(n221) );
  AND2X2 U220 ( .A(hsel), .B(n256), .Y(n241) );
  AND2X2 U241 ( .A(n280), .B(N83), .Y(n261) );
  AND2X2 U256 ( .A(hsel), .B(n293), .Y(n282) );
  AND2X2 U277 ( .A(n280), .B(n979), .Y(n297) );
  NOR2X1 U7 ( .A(n619), .B(n673), .Y(n1) );
  NOR2X1 U9 ( .A(n673), .B(N94), .Y(n2) );
  NOR2X1 U11 ( .A(n619), .B(N93), .Y(n3) );
  AND2X2 U13 ( .A(n676), .B(n979), .Y(n4) );
  AND2X2 U15 ( .A(n678), .B(n979), .Y(n5) );
  AND2X2 U17 ( .A(n675), .B(n979), .Y(n6) );
  AND2X2 U19 ( .A(n677), .B(n979), .Y(n7) );
  OR2X2 U21 ( .A(n875), .B(n339), .Y(n24) );
  AND2X2 U23 ( .A(n35), .B(n980), .Y(n8) );
  AND2X2 U25 ( .A(n678), .B(N83), .Y(n9) );
  AND2X2 U27 ( .A(N83), .B(n676), .Y(n10) );
  AND2X2 U29 ( .A(n675), .B(N83), .Y(n11) );
  AND2X2 U31 ( .A(n677), .B(N83), .Y(n12) );
  INVX2 U33 ( .A(n13), .Y(n622) );
  OR2X1 U35 ( .A(n619), .B(n673), .Y(n13) );
  INVX2 U37 ( .A(n19), .Y(n674) );
  INVX2 U39 ( .A(n20), .Y(n623) );
  INVX2 U48 ( .A(n22), .Y(n624) );
  INVX2 U76 ( .A(n21), .Y(n621) );
  OR2X1 U78 ( .A(N93), .B(N94), .Y(n19) );
  OR2X1 U79 ( .A(N93), .B(N94), .Y(n20) );
  OR2X1 U80 ( .A(n619), .B(N93), .Y(n21) );
  OR2X1 U101 ( .A(n673), .B(N94), .Y(n22) );
  INVX2 U133 ( .A(n23), .Y(n797) );
  INVX2 U165 ( .A(n789), .Y(n790) );
  INVX2 U198 ( .A(n97), .Y(n796) );
  INVX2 U205 ( .A(n24), .Y(n795) );
  OR2X1 U207 ( .A(n79), .B(n968), .Y(n23) );
  INVX2 U239 ( .A(n27), .Y(n298) );
  INVX2 U255 ( .A(n25), .Y(n295) );
  INVX2 U275 ( .A(n26), .Y(n290) );
  INVX2 U280 ( .A(n348), .Y(n867) );
  INVX2 U284 ( .A(n215), .Y(n789) );
  INVX2 U288 ( .A(n791), .Y(n792) );
  INVX2 U290 ( .A(n793), .Y(n794) );
  INVX2 U293 ( .A(n18), .Y(n871) );
  INVX2 U295 ( .A(n340), .Y(n872) );
  INVX2 U297 ( .A(n787), .Y(n788) );
  AND2X2 U299 ( .A(n38), .B(n980), .Y(n25) );
  AND2X2 U301 ( .A(n34), .B(n980), .Y(n26) );
  AND2X2 U303 ( .A(n39), .B(n980), .Y(n27) );
  INVX2 U305 ( .A(n8), .Y(n291) );
  INVX2 U307 ( .A(n28), .Y(n289) );
  INVX2 U309 ( .A(n30), .Y(n287) );
  INVX2 U311 ( .A(n29), .Y(n286) );
  INVX2 U313 ( .A(n31), .Y(n288) );
  INVX2 U316 ( .A(hsel), .Y(n798) );
  INVX2 U318 ( .A(n175), .Y(n791) );
  INVX2 U320 ( .A(n133), .Y(n793) );
  INVX2 U322 ( .A(n253), .Y(n787) );
  BUFX2 U324 ( .A(n_rst), .Y(n799) );
  BUFX2 U326 ( .A(n_rst), .Y(n800) );
  BUFX2 U328 ( .A(n_rst), .Y(n801) );
  BUFX2 U330 ( .A(n_rst), .Y(n802) );
  BUFX2 U332 ( .A(n_rst), .Y(n803) );
  BUFX2 U334 ( .A(n_rst), .Y(n804) );
  BUFX2 U336 ( .A(n_rst), .Y(n805) );
  BUFX2 U338 ( .A(n_rst), .Y(n806) );
  BUFX2 U340 ( .A(n_rst), .Y(n807) );
  BUFX2 U342 ( .A(n_rst), .Y(n808) );
  BUFX2 U344 ( .A(n_rst), .Y(n809) );
  BUFX2 U346 ( .A(n_rst), .Y(n810) );
  INVX2 U348 ( .A(n334), .Y(n966) );
  AND2X2 U349 ( .A(n39), .B(N82), .Y(n28) );
  AND2X2 U350 ( .A(n34), .B(N82), .Y(n29) );
  AND2X2 U352 ( .A(n35), .B(N82), .Y(n30) );
  AND2X2 U354 ( .A(N82), .B(n38), .Y(n31) );
  BUFX2 U357 ( .A(n_rst), .Y(n811) );
  INVX2 U360 ( .A(hwdata[0]), .Y(n1000) );
  INVX2 U364 ( .A(hwdata[1]), .Y(n999) );
  INVX2 U365 ( .A(hwdata[2]), .Y(n998) );
  INVX2 U366 ( .A(hwdata[3]), .Y(n997) );
  INVX2 U367 ( .A(hwdata[4]), .Y(n996) );
  INVX2 U370 ( .A(hwdata[5]), .Y(n995) );
  INVX2 U371 ( .A(hwdata[6]), .Y(n994) );
  INVX2 U372 ( .A(hwdata[7]), .Y(n993) );
  INVX2 U374 ( .A(hwdata[8]), .Y(n992) );
  INVX2 U377 ( .A(hwdata[9]), .Y(n991) );
  INVX2 U379 ( .A(hwdata[10]), .Y(n990) );
  INVX2 U381 ( .A(hwdata[11]), .Y(n989) );
  INVX2 U383 ( .A(hwdata[12]), .Y(n988) );
  INVX2 U385 ( .A(hwdata[13]), .Y(n987) );
  INVX2 U387 ( .A(hwdata[14]), .Y(n986) );
  INVX2 U389 ( .A(hwdata[15]), .Y(n985) );
  NOR2X1 U391 ( .A(n979), .B(N84), .Y(n34) );
  NOR2X1 U393 ( .A(N83), .B(N84), .Y(n35) );
  OAI22X1 U394 ( .A(\register[11][0] ), .B(n286), .C(\register[9][0] ), .D(
        n287), .Y(n33) );
  NOR2X1 U396 ( .A(n779), .B(n979), .Y(n38) );
  NOR2X1 U398 ( .A(n779), .B(N83), .Y(n39) );
  OAI22X1 U400 ( .A(\register[15][0] ), .B(n288), .C(\register[13][0] ), .D(
        n289), .Y(n32) );
  NOR2X1 U402 ( .A(n33), .B(n32), .Y(n51) );
  NOR2X1 U404 ( .A(\register[8][0] ), .B(n291), .Y(n36) );
  NOR2X1 U406 ( .A(n971), .B(n36), .Y(n37) );
  OAI21X1 U408 ( .A(\register[10][0] ), .B(n290), .C(n37), .Y(n41) );
  OAI22X1 U411 ( .A(new_coefficient_set), .B(n295), .C(\register[12][0] ), .D(
        n298), .Y(n40) );
  NOR2X1 U414 ( .A(n41), .B(n40), .Y(n50) );
  OAI22X1 U416 ( .A(\register[3][0] ), .B(n286), .C(\register[1][0] ), .D(n287), .Y(n43) );
  OAI22X1 U418 ( .A(\register[7][0] ), .B(n288), .C(sample_data[8]), .D(n289), 
        .Y(n42) );
  NOR2X1 U420 ( .A(n43), .B(n42), .Y(n49) );
  NOR2X1 U422 ( .A(\register[0][0] ), .B(n291), .Y(n44) );
  NOR2X1 U424 ( .A(N85), .B(n44), .Y(n45) );
  OAI21X1 U426 ( .A(\register[2][0] ), .B(n290), .C(n45), .Y(n47) );
  OAI22X1 U428 ( .A(\register[6][0] ), .B(n295), .C(sample_data[0]), .D(n298), 
        .Y(n46) );
  NOR2X1 U430 ( .A(n47), .B(n46), .Y(n48) );
  AOI22X1 U432 ( .A(n51), .B(n50), .C(n49), .D(n48), .Y(n52) );
  OAI22X1 U434 ( .A(\register[11][1] ), .B(n286), .C(\register[9][1] ), .D(
        n287), .Y(n54) );
  OAI22X1 U436 ( .A(\register[15][1] ), .B(n288), .C(\register[13][1] ), .D(
        n289), .Y(n53) );
  NOR2X1 U438 ( .A(n54), .B(n53), .Y(n95) );
  NOR2X1 U440 ( .A(\register[8][1] ), .B(n291), .Y(n55) );
  NOR2X1 U442 ( .A(n971), .B(n55), .Y(n56) );
  OAI21X1 U444 ( .A(\register[10][1] ), .B(n290), .C(n56), .Y(n81) );
  OAI22X1 U445 ( .A(\register[14][1] ), .B(n295), .C(\register[12][1] ), .D(
        n298), .Y(n76) );
  NOR2X1 U448 ( .A(n81), .B(n76), .Y(n94) );
  OAI22X1 U450 ( .A(\register[3][1] ), .B(n286), .C(\register[1][1] ), .D(n287), .Y(n85) );
  OAI22X1 U452 ( .A(\register[7][1] ), .B(n288), .C(sample_data[9]), .D(n289), 
        .Y(n83) );
  NOR2X1 U454 ( .A(n85), .B(n83), .Y(n93) );
  NOR2X1 U456 ( .A(\register[0][1] ), .B(n291), .Y(n87) );
  NOR2X1 U458 ( .A(N85), .B(n87), .Y(n88) );
  OAI21X1 U460 ( .A(\register[2][1] ), .B(n290), .C(n88), .Y(n91) );
  OAI22X1 U462 ( .A(\register[6][1] ), .B(n295), .C(sample_data[1]), .D(n298), 
        .Y(n90) );
  NOR2X1 U464 ( .A(n91), .B(n90), .Y(n92) );
  AOI22X1 U466 ( .A(n95), .B(n94), .C(n93), .D(n92), .Y(n96) );
  OAI22X1 U468 ( .A(\register[11][2] ), .B(n286), .C(\register[9][2] ), .D(
        n287), .Y(n99) );
  OAI22X1 U470 ( .A(\register[15][2] ), .B(n288), .C(\register[13][2] ), .D(
        n289), .Y(n98) );
  NOR2X1 U472 ( .A(n99), .B(n98), .Y(n114) );
  NOR2X1 U474 ( .A(\register[8][2] ), .B(n291), .Y(n100) );
  NOR2X1 U476 ( .A(n971), .B(n100), .Y(n101) );
  OAI21X1 U478 ( .A(\register[10][2] ), .B(n290), .C(n101), .Y(n103) );
  OAI22X1 U479 ( .A(\register[14][2] ), .B(n295), .C(\register[12][2] ), .D(
        n298), .Y(n102) );
  NOR2X1 U482 ( .A(n103), .B(n102), .Y(n112) );
  OAI22X1 U484 ( .A(\register[3][2] ), .B(n286), .C(\register[1][2] ), .D(n287), .Y(n105) );
  OAI22X1 U486 ( .A(\register[7][2] ), .B(n288), .C(sample_data[10]), .D(n289), 
        .Y(n104) );
  NOR2X1 U488 ( .A(n105), .B(n104), .Y(n111) );
  NOR2X1 U490 ( .A(\register[0][2] ), .B(n291), .Y(n106) );
  NOR2X1 U492 ( .A(N85), .B(n106), .Y(n107) );
  OAI21X1 U494 ( .A(\register[2][2] ), .B(n290), .C(n107), .Y(n109) );
  OAI22X1 U496 ( .A(\register[6][2] ), .B(n295), .C(sample_data[2]), .D(n298), 
        .Y(n108) );
  NOR2X1 U498 ( .A(n109), .B(n108), .Y(n110) );
  AOI22X1 U500 ( .A(n114), .B(n112), .C(n111), .D(n110), .Y(n115) );
  OAI22X1 U502 ( .A(\register[11][3] ), .B(n286), .C(\register[9][3] ), .D(
        n287), .Y(n118) );
  OAI22X1 U504 ( .A(\register[15][3] ), .B(n288), .C(\register[13][3] ), .D(
        n289), .Y(n117) );
  NOR2X1 U506 ( .A(n118), .B(n117), .Y(n139) );
  NOR2X1 U508 ( .A(\register[8][3] ), .B(n291), .Y(n119) );
  NOR2X1 U510 ( .A(n971), .B(n119), .Y(n120) );
  OAI21X1 U512 ( .A(\register[10][3] ), .B(n290), .C(n120), .Y(n122) );
  OAI22X1 U513 ( .A(\register[14][3] ), .B(n295), .C(\register[12][3] ), .D(
        n298), .Y(n121) );
  NOR2X1 U516 ( .A(n122), .B(n121), .Y(n137) );
  OAI22X1 U517 ( .A(\register[3][3] ), .B(n286), .C(\register[1][3] ), .D(n287), .Y(n124) );
  OAI22X1 U519 ( .A(\register[7][3] ), .B(n288), .C(sample_data[11]), .D(n289), 
        .Y(n123) );
  NOR2X1 U521 ( .A(n124), .B(n123), .Y(n130) );
  NOR2X1 U523 ( .A(\register[0][3] ), .B(n291), .Y(n125) );
  NOR2X1 U525 ( .A(N85), .B(n125), .Y(n126) );
  OAI21X1 U527 ( .A(\register[2][3] ), .B(n290), .C(n126), .Y(n128) );
  OAI22X1 U529 ( .A(\register[6][3] ), .B(n295), .C(sample_data[3]), .D(n298), 
        .Y(n127) );
  NOR2X1 U531 ( .A(n128), .B(n127), .Y(n129) );
  AOI22X1 U533 ( .A(n139), .B(n137), .C(n130), .D(n129), .Y(n141) );
  OAI22X1 U535 ( .A(\register[11][4] ), .B(n286), .C(\register[9][4] ), .D(
        n287), .Y(n145) );
  OAI22X1 U537 ( .A(\register[15][4] ), .B(n288), .C(\register[13][4] ), .D(
        n289), .Y(n143) );
  NOR2X1 U539 ( .A(n145), .B(n143), .Y(n171) );
  NOR2X1 U541 ( .A(\register[8][4] ), .B(n291), .Y(n147) );
  NOR2X1 U543 ( .A(n971), .B(n147), .Y(n149) );
  OAI21X1 U545 ( .A(\register[10][4] ), .B(n290), .C(n149), .Y(n153) );
  OAI22X1 U547 ( .A(\register[14][4] ), .B(n295), .C(\register[12][4] ), .D(
        n298), .Y(n151) );
  NOR2X1 U549 ( .A(n153), .B(n151), .Y(n170) );
  OAI22X1 U550 ( .A(\register[3][4] ), .B(n286), .C(\register[1][4] ), .D(n287), .Y(n160) );
  OAI22X1 U554 ( .A(\register[7][4] ), .B(n288), .C(sample_data[12]), .D(n289), 
        .Y(n155) );
  NOR2X1 U556 ( .A(n160), .B(n155), .Y(n169) );
  NOR2X1 U558 ( .A(\register[0][4] ), .B(n291), .Y(n161) );
  NOR2X1 U560 ( .A(N85), .B(n161), .Y(n164) );
  OAI21X1 U562 ( .A(\register[2][4] ), .B(n290), .C(n164), .Y(n167) );
  OAI22X1 U564 ( .A(\register[6][4] ), .B(n295), .C(sample_data[4]), .D(n298), 
        .Y(n166) );
  NOR2X1 U566 ( .A(n167), .B(n166), .Y(n168) );
  AOI22X1 U568 ( .A(n171), .B(n170), .C(n169), .D(n168), .Y(n172) );
  OAI22X1 U569 ( .A(\register[11][5] ), .B(n286), .C(\register[9][5] ), .D(
        n287), .Y(n183) );
  OAI22X1 U571 ( .A(\register[15][5] ), .B(n288), .C(\register[13][5] ), .D(
        n289), .Y(n180) );
  NOR2X1 U573 ( .A(n183), .B(n180), .Y(n210) );
  NOR2X1 U575 ( .A(\register[8][5] ), .B(n291), .Y(n184) );
  NOR2X1 U577 ( .A(n971), .B(n184), .Y(n186) );
  OAI21X1 U579 ( .A(\register[10][5] ), .B(n290), .C(n186), .Y(n190) );
  OAI22X1 U581 ( .A(\register[14][5] ), .B(n295), .C(\register[12][5] ), .D(
        n298), .Y(n188) );
  NOR2X1 U583 ( .A(n190), .B(n188), .Y(n209) );
  OAI22X1 U585 ( .A(\register[3][5] ), .B(n286), .C(\register[1][5] ), .D(n287), .Y(n194) );
  OAI22X1 U586 ( .A(\register[7][5] ), .B(n288), .C(sample_data[13]), .D(n289), 
        .Y(n192) );
  NOR2X1 U590 ( .A(n194), .B(n192), .Y(n208) );
  NOR2X1 U592 ( .A(\register[0][5] ), .B(n291), .Y(n196) );
  NOR2X1 U594 ( .A(N85), .B(n196), .Y(n200) );
  OAI21X1 U596 ( .A(\register[2][5] ), .B(n290), .C(n200), .Y(n205) );
  OAI22X1 U598 ( .A(\register[6][5] ), .B(n295), .C(sample_data[5]), .D(n298), 
        .Y(n202) );
  NOR2X1 U600 ( .A(n205), .B(n202), .Y(n207) );
  AOI22X1 U602 ( .A(n210), .B(n209), .C(n208), .D(n207), .Y(n211) );
  OAI22X1 U604 ( .A(\register[11][6] ), .B(n286), .C(\register[9][6] ), .D(
        n287), .Y(n213) );
  OAI22X1 U606 ( .A(\register[15][6] ), .B(n288), .C(\register[13][6] ), .D(
        n289), .Y(n212) );
  NOR2X1 U608 ( .A(n213), .B(n212), .Y(n246) );
  NOR2X1 U610 ( .A(\register[8][6] ), .B(n291), .Y(n219) );
  NOR2X1 U612 ( .A(n971), .B(n219), .Y(n222) );
  OAI21X1 U614 ( .A(\register[10][6] ), .B(n290), .C(n222), .Y(n225) );
  OAI22X1 U616 ( .A(\register[14][6] ), .B(n295), .C(\register[12][6] ), .D(
        n298), .Y(n223) );
  NOR2X1 U619 ( .A(n225), .B(n223), .Y(n245) );
  OAI22X1 U622 ( .A(\register[3][6] ), .B(n286), .C(\register[1][6] ), .D(n287), .Y(n229) );
  OAI22X1 U623 ( .A(\register[7][6] ), .B(n288), .C(sample_data[14]), .D(n289), 
        .Y(n227) );
  NOR2X1 U624 ( .A(n229), .B(n227), .Y(n244) );
  NOR2X1 U774 ( .A(\register[0][6] ), .B(n291), .Y(n231) );
  NOR2X1 U775 ( .A(N85), .B(n231), .Y(n233) );
  OAI21X1 U776 ( .A(\register[2][6] ), .B(n290), .C(n233), .Y(n239) );
  OAI22X1 U777 ( .A(\register[6][6] ), .B(n295), .C(sample_data[6]), .D(n298), 
        .Y(n235) );
  NOR2X1 U778 ( .A(n239), .B(n235), .Y(n242) );
  AOI22X1 U779 ( .A(n246), .B(n245), .C(n244), .D(n242), .Y(n247) );
  OAI22X1 U780 ( .A(\register[13][7] ), .B(n289), .C(\register[11][7] ), .D(
        n286), .Y(n249) );
  OAI21X1 U781 ( .A(\register[15][7] ), .B(n288), .C(N85), .Y(n248) );
  NOR2X1 U782 ( .A(n249), .B(n248), .Y(n281) );
  OR2X1 U783 ( .A(\register[8][7] ), .B(n291), .Y(n250) );
  OAI21X1 U784 ( .A(n290), .B(\register[10][7] ), .C(n250), .Y(n254) );
  OAI21X1 U785 ( .A(\register[12][7] ), .B(n298), .C(n285), .Y(n259) );
  OAI22X1 U786 ( .A(\register[9][7] ), .B(n287), .C(\register[14][7] ), .D(
        n295), .Y(n255) );
  NOR2X1 U787 ( .A(n259), .B(n255), .Y(n279) );
  OAI22X1 U788 ( .A(\register[3][7] ), .B(n286), .C(\register[1][7] ), .D(n287), .Y(n263) );
  OAI22X1 U789 ( .A(\register[7][7] ), .B(n288), .C(sample_data[15]), .D(n289), 
        .Y(n262) );
  NOR2X1 U790 ( .A(n263), .B(n262), .Y(n275) );
  NOR2X1 U791 ( .A(\register[0][7] ), .B(n291), .Y(n265) );
  NOR2X1 U792 ( .A(N85), .B(n265), .Y(n267) );
  OAI21X1 U793 ( .A(\register[2][7] ), .B(n290), .C(n267), .Y(n271) );
  OAI22X1 U794 ( .A(\register[6][7] ), .B(n295), .C(sample_data[7]), .D(n298), 
        .Y(n269) );
  NOR2X1 U795 ( .A(n271), .B(n269), .Y(n273) );
  AOI22X1 U796 ( .A(n281), .B(n279), .C(n275), .D(n273), .Y(n283) );
  INVX2 U797 ( .A(n254), .Y(n285) );
  INVX2 U798 ( .A(n52), .Y(N972) );
  INVX2 U799 ( .A(n96), .Y(N971) );
  INVX2 U800 ( .A(n115), .Y(N970) );
  INVX2 U801 ( .A(n141), .Y(N969) );
  INVX2 U802 ( .A(n172), .Y(N968) );
  INVX2 U803 ( .A(n211), .Y(N967) );
  INVX2 U804 ( .A(n247), .Y(N966) );
  INVX2 U805 ( .A(n283), .Y(N965) );
  AOI22X1 U806 ( .A(\register[9][0] ), .B(n621), .C(\register[13][0] ), .D(
        n622), .Y(n301) );
  AOI22X1 U807 ( .A(\register[1][0] ), .B(n623), .C(sample_data[8]), .D(n624), 
        .Y(n299) );
  AOI21X1 U808 ( .A(n301), .B(n299), .C(n863), .Y(n309) );
  AOI22X1 U809 ( .A(\register[11][0] ), .B(n621), .C(\register[15][0] ), .D(
        n622), .Y(n305) );
  AOI22X1 U810 ( .A(\register[3][0] ), .B(n623), .C(\register[7][0] ), .D(n624), .Y(n303) );
  AOI21X1 U811 ( .A(n305), .B(n303), .C(n620), .Y(n307) );
  OR2X1 U812 ( .A(n309), .B(n307), .Y(fir_coefficient[8]) );
  AOI22X1 U813 ( .A(\register[9][1] ), .B(n621), .C(\register[13][1] ), .D(
        n622), .Y(n315) );
  AOI22X1 U814 ( .A(\register[1][1] ), .B(n674), .C(sample_data[9]), .D(n624), 
        .Y(n311) );
  AOI21X1 U815 ( .A(n315), .B(n311), .C(n863), .Y(n322) );
  AOI22X1 U816 ( .A(\register[11][1] ), .B(n621), .C(\register[15][1] ), .D(
        n622), .Y(n319) );
  AOI22X1 U817 ( .A(\register[3][1] ), .B(n623), .C(\register[7][1] ), .D(n624), .Y(n317) );
  AOI21X1 U818 ( .A(n319), .B(n317), .C(n620), .Y(n321) );
  OR2X1 U819 ( .A(n322), .B(n321), .Y(fir_coefficient[9]) );
  AOI22X1 U820 ( .A(\register[9][2] ), .B(n621), .C(\register[13][2] ), .D(
        n622), .Y(n325) );
  AOI22X1 U821 ( .A(\register[1][2] ), .B(n674), .C(sample_data[10]), .D(n624), 
        .Y(n323) );
  AOI21X1 U822 ( .A(n325), .B(n323), .C(n863), .Y(n341) );
  AOI22X1 U823 ( .A(\register[11][2] ), .B(n621), .C(\register[15][2] ), .D(
        n622), .Y(n337) );
  AOI22X1 U824 ( .A(\register[3][2] ), .B(n623), .C(\register[7][2] ), .D(n624), .Y(n335) );
  AOI21X1 U825 ( .A(n337), .B(n335), .C(n620), .Y(n338) );
  OR2X1 U826 ( .A(n341), .B(n338), .Y(fir_coefficient[10]) );
  AOI22X1 U827 ( .A(\register[9][3] ), .B(n621), .C(\register[13][3] ), .D(
        n622), .Y(n346) );
  AOI22X1 U828 ( .A(\register[1][3] ), .B(n674), .C(sample_data[11]), .D(n624), 
        .Y(n342) );
  AOI21X1 U829 ( .A(n346), .B(n342), .C(n863), .Y(n594) );
  AOI22X1 U830 ( .A(\register[11][3] ), .B(n621), .C(\register[15][3] ), .D(
        n622), .Y(n592) );
  AOI22X1 U831 ( .A(\register[3][3] ), .B(n623), .C(\register[7][3] ), .D(n624), .Y(n591) );
  AOI21X1 U832 ( .A(n592), .B(n591), .C(n620), .Y(n593) );
  OR2X1 U833 ( .A(n594), .B(n593), .Y(fir_coefficient[11]) );
  AOI22X1 U834 ( .A(\register[9][4] ), .B(n621), .C(\register[13][4] ), .D(
        n622), .Y(n596) );
  AOI22X1 U835 ( .A(\register[1][4] ), .B(n623), .C(sample_data[12]), .D(n624), 
        .Y(n595) );
  AOI21X1 U836 ( .A(n596), .B(n595), .C(n863), .Y(n600) );
  AOI22X1 U837 ( .A(\register[11][4] ), .B(n621), .C(\register[15][4] ), .D(
        n622), .Y(n598) );
  AOI22X1 U838 ( .A(\register[3][4] ), .B(n623), .C(\register[7][4] ), .D(n624), .Y(n597) );
  AOI21X1 U839 ( .A(n598), .B(n597), .C(n620), .Y(n599) );
  OR2X1 U840 ( .A(n600), .B(n599), .Y(fir_coefficient[12]) );
  AOI22X1 U841 ( .A(\register[9][5] ), .B(n621), .C(\register[13][5] ), .D(
        n622), .Y(n602) );
  AOI22X1 U842 ( .A(\register[1][5] ), .B(n674), .C(sample_data[13]), .D(n624), 
        .Y(n601) );
  AOI21X1 U843 ( .A(n602), .B(n601), .C(n863), .Y(n606) );
  AOI22X1 U844 ( .A(\register[11][5] ), .B(n621), .C(\register[15][5] ), .D(
        n622), .Y(n604) );
  AOI22X1 U845 ( .A(\register[3][5] ), .B(n623), .C(\register[7][5] ), .D(n624), .Y(n603) );
  AOI21X1 U846 ( .A(n604), .B(n603), .C(n620), .Y(n605) );
  OR2X1 U847 ( .A(n606), .B(n605), .Y(fir_coefficient[13]) );
  AOI22X1 U848 ( .A(\register[9][6] ), .B(n621), .C(\register[13][6] ), .D(
        n622), .Y(n608) );
  AOI22X1 U849 ( .A(\register[1][6] ), .B(n623), .C(sample_data[14]), .D(n624), 
        .Y(n607) );
  AOI21X1 U850 ( .A(n608), .B(n607), .C(n863), .Y(n612) );
  AOI22X1 U851 ( .A(\register[11][6] ), .B(n621), .C(\register[15][6] ), .D(
        n622), .Y(n610) );
  AOI22X1 U852 ( .A(\register[3][6] ), .B(n623), .C(\register[7][6] ), .D(n624), .Y(n609) );
  AOI21X1 U853 ( .A(n610), .B(n609), .C(n620), .Y(n611) );
  OR2X1 U854 ( .A(n612), .B(n611), .Y(fir_coefficient[14]) );
  AOI22X1 U855 ( .A(\register[9][7] ), .B(n621), .C(\register[13][7] ), .D(
        n622), .Y(n614) );
  AOI22X1 U856 ( .A(\register[1][7] ), .B(n623), .C(sample_data[15]), .D(n624), 
        .Y(n613) );
  AOI21X1 U857 ( .A(n614), .B(n613), .C(n863), .Y(n618) );
  AOI22X1 U858 ( .A(\register[11][7] ), .B(n621), .C(\register[15][7] ), .D(
        n622), .Y(n616) );
  AOI22X1 U859 ( .A(\register[3][7] ), .B(n623), .C(\register[7][7] ), .D(n624), .Y(n615) );
  AOI21X1 U860 ( .A(n616), .B(n615), .C(n620), .Y(n617) );
  OR2X1 U861 ( .A(n618), .B(n617), .Y(fir_coefficient[15]) );
  INVX2 U862 ( .A(N94), .Y(n619) );
  INVX2 U863 ( .A(n863), .Y(n620) );
  AOI22X1 U864 ( .A(\register[8][0] ), .B(n3), .C(\register[12][0] ), .D(n1), 
        .Y(n626) );
  AOI22X1 U865 ( .A(\register[0][0] ), .B(n674), .C(sample_data[0]), .D(n2), 
        .Y(n625) );
  AOI21X1 U866 ( .A(n626), .B(n625), .C(n863), .Y(n630) );
  AOI22X1 U867 ( .A(\register[10][0] ), .B(n3), .C(new_coefficient_set), .D(n1), .Y(n628) );
  AOI22X1 U868 ( .A(\register[2][0] ), .B(n674), .C(\register[6][0] ), .D(n2), 
        .Y(n627) );
  AOI21X1 U869 ( .A(n628), .B(n627), .C(n620), .Y(n629) );
  OR2X1 U870 ( .A(n630), .B(n629), .Y(fir_coefficient[0]) );
  AOI22X1 U871 ( .A(\register[8][1] ), .B(n3), .C(\register[12][1] ), .D(n622), 
        .Y(n632) );
  AOI22X1 U872 ( .A(\register[0][1] ), .B(n674), .C(sample_data[1]), .D(n2), 
        .Y(n631) );
  AOI21X1 U873 ( .A(n632), .B(n631), .C(n863), .Y(n636) );
  AOI22X1 U874 ( .A(\register[10][1] ), .B(n621), .C(\register[14][1] ), .D(n1), .Y(n634) );
  AOI22X1 U875 ( .A(\register[2][1] ), .B(n623), .C(\register[6][1] ), .D(n624), .Y(n633) );
  AOI21X1 U876 ( .A(n634), .B(n633), .C(n620), .Y(n635) );
  OR2X1 U877 ( .A(n636), .B(n635), .Y(fir_coefficient[1]) );
  AOI22X1 U878 ( .A(\register[8][2] ), .B(n3), .C(\register[12][2] ), .D(n1), 
        .Y(n638) );
  AOI22X1 U879 ( .A(\register[0][2] ), .B(n674), .C(sample_data[2]), .D(n2), 
        .Y(n637) );
  AOI21X1 U880 ( .A(n638), .B(n637), .C(n863), .Y(n642) );
  AOI22X1 U881 ( .A(\register[10][2] ), .B(n3), .C(\register[14][2] ), .D(n1), 
        .Y(n640) );
  AOI22X1 U882 ( .A(\register[2][2] ), .B(n623), .C(\register[6][2] ), .D(n2), 
        .Y(n639) );
  AOI21X1 U883 ( .A(n640), .B(n639), .C(n620), .Y(n641) );
  OR2X1 U884 ( .A(n642), .B(n641), .Y(fir_coefficient[2]) );
  AOI22X1 U885 ( .A(\register[8][3] ), .B(n3), .C(\register[12][3] ), .D(n622), 
        .Y(n644) );
  AOI22X1 U886 ( .A(\register[0][3] ), .B(n674), .C(sample_data[3]), .D(n2), 
        .Y(n643) );
  AOI21X1 U887 ( .A(n644), .B(n643), .C(n863), .Y(n648) );
  AOI22X1 U888 ( .A(\register[10][3] ), .B(n621), .C(\register[14][3] ), .D(n1), .Y(n646) );
  AOI22X1 U889 ( .A(\register[2][3] ), .B(n674), .C(\register[6][3] ), .D(n624), .Y(n645) );
  AOI21X1 U890 ( .A(n646), .B(n645), .C(n620), .Y(n647) );
  OR2X1 U891 ( .A(n648), .B(n647), .Y(fir_coefficient[3]) );
  AOI22X1 U892 ( .A(\register[8][4] ), .B(n3), .C(\register[12][4] ), .D(n622), 
        .Y(n650) );
  AOI22X1 U893 ( .A(\register[0][4] ), .B(n674), .C(sample_data[4]), .D(n2), 
        .Y(n649) );
  AOI21X1 U894 ( .A(n650), .B(n649), .C(n863), .Y(n654) );
  AOI22X1 U895 ( .A(\register[10][4] ), .B(n621), .C(\register[14][4] ), .D(n1), .Y(n652) );
  AOI22X1 U896 ( .A(\register[2][4] ), .B(n623), .C(\register[6][4] ), .D(n624), .Y(n651) );
  AOI21X1 U897 ( .A(n652), .B(n651), .C(n620), .Y(n653) );
  OR2X1 U898 ( .A(n654), .B(n653), .Y(fir_coefficient[4]) );
  AOI22X1 U899 ( .A(\register[8][5] ), .B(n3), .C(\register[12][5] ), .D(n622), 
        .Y(n656) );
  AOI22X1 U900 ( .A(\register[0][5] ), .B(n674), .C(sample_data[5]), .D(n2), 
        .Y(n655) );
  AOI21X1 U901 ( .A(n656), .B(n655), .C(n863), .Y(n660) );
  AOI22X1 U902 ( .A(\register[10][5] ), .B(n621), .C(\register[14][5] ), .D(n1), .Y(n658) );
  AOI22X1 U903 ( .A(\register[2][5] ), .B(n623), .C(\register[6][5] ), .D(n624), .Y(n657) );
  AOI21X1 U904 ( .A(n658), .B(n657), .C(n620), .Y(n659) );
  OR2X1 U905 ( .A(n660), .B(n659), .Y(fir_coefficient[5]) );
  AOI22X1 U906 ( .A(\register[8][6] ), .B(n3), .C(\register[12][6] ), .D(n1), 
        .Y(n662) );
  AOI22X1 U907 ( .A(\register[0][6] ), .B(n674), .C(sample_data[6]), .D(n2), 
        .Y(n661) );
  AOI21X1 U908 ( .A(n662), .B(n661), .C(n863), .Y(n666) );
  AOI22X1 U909 ( .A(\register[10][6] ), .B(n3), .C(\register[14][6] ), .D(n1), 
        .Y(n664) );
  AOI22X1 U910 ( .A(\register[2][6] ), .B(n674), .C(\register[6][6] ), .D(n2), 
        .Y(n663) );
  AOI21X1 U911 ( .A(n664), .B(n663), .C(n620), .Y(n665) );
  OR2X1 U912 ( .A(n666), .B(n665), .Y(fir_coefficient[6]) );
  AOI22X1 U913 ( .A(\register[8][7] ), .B(n3), .C(\register[12][7] ), .D(n622), 
        .Y(n668) );
  AOI22X1 U914 ( .A(\register[0][7] ), .B(n674), .C(sample_data[7]), .D(n2), 
        .Y(n667) );
  AOI21X1 U915 ( .A(n668), .B(n667), .C(n863), .Y(n672) );
  AOI22X1 U916 ( .A(\register[10][7] ), .B(n621), .C(\register[14][7] ), .D(n1), .Y(n670) );
  AOI22X1 U917 ( .A(\register[2][7] ), .B(n674), .C(\register[6][7] ), .D(n624), .Y(n669) );
  AOI21X1 U918 ( .A(n670), .B(n669), .C(n620), .Y(n671) );
  OR2X1 U919 ( .A(n672), .B(n671), .Y(fir_coefficient[7]) );
  INVX2 U920 ( .A(N93), .Y(n673) );
  NOR2X1 U921 ( .A(n971), .B(N84), .Y(n675) );
  NOR2X1 U922 ( .A(n971), .B(n779), .Y(n676) );
  AOI22X1 U923 ( .A(N482), .B(n11), .C(n854), .D(n10), .Y(n683) );
  NOR2X1 U924 ( .A(N84), .B(N85), .Y(n677) );
  NOR2X1 U925 ( .A(n779), .B(N85), .Y(n678) );
  AOI22X1 U926 ( .A(n727), .B(n12), .C(N450), .D(n9), .Y(n682) );
  AOI22X1 U927 ( .A(N466), .B(n6), .C(N498), .D(n4), .Y(n680) );
  AOI22X1 U928 ( .A(N402), .B(n7), .C(N434), .D(n5), .Y(n679) );
  AND2X1 U929 ( .A(n680), .B(n679), .Y(n681) );
  NAND3X1 U930 ( .A(n683), .B(n682), .C(n681), .Y(N980) );
  AOI22X1 U931 ( .A(N483), .B(n11), .C(n855), .D(n10), .Y(n688) );
  AOI22X1 U932 ( .A(n728), .B(n12), .C(N451), .D(n9), .Y(n687) );
  AOI22X1 U933 ( .A(N467), .B(n6), .C(N499), .D(n4), .Y(n685) );
  AOI22X1 U934 ( .A(N403), .B(n7), .C(N435), .D(n5), .Y(n684) );
  AND2X1 U935 ( .A(n685), .B(n684), .Y(n686) );
  NAND3X1 U936 ( .A(n688), .B(n687), .C(n686), .Y(N979) );
  AOI22X1 U937 ( .A(N484), .B(n11), .C(n856), .D(n10), .Y(n693) );
  AOI22X1 U938 ( .A(n729), .B(n12), .C(N452), .D(n9), .Y(n692) );
  AOI22X1 U939 ( .A(N468), .B(n6), .C(N500), .D(n4), .Y(n690) );
  AOI22X1 U940 ( .A(N404), .B(n7), .C(N436), .D(n5), .Y(n689) );
  AND2X1 U941 ( .A(n690), .B(n689), .Y(n691) );
  NAND3X1 U942 ( .A(n693), .B(n692), .C(n691), .Y(N978) );
  AOI22X1 U943 ( .A(N485), .B(n11), .C(n857), .D(n10), .Y(n698) );
  AOI22X1 U944 ( .A(n730), .B(n12), .C(N453), .D(n9), .Y(n697) );
  AOI22X1 U945 ( .A(N469), .B(n6), .C(N501), .D(n4), .Y(n695) );
  AOI22X1 U946 ( .A(N405), .B(n7), .C(N437), .D(n5), .Y(n694) );
  AND2X1 U947 ( .A(n695), .B(n694), .Y(n696) );
  NAND3X1 U948 ( .A(n698), .B(n697), .C(n696), .Y(N977) );
  AOI22X1 U949 ( .A(N486), .B(n11), .C(n858), .D(n10), .Y(n703) );
  AOI22X1 U950 ( .A(n731), .B(n12), .C(N454), .D(n9), .Y(n702) );
  AOI22X1 U951 ( .A(N470), .B(n6), .C(N502), .D(n4), .Y(n700) );
  AOI22X1 U952 ( .A(N406), .B(n7), .C(N438), .D(n5), .Y(n699) );
  AND2X1 U953 ( .A(n700), .B(n699), .Y(n701) );
  NAND3X1 U954 ( .A(n703), .B(n702), .C(n701), .Y(N976) );
  AOI22X1 U955 ( .A(N487), .B(n11), .C(n859), .D(n10), .Y(n708) );
  AOI22X1 U956 ( .A(n732), .B(n12), .C(N455), .D(n9), .Y(n707) );
  AOI22X1 U957 ( .A(N471), .B(n6), .C(N503), .D(n4), .Y(n705) );
  AOI22X1 U958 ( .A(N407), .B(n7), .C(N439), .D(n5), .Y(n704) );
  AND2X1 U959 ( .A(n705), .B(n704), .Y(n706) );
  NAND3X1 U960 ( .A(n708), .B(n707), .C(n706), .Y(N975) );
  AOI22X1 U961 ( .A(N488), .B(n11), .C(n860), .D(n10), .Y(n713) );
  AOI22X1 U962 ( .A(n733), .B(n12), .C(N456), .D(n9), .Y(n712) );
  AOI22X1 U963 ( .A(N472), .B(n6), .C(N504), .D(n4), .Y(n710) );
  AOI22X1 U964 ( .A(N408), .B(n7), .C(N440), .D(n5), .Y(n709) );
  AND2X1 U965 ( .A(n710), .B(n709), .Y(n711) );
  NAND3X1 U966 ( .A(n713), .B(n712), .C(n711), .Y(N974) );
  AOI22X1 U967 ( .A(N489), .B(n11), .C(n861), .D(n10), .Y(n718) );
  AOI22X1 U968 ( .A(n734), .B(n12), .C(N457), .D(n9), .Y(n717) );
  AOI22X1 U969 ( .A(N473), .B(n6), .C(N505), .D(n4), .Y(n715) );
  AOI22X1 U970 ( .A(N409), .B(n7), .C(N441), .D(n5), .Y(n714) );
  AND2X1 U971 ( .A(n715), .B(n714), .Y(n716) );
  NAND3X1 U972 ( .A(n718), .B(n717), .C(n716), .Y(N973) );
  AOI22X1 U973 ( .A(N490), .B(n11), .C(N522), .D(n10), .Y(n723) );
  AOI22X1 U974 ( .A(n735), .B(n12), .C(N458), .D(n9), .Y(n722) );
  AOI22X1 U975 ( .A(N474), .B(n6), .C(N506), .D(n4), .Y(n720) );
  AOI22X1 U976 ( .A(n743), .B(n7), .C(N442), .D(n5), .Y(n719) );
  AND2X1 U977 ( .A(n720), .B(n719), .Y(n721) );
  NAND3X1 U978 ( .A(n723), .B(n722), .C(n721), .Y(N988) );
  AOI22X1 U979 ( .A(N491), .B(n11), .C(N523), .D(n10), .Y(n746) );
  AOI22X1 U980 ( .A(n736), .B(n12), .C(N459), .D(n9), .Y(n745) );
  AOI22X1 U981 ( .A(N475), .B(n6), .C(N507), .D(n4), .Y(n725) );
  AOI22X1 U982 ( .A(N411), .B(n7), .C(N443), .D(n5), .Y(n724) );
  AND2X1 U983 ( .A(n725), .B(n724), .Y(n726) );
  NAND3X1 U984 ( .A(n746), .B(n745), .C(n726), .Y(N987) );
  AOI22X1 U985 ( .A(N492), .B(n11), .C(N524), .D(n10), .Y(n753) );
  AOI22X1 U986 ( .A(n737), .B(n12), .C(N460), .D(n9), .Y(n752) );
  AOI22X1 U987 ( .A(N476), .B(n6), .C(N508), .D(n4), .Y(n750) );
  AOI22X1 U988 ( .A(N412), .B(n7), .C(N444), .D(n5), .Y(n747) );
  AND2X1 U989 ( .A(n750), .B(n747), .Y(n751) );
  NAND3X1 U990 ( .A(n753), .B(n752), .C(n751), .Y(N986) );
  AOI22X1 U991 ( .A(N493), .B(n11), .C(N525), .D(n10), .Y(n758) );
  AOI22X1 U992 ( .A(n738), .B(n12), .C(N461), .D(n9), .Y(n757) );
  AOI22X1 U993 ( .A(N477), .B(n6), .C(N509), .D(n4), .Y(n755) );
  AOI22X1 U994 ( .A(N413), .B(n7), .C(N445), .D(n5), .Y(n754) );
  AND2X1 U995 ( .A(n755), .B(n754), .Y(n756) );
  NAND3X1 U996 ( .A(n758), .B(n757), .C(n756), .Y(N985) );
  AOI22X1 U997 ( .A(N494), .B(n11), .C(N526), .D(n10), .Y(n763) );
  AOI22X1 U998 ( .A(n739), .B(n12), .C(N462), .D(n9), .Y(n762) );
  AOI22X1 U999 ( .A(N478), .B(n6), .C(N510), .D(n4), .Y(n760) );
  AOI22X1 U1000 ( .A(N414), .B(n7), .C(N446), .D(n5), .Y(n759) );
  AND2X1 U1001 ( .A(n760), .B(n759), .Y(n761) );
  NAND3X1 U1002 ( .A(n763), .B(n762), .C(n761), .Y(N984) );
  AOI22X1 U1003 ( .A(N495), .B(n11), .C(N527), .D(n10), .Y(n768) );
  AOI22X1 U1004 ( .A(n740), .B(n12), .C(N463), .D(n9), .Y(n767) );
  AOI22X1 U1005 ( .A(N479), .B(n6), .C(N511), .D(n4), .Y(n765) );
  AOI22X1 U1006 ( .A(N415), .B(n7), .C(N447), .D(n5), .Y(n764) );
  AND2X1 U1007 ( .A(n765), .B(n764), .Y(n766) );
  NAND3X1 U1008 ( .A(n768), .B(n767), .C(n766), .Y(N983) );
  AOI22X1 U1009 ( .A(N496), .B(n11), .C(N528), .D(n10), .Y(n773) );
  AOI22X1 U1010 ( .A(n741), .B(n12), .C(N464), .D(n9), .Y(n772) );
  AOI22X1 U1011 ( .A(N480), .B(n6), .C(N512), .D(n4), .Y(n770) );
  AOI22X1 U1012 ( .A(N416), .B(n7), .C(N448), .D(n5), .Y(n769) );
  AND2X1 U1013 ( .A(n770), .B(n769), .Y(n771) );
  NAND3X1 U1014 ( .A(n773), .B(n772), .C(n771), .Y(N982) );
  AOI22X1 U1015 ( .A(N497), .B(n11), .C(N529), .D(n10), .Y(n778) );
  AOI22X1 U1016 ( .A(n742), .B(n12), .C(N465), .D(n9), .Y(n777) );
  AOI22X1 U1017 ( .A(N481), .B(n6), .C(N513), .D(n4), .Y(n775) );
  AOI22X1 U1018 ( .A(N417), .B(n7), .C(N449), .D(n5), .Y(n774) );
  AND2X1 U1019 ( .A(n775), .B(n774), .Y(n776) );
  NAND3X1 U1020 ( .A(n778), .B(n777), .C(n776), .Y(N981) );
  INVX2 U1021 ( .A(N84), .Y(n779) );
  NAND3X1 U1022 ( .A(write1), .B(storeadd[2]), .C(n352), .Y(n780) );
  BUFX2 U1023 ( .A(n780), .Y(n781) );
  BUFX2 U1024 ( .A(n780), .Y(n782) );
  BUFX2 U1025 ( .A(n780), .Y(n783) );
  BUFX2 U1026 ( .A(n18), .Y(n784) );
  BUFX2 U1027 ( .A(n18), .Y(n785) );
  BUFX2 U1028 ( .A(n18), .Y(n786) );
  INVX2 U1029 ( .A(n742), .Y(n812) );
  INVX2 U1030 ( .A(fir_out[15]), .Y(n813) );
  INVX2 U1031 ( .A(n741), .Y(n814) );
  INVX2 U1032 ( .A(fir_out[14]), .Y(n815) );
  INVX2 U1033 ( .A(n740), .Y(n816) );
  INVX2 U1034 ( .A(fir_out[13]), .Y(n817) );
  INVX2 U1035 ( .A(n739), .Y(n818) );
  INVX2 U1036 ( .A(fir_out[12]), .Y(n819) );
  INVX2 U1037 ( .A(n738), .Y(n820) );
  INVX2 U1038 ( .A(fir_out[11]), .Y(n821) );
  INVX2 U1039 ( .A(n737), .Y(n822) );
  INVX2 U1040 ( .A(fir_out[10]), .Y(n823) );
  INVX2 U1041 ( .A(n736), .Y(n824) );
  INVX2 U1042 ( .A(fir_out[9]), .Y(n825) );
  INVX2 U1043 ( .A(n735), .Y(n826) );
  INVX2 U1044 ( .A(fir_out[8]), .Y(n827) );
  INVX2 U1045 ( .A(n324), .Y(n828) );
  INVX2 U1046 ( .A(n734), .Y(n829) );
  INVX2 U1047 ( .A(fir_out[7]), .Y(n830) );
  INVX2 U1048 ( .A(n326), .Y(n831) );
  INVX2 U1049 ( .A(n733), .Y(n832) );
  INVX2 U1050 ( .A(fir_out[6]), .Y(n833) );
  INVX2 U1051 ( .A(n327), .Y(n834) );
  INVX2 U1052 ( .A(n732), .Y(n835) );
  INVX2 U1053 ( .A(fir_out[5]), .Y(n836) );
  INVX2 U1054 ( .A(n328), .Y(n837) );
  INVX2 U1055 ( .A(n731), .Y(n838) );
  INVX2 U1056 ( .A(fir_out[4]), .Y(n839) );
  INVX2 U1057 ( .A(n329), .Y(n840) );
  INVX2 U1058 ( .A(n730), .Y(n841) );
  INVX2 U1059 ( .A(fir_out[3]), .Y(n842) );
  INVX2 U1060 ( .A(n330), .Y(n843) );
  INVX2 U1061 ( .A(n729), .Y(n844) );
  INVX2 U1062 ( .A(fir_out[2]), .Y(n845) );
  INVX2 U1063 ( .A(n331), .Y(n846) );
  INVX2 U1064 ( .A(n728), .Y(n847) );
  INVX2 U1065 ( .A(fir_out[1]), .Y(n848) );
  INVX2 U1066 ( .A(n332), .Y(n849) );
  INVX2 U1067 ( .A(n727), .Y(n850) );
  INVX2 U1068 ( .A(fir_out[0]), .Y(n851) );
  INVX2 U1069 ( .A(n743), .Y(n852) );
  INVX2 U1070 ( .A(err), .Y(n853) );
  INVX2 U1071 ( .A(n74), .Y(n854) );
  INVX2 U1072 ( .A(n72), .Y(n855) );
  INVX2 U1073 ( .A(n70), .Y(n856) );
  INVX2 U1074 ( .A(n68), .Y(n857) );
  INVX2 U1075 ( .A(n66), .Y(n858) );
  INVX2 U1076 ( .A(n64), .Y(n859) );
  INVX2 U1077 ( .A(n62), .Y(n860) );
  INVX2 U1078 ( .A(n57), .Y(n861) );
  INVX2 U1079 ( .A(N402), .Y(n862) );
  INVX2 U1080 ( .A(coefficient_num[0]), .Y(n863) );
  INVX2 U1081 ( .A(n237), .Y(n864) );
  INVX2 U1082 ( .A(n198), .Y(n865) );
  INVX2 U1083 ( .A(n158), .Y(n866) );
  INVX2 U1084 ( .A(write1), .Y(n868) );
  INVX2 U1085 ( .A(n277), .Y(n869) );
  INVX2 U1086 ( .A(n313), .Y(n870) );
  INVX2 U1087 ( .A(storeadd[3]), .Y(n873) );
  INVX2 U1088 ( .A(storeadd[2]), .Y(n874) );
  INVX2 U1089 ( .A(storeadd[1]), .Y(n875) );
  INVX2 U1090 ( .A(data_ready), .Y(n876) );
  INVX2 U1091 ( .A(sample_data[15]), .Y(n877) );
  INVX2 U1092 ( .A(sample_data[14]), .Y(n878) );
  INVX2 U1093 ( .A(sample_data[13]), .Y(n879) );
  INVX2 U1094 ( .A(sample_data[12]), .Y(n880) );
  INVX2 U1095 ( .A(sample_data[11]), .Y(n881) );
  INVX2 U1096 ( .A(sample_data[10]), .Y(n882) );
  INVX2 U1097 ( .A(sample_data[9]), .Y(n883) );
  INVX2 U1098 ( .A(sample_data[8]), .Y(n884) );
  INVX2 U1099 ( .A(sample_data[7]), .Y(n885) );
  INVX2 U1100 ( .A(sample_data[6]), .Y(n886) );
  INVX2 U1101 ( .A(sample_data[5]), .Y(n887) );
  INVX2 U1102 ( .A(sample_data[4]), .Y(n888) );
  INVX2 U1103 ( .A(sample_data[3]), .Y(n889) );
  INVX2 U1104 ( .A(sample_data[2]), .Y(n890) );
  INVX2 U1105 ( .A(sample_data[1]), .Y(n891) );
  INVX2 U1106 ( .A(sample_data[0]), .Y(n892) );
  INVX2 U1107 ( .A(\register[7][7] ), .Y(n893) );
  INVX2 U1108 ( .A(\register[7][6] ), .Y(n894) );
  INVX2 U1109 ( .A(\register[7][5] ), .Y(n895) );
  INVX2 U1110 ( .A(\register[7][4] ), .Y(n896) );
  INVX2 U1111 ( .A(\register[7][3] ), .Y(n897) );
  INVX2 U1112 ( .A(\register[7][2] ), .Y(n898) );
  INVX2 U1113 ( .A(\register[7][1] ), .Y(n899) );
  INVX2 U1114 ( .A(\register[7][0] ), .Y(n900) );
  INVX2 U1115 ( .A(\register[6][7] ), .Y(n901) );
  INVX2 U1116 ( .A(\register[6][6] ), .Y(n902) );
  INVX2 U1117 ( .A(\register[6][5] ), .Y(n903) );
  INVX2 U1118 ( .A(\register[6][4] ), .Y(n904) );
  INVX2 U1119 ( .A(\register[6][3] ), .Y(n905) );
  INVX2 U1120 ( .A(\register[6][2] ), .Y(n906) );
  INVX2 U1121 ( .A(\register[6][1] ), .Y(n907) );
  INVX2 U1122 ( .A(\register[6][0] ), .Y(n908) );
  INVX2 U1123 ( .A(\register[9][7] ), .Y(n909) );
  INVX2 U1124 ( .A(\register[9][6] ), .Y(n910) );
  INVX2 U1125 ( .A(\register[9][5] ), .Y(n911) );
  INVX2 U1126 ( .A(\register[9][4] ), .Y(n912) );
  INVX2 U1127 ( .A(\register[9][3] ), .Y(n913) );
  INVX2 U1128 ( .A(\register[9][2] ), .Y(n914) );
  INVX2 U1129 ( .A(\register[9][1] ), .Y(n915) );
  INVX2 U1130 ( .A(\register[9][0] ), .Y(n916) );
  INVX2 U1131 ( .A(\register[8][7] ), .Y(n917) );
  INVX2 U1132 ( .A(\register[8][6] ), .Y(n918) );
  INVX2 U1133 ( .A(\register[8][5] ), .Y(n919) );
  INVX2 U1134 ( .A(\register[8][4] ), .Y(n920) );
  INVX2 U1135 ( .A(\register[8][3] ), .Y(n921) );
  INVX2 U1136 ( .A(\register[8][2] ), .Y(n922) );
  INVX2 U1137 ( .A(\register[8][1] ), .Y(n923) );
  INVX2 U1138 ( .A(\register[8][0] ), .Y(n924) );
  INVX2 U1139 ( .A(\register[11][7] ), .Y(n925) );
  INVX2 U1140 ( .A(\register[11][6] ), .Y(n926) );
  INVX2 U1141 ( .A(\register[11][5] ), .Y(n927) );
  INVX2 U1142 ( .A(\register[11][4] ), .Y(n928) );
  INVX2 U1143 ( .A(\register[11][3] ), .Y(n929) );
  INVX2 U1144 ( .A(\register[11][2] ), .Y(n930) );
  INVX2 U1145 ( .A(\register[11][1] ), .Y(n931) );
  INVX2 U1146 ( .A(\register[11][0] ), .Y(n932) );
  INVX2 U1147 ( .A(\register[10][7] ), .Y(n933) );
  INVX2 U1148 ( .A(\register[10][6] ), .Y(n934) );
  INVX2 U1149 ( .A(\register[10][5] ), .Y(n935) );
  INVX2 U1150 ( .A(\register[10][4] ), .Y(n936) );
  INVX2 U1151 ( .A(\register[10][3] ), .Y(n937) );
  INVX2 U1152 ( .A(\register[10][2] ), .Y(n938) );
  INVX2 U1153 ( .A(\register[10][1] ), .Y(n939) );
  INVX2 U1154 ( .A(\register[10][0] ), .Y(n940) );
  INVX2 U1155 ( .A(\register[13][7] ), .Y(n941) );
  INVX2 U1156 ( .A(\register[13][6] ), .Y(n942) );
  INVX2 U1157 ( .A(\register[13][5] ), .Y(n943) );
  INVX2 U1158 ( .A(\register[13][4] ), .Y(n944) );
  INVX2 U1159 ( .A(\register[13][3] ), .Y(n945) );
  INVX2 U1160 ( .A(\register[13][2] ), .Y(n946) );
  INVX2 U1161 ( .A(\register[13][1] ), .Y(n947) );
  INVX2 U1162 ( .A(\register[13][0] ), .Y(n948) );
  INVX2 U1163 ( .A(\register[12][7] ), .Y(n949) );
  INVX2 U1164 ( .A(\register[12][6] ), .Y(n950) );
  INVX2 U1165 ( .A(\register[12][5] ), .Y(n951) );
  INVX2 U1166 ( .A(\register[12][4] ), .Y(n952) );
  INVX2 U1167 ( .A(\register[12][3] ), .Y(n953) );
  INVX2 U1168 ( .A(\register[12][2] ), .Y(n954) );
  INVX2 U1169 ( .A(\register[12][1] ), .Y(n955) );
  INVX2 U1170 ( .A(\register[12][0] ), .Y(n956) );
  INVX2 U1171 ( .A(\register[15][7] ), .Y(n957) );
  INVX2 U1172 ( .A(\register[15][6] ), .Y(n958) );
  INVX2 U1173 ( .A(\register[15][5] ), .Y(n959) );
  INVX2 U1174 ( .A(\register[15][4] ), .Y(n960) );
  INVX2 U1175 ( .A(\register[15][3] ), .Y(n961) );
  INVX2 U1176 ( .A(\register[15][2] ), .Y(n962) );
  INVX2 U1177 ( .A(\register[15][1] ), .Y(n963) );
  INVX2 U1178 ( .A(\register[15][0] ), .Y(n964) );
  INVX2 U1179 ( .A(n333), .Y(n965) );
  INVX2 U1180 ( .A(n89), .Y(n967) );
  INVX2 U1181 ( .A(n84), .Y(n968) );
  INVX2 U1182 ( .A(n257), .Y(n969) );
  INVX2 U1183 ( .A(n252), .Y(n970) );
  INVX2 U1184 ( .A(N85), .Y(n971) );
  INVX2 U1185 ( .A(n177), .Y(n972) );
  INVX2 U1186 ( .A(n135), .Y(n973) );
  INVX2 U1187 ( .A(n16), .Y(n974) );
  INVX2 U1188 ( .A(n320), .Y(n975) );
  INVX2 U1189 ( .A(n240), .Y(n976) );
  INVX2 U1190 ( .A(n77), .Y(n977) );
  INVX2 U1191 ( .A(n217), .Y(n978) );
  INVX2 U1192 ( .A(N83), .Y(n979) );
  INVX2 U1193 ( .A(N82), .Y(n980) );
  INVX2 U1194 ( .A(hsize), .Y(n981) );
  INVX2 U1195 ( .A(htrans[1]), .Y(n982) );
  INVX2 U1196 ( .A(htrans[0]), .Y(n983) );
  INVX2 U1197 ( .A(hwrite), .Y(n984) );
endmodule


module coefficient_loader ( clk, n_reset, new_coefficient_set, modwait, 
        load_coeff, coefficient_num, clear_new_coefficient );
  output [1:0] coefficient_num;
  input clk, n_reset, new_coefficient_set, modwait;
  output load_coeff, clear_new_coefficient;
  wire   n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n5, n6, n7, n8, n9, n10;
  wire   [2:0] state;

  DFFSR \state_reg[0]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        state[0]) );
  DFFSR \state_reg[2]  ( .D(n23), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        state[2]) );
  DFFSR \state_reg[1]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        state[1]) );
  AND2X2 U6 ( .A(n19), .B(n20), .Y(n15) );
  OAI21X1 U14 ( .A(n11), .B(n5), .C(n12), .Y(n22) );
  OAI21X1 U15 ( .A(n5), .B(n13), .C(state[1]), .Y(n12) );
  NAND2X1 U16 ( .A(state[0]), .B(n9), .Y(n13) );
  OAI22X1 U17 ( .A(load_coeff), .B(n14), .C(n15), .D(n9), .Y(n23) );
  OAI22X1 U18 ( .A(n15), .B(n8), .C(load_coeff), .D(n16), .Y(n24) );
  AOI21X1 U19 ( .A(n17), .B(new_coefficient_set), .C(n7), .Y(n16) );
  NOR2X1 U20 ( .A(state[1]), .B(modwait), .Y(n17) );
  NAND2X1 U21 ( .A(n5), .B(n20), .Y(n19) );
  NAND3X1 U22 ( .A(n11), .B(n6), .C(n18), .Y(n20) );
  NAND3X1 U23 ( .A(n10), .B(n9), .C(state[0]), .Y(n11) );
  NAND2X1 U24 ( .A(n14), .B(n21), .Y(coefficient_num[1]) );
  NAND3X1 U25 ( .A(state[0]), .B(n9), .C(state[1]), .Y(n14) );
  NAND2X1 U26 ( .A(n18), .B(n21), .Y(coefficient_num[0]) );
  NAND3X1 U27 ( .A(n8), .B(n9), .C(state[1]), .Y(n18) );
  NOR2X1 U28 ( .A(n5), .B(n21), .Y(clear_new_coefficient) );
  NAND3X1 U29 ( .A(n8), .B(n10), .C(state[2]), .Y(n21) );
  INVX2 U7 ( .A(n19), .Y(load_coeff) );
  INVX2 U8 ( .A(modwait), .Y(n5) );
  INVX2 U9 ( .A(coefficient_num[1]), .Y(n6) );
  INVX2 U10 ( .A(n18), .Y(n7) );
  INVX2 U11 ( .A(state[0]), .Y(n8) );
  INVX2 U12 ( .A(state[2]), .Y(n9) );
  INVX2 U13 ( .A(state[1]), .Y(n10) );
endmodule


module controller ( clk, n_rst, dr, lc, overflow, cnt_up, clear, modwait, op, 
        src1, src2, dest, err, processed );
  output [2:0] op;
  output [3:0] src1;
  output [3:0] src2;
  output [3:0] dest;
  input clk, n_rst, dr, lc, overflow;
  output cnt_up, clear, modwait, err, processed;
  wire   n143, next_modwait, next_processed, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n23, n24, n25, n26, n27, n28, n29,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140;
  wire   [4:0] curstate;
  wire   [4:0] nexstate;
  tri   [2:0] op;

  DFFSR \curstate_reg[0]  ( .D(nexstate[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(curstate[0]) );
  DFFSR \curstate_reg[4]  ( .D(nexstate[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(curstate[4]) );
  DFFSR \curstate_reg[1]  ( .D(nexstate[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(curstate[1]) );
  DFFSR \curstate_reg[2]  ( .D(nexstate[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(curstate[2]) );
  DFFSR \curstate_reg[3]  ( .D(nexstate[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(curstate[3]) );
  DFFSR processed_reg ( .D(next_processed), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(processed) );
  DFFSR modwait_reg ( .D(next_modwait), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        modwait) );
  INVX4 U10 ( .A(n37), .Y(n38) );
  INVX2 U11 ( .A(n23), .Y(src2[2]) );
  INVX2 U12 ( .A(n100), .Y(n36) );
  AND2X2 U13 ( .A(n120), .B(n119), .Y(n8) );
  INVX2 U14 ( .A(n32), .Y(n50) );
  INVX1 U15 ( .A(n36), .Y(n9) );
  INVX1 U16 ( .A(n125), .Y(n10) );
  INVX2 U17 ( .A(n10), .Y(n11) );
  INVX1 U18 ( .A(n57), .Y(n12) );
  INVX1 U19 ( .A(n57), .Y(n81) );
  INVX2 U20 ( .A(n76), .Y(n13) );
  BUFX2 U21 ( .A(n136), .Y(n14) );
  INVX1 U22 ( .A(curstate[4]), .Y(n39) );
  INVX1 U23 ( .A(n74), .Y(n15) );
  INVX1 U24 ( .A(n43), .Y(n16) );
  AND2X2 U25 ( .A(n31), .B(n32), .Y(n29) );
  AND2X2 U26 ( .A(n29), .B(n37), .Y(n27) );
  AND2X2 U27 ( .A(n29), .B(n37), .Y(n17) );
  INVX4 U28 ( .A(n31), .Y(n43) );
  INVX2 U29 ( .A(n71), .Y(n18) );
  AND2X2 U30 ( .A(n119), .B(n130), .Y(n19) );
  INVX4 U31 ( .A(n19), .Y(src1[2]) );
  BUFX2 U32 ( .A(n126), .Y(n20) );
  NAND2X1 U33 ( .A(n121), .B(n8), .Y(src2[0]) );
  BUFX2 U34 ( .A(curstate[4]), .Y(n21) );
  AND2X1 U35 ( .A(n83), .B(n110), .Y(n26) );
  INVX1 U36 ( .A(n122), .Y(src2[1]) );
  AND2X2 U37 ( .A(n119), .B(n122), .Y(n23) );
  AND2X2 U38 ( .A(n90), .B(n89), .Y(n24) );
  AND2X2 U39 ( .A(n29), .B(n38), .Y(n25) );
  AND2X2 U40 ( .A(n126), .B(n83), .Y(n28) );
  INVX2 U41 ( .A(curstate[3]), .Y(n37) );
  AND2X1 U42 ( .A(n20), .B(n11), .Y(n129) );
  BUFX4 U43 ( .A(curstate[2]), .Y(n31) );
  BUFX4 U44 ( .A(curstate[1]), .Y(n32) );
  BUFX2 U45 ( .A(overflow), .Y(n33) );
  BUFX2 U46 ( .A(n95), .Y(n34) );
  INVX2 U47 ( .A(n44), .Y(n95) );
  AND2X2 U48 ( .A(n25), .B(n12), .Y(n35) );
  INVX1 U49 ( .A(n35), .Y(n125) );
  INVX1 U50 ( .A(src2[0]), .Y(n137) );
  NAND2X1 U51 ( .A(n88), .B(n24), .Y(nexstate[0]) );
  INVX1 U52 ( .A(src1[0]), .Y(n78) );
  INVX1 U53 ( .A(n120), .Y(n76) );
  NAND2X1 U54 ( .A(curstate[0]), .B(n39), .Y(n57) );
  NAND3X1 U55 ( .A(n43), .B(n37), .C(n50), .Y(n103) );
  INVX2 U56 ( .A(curstate[0]), .Y(n47) );
  NAND2X1 U57 ( .A(n47), .B(n39), .Y(n99) );
  INVX2 U58 ( .A(n99), .Y(n102) );
  NAND3X1 U59 ( .A(n32), .B(n43), .C(n37), .Y(n40) );
  INVX2 U60 ( .A(n40), .Y(n72) );
  NAND2X1 U61 ( .A(n102), .B(n72), .Y(n92) );
  OAI21X1 U62 ( .A(n57), .B(n18), .C(n92), .Y(err) );
  NAND2X1 U63 ( .A(n17), .B(n81), .Y(n42) );
  INVX2 U64 ( .A(n103), .Y(n71) );
  INVX2 U65 ( .A(lc), .Y(n63) );
  INVX2 U66 ( .A(dr), .Y(n93) );
  NAND2X1 U67 ( .A(n63), .B(n93), .Y(n84) );
  NAND3X1 U68 ( .A(n71), .B(n102), .C(n84), .Y(n41) );
  OAI21X1 U69 ( .A(lc), .B(n42), .C(n41), .Y(n79) );
  NOR2X1 U70 ( .A(err), .B(n79), .Y(n55) );
  NAND3X1 U71 ( .A(n38), .B(n43), .C(n50), .Y(n44) );
  NAND2X1 U72 ( .A(n21), .B(curstate[0]), .Y(n56) );
  INVX2 U73 ( .A(n56), .Y(n73) );
  NAND2X1 U74 ( .A(n95), .B(n73), .Y(n110) );
  NAND2X1 U75 ( .A(n17), .B(n102), .Y(n116) );
  NAND2X1 U76 ( .A(n25), .B(n102), .Y(n123) );
  NOR2X1 U77 ( .A(n32), .B(n57), .Y(n45) );
  NAND3X1 U78 ( .A(n16), .B(n38), .C(n45), .Y(n135) );
  NAND3X1 U79 ( .A(n116), .B(n123), .C(n135), .Y(n127) );
  INVX2 U80 ( .A(n127), .Y(n46) );
  OAI21X1 U81 ( .A(overflow), .B(n110), .C(n46), .Y(n97) );
  NAND2X1 U82 ( .A(n34), .B(n81), .Y(n91) );
  NAND2X1 U83 ( .A(n21), .B(n47), .Y(n48) );
  INVX2 U84 ( .A(n48), .Y(n70) );
  NAND2X1 U85 ( .A(n70), .B(n72), .Y(n119) );
  OAI21X1 U86 ( .A(n63), .B(n91), .C(n119), .Y(n62) );
  NOR2X1 U87 ( .A(n97), .B(n62), .Y(n54) );
  NAND2X1 U88 ( .A(n17), .B(n70), .Y(n49) );
  NAND2X1 U89 ( .A(n71), .B(n73), .Y(n124) );
  OAI21X1 U90 ( .A(n33), .B(n49), .C(n124), .Y(n52) );
  NAND3X1 U91 ( .A(n50), .B(n37), .C(n31), .Y(n100) );
  NAND2X1 U92 ( .A(n36), .B(n70), .Y(n120) );
  NAND2X1 U93 ( .A(n72), .B(n81), .Y(n131) );
  NAND2X1 U94 ( .A(n13), .B(n131), .Y(n51) );
  NOR2X1 U95 ( .A(n51), .B(n52), .Y(n53) );
  NAND3X1 U96 ( .A(n55), .B(n54), .C(n53), .Y(nexstate[1]) );
  NAND2X1 U97 ( .A(n70), .B(n95), .Y(n83) );
  OAI21X1 U98 ( .A(overflow), .B(n56), .C(n57), .Y(n60) );
  NOR2X1 U99 ( .A(n16), .B(n57), .Y(n58) );
  NAND3X1 U100 ( .A(n38), .B(n32), .C(n58), .Y(n59) );
  INVX2 U101 ( .A(n59), .Y(n82) );
  NAND2X1 U102 ( .A(dr), .B(n82), .Y(n115) );
  INVX2 U103 ( .A(n115), .Y(cnt_up) );
  AOI21X1 U104 ( .A(n17), .B(n60), .C(cnt_up), .Y(n61) );
  OAI21X1 U105 ( .A(n33), .B(n83), .C(n61), .Y(n69) );
  INVX2 U106 ( .A(n62), .Y(n67) );
  NOR2X1 U107 ( .A(n99), .B(n63), .Y(n64) );
  INVX2 U108 ( .A(n131), .Y(clear) );
  AOI21X1 U109 ( .A(n64), .B(n34), .C(clear), .Y(n65) );
  NAND3X1 U110 ( .A(n13), .B(n123), .C(n65), .Y(n80) );
  INVX2 U111 ( .A(n80), .Y(n66) );
  NAND3X1 U112 ( .A(n67), .B(n66), .C(n135), .Y(n68) );
  OR2X1 U113 ( .A(n69), .B(n68), .Y(nexstate[2]) );
  NAND2X1 U114 ( .A(n71), .B(n70), .Y(n130) );
  NAND2X1 U115 ( .A(n36), .B(n73), .Y(n136) );
  NAND2X1 U116 ( .A(n73), .B(n72), .Y(n134) );
  INVX2 U117 ( .A(n134), .Y(n74) );
  NOR2X1 U118 ( .A(n35), .B(n74), .Y(n75) );
  NAND3X1 U119 ( .A(n124), .B(n136), .C(n75), .Y(src1[0]) );
  NAND2X1 U120 ( .A(n27), .B(n21), .Y(n126) );
  NAND2X1 U121 ( .A(n28), .B(n110), .Y(n118) );
  INVX2 U122 ( .A(overflow), .Y(n111) );
  AOI21X1 U123 ( .A(n118), .B(n111), .C(n76), .Y(n77) );
  NAND3X1 U124 ( .A(n19), .B(n78), .C(n77), .Y(nexstate[4]) );
  NOR2X1 U125 ( .A(n80), .B(n79), .Y(n90) );
  NAND2X1 U126 ( .A(n36), .B(n81), .Y(n98) );
  NAND3X1 U127 ( .A(n98), .B(n130), .C(n136), .Y(n112) );
  NOR2X1 U128 ( .A(n82), .B(n112), .Y(n89) );
  OAI21X1 U129 ( .A(lc), .B(n91), .C(n20), .Y(n87) );
  INVX2 U130 ( .A(n84), .Y(n85) );
  OAI22X1 U131 ( .A(n111), .B(n26), .C(n85), .D(n92), .Y(n86) );
  NOR2X1 U132 ( .A(n87), .B(n86), .Y(n88) );
  OAI21X1 U133 ( .A(n93), .B(n92), .C(n91), .Y(n94) );
  AOI21X1 U134 ( .A(n102), .B(n34), .C(n94), .Y(n96) );
  OAI21X1 U135 ( .A(lc), .B(n96), .C(n15), .Y(n109) );
  INVX2 U136 ( .A(n97), .Y(n107) );
  OAI21X1 U137 ( .A(n9), .B(n99), .C(n98), .Y(n101) );
  INVX2 U138 ( .A(n101), .Y(n133) );
  AND2X2 U139 ( .A(n102), .B(dr), .Y(n106) );
  NOR2X1 U140 ( .A(lc), .B(n18), .Y(n105) );
  NAND2X1 U141 ( .A(n14), .B(n115), .Y(n104) );
  AOI21X1 U142 ( .A(n106), .B(n105), .C(n104), .Y(n140) );
  NAND3X1 U143 ( .A(n107), .B(n133), .C(n140), .Y(n108) );
  OR2X1 U144 ( .A(n109), .B(n108), .Y(nexstate[3]) );
  OAI21X1 U145 ( .A(n28), .B(n111), .C(n110), .Y(next_processed) );
  NAND2X1 U146 ( .A(n134), .B(n120), .Y(n143) );
  INVX2 U147 ( .A(n143), .Y(n122) );
  AND2X2 U148 ( .A(n123), .B(n115), .Y(n114) );
  NOR2X1 U149 ( .A(src2[2]), .B(n112), .Y(n113) );
  NAND3X1 U150 ( .A(n131), .B(n114), .C(n113), .Y(dest[0]) );
  NAND3X1 U151 ( .A(n133), .B(n130), .C(n11), .Y(dest[1]) );
  NAND3X1 U152 ( .A(n133), .B(n131), .C(n124), .Y(dest[2]) );
  AND2X2 U153 ( .A(n116), .B(n115), .Y(n117) );
  NAND3X1 U154 ( .A(n117), .B(n23), .C(n136), .Y(dest[3]) );
  INVX2 U155 ( .A(n118), .Y(n121) );
  NAND2X1 U156 ( .A(n136), .B(n121), .Y(src2[3]) );
  NAND3X1 U157 ( .A(n123), .B(n125), .C(n122), .Y(src1[1]) );
  INVX2 U158 ( .A(n124), .Y(src1[3]) );
  NOR2X1 U159 ( .A(dest[2]), .B(n127), .Y(n128) );
  NAND3X1 U160 ( .A(n130), .B(n129), .C(n128), .Y(op[0]) );
  INVX2 U161 ( .A(dest[3]), .Y(n132) );
  NAND3X1 U162 ( .A(n133), .B(n132), .C(n131), .Y(op[1]) );
  AND2X2 U163 ( .A(n135), .B(n15), .Y(n138) );
  NAND3X1 U164 ( .A(n138), .B(n137), .C(n14), .Y(op[2]) );
  NOR2X1 U165 ( .A(op[0]), .B(src2[2]), .Y(n139) );
  NAND3X1 U166 ( .A(n26), .B(n140), .C(n139), .Y(next_modwait) );
endmodule


module flex_counter_NUM_CNT_BITS10_DW01_inc_0 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module flex_counter_NUM_CNT_BITS10 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [9:0] rollover_val;
  output [9:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n1, n2, n3, n4, n5, n6, n7, n8, n20, n21, n22, n23;
  wire   [9:0] next_count;

  DFFSR \count_out_reg[0]  ( .D(next_count[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(next_count[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(next_count[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(next_count[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(next_count[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[4]) );
  DFFSR \count_out_reg[5]  ( .D(next_count[5]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[5]) );
  DFFSR \count_out_reg[6]  ( .D(next_count[6]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[6]) );
  DFFSR \count_out_reg[7]  ( .D(next_count[7]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[7]) );
  DFFSR \count_out_reg[8]  ( .D(next_count[8]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[8]) );
  DFFSR \count_out_reg[9]  ( .D(next_count[9]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[9]) );
  DFFSR rollover_flag_reg ( .D(N17), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  NOR2X1 U26 ( .A(n32), .B(n33), .Y(N17) );
  NAND3X1 U27 ( .A(n34), .B(n35), .C(n36), .Y(n33) );
  NOR2X1 U28 ( .A(n37), .B(n38), .Y(n36) );
  XOR2X1 U29 ( .A(next_count[0]), .B(rollover_val[0]), .Y(n38) );
  OAI21X1 U30 ( .A(clear), .B(n39), .C(n40), .Y(next_count[0]) );
  AOI22X1 U31 ( .A(count_out[0]), .B(n41), .C(N7), .D(n1), .Y(n40) );
  XOR2X1 U32 ( .A(rollover_val[1]), .B(next_count[1]), .Y(n37) );
  OAI21X1 U33 ( .A(n23), .B(n2), .C(n42), .Y(next_count[1]) );
  NAND2X1 U34 ( .A(N8), .B(n1), .Y(n42) );
  XNOR2X1 U35 ( .A(rollover_val[2]), .B(next_count[2]), .Y(n35) );
  OAI21X1 U36 ( .A(n23), .B(n3), .C(n43), .Y(next_count[2]) );
  NAND2X1 U37 ( .A(N9), .B(n1), .Y(n43) );
  NOR2X1 U38 ( .A(n44), .B(n45), .Y(n34) );
  XOR2X1 U39 ( .A(rollover_val[5]), .B(next_count[5]), .Y(n45) );
  OAI21X1 U40 ( .A(n23), .B(n6), .C(n46), .Y(next_count[5]) );
  NAND2X1 U41 ( .A(N12), .B(n1), .Y(n46) );
  XOR2X1 U42 ( .A(rollover_val[4]), .B(next_count[4]), .Y(n44) );
  OAI21X1 U43 ( .A(n23), .B(n5), .C(n47), .Y(next_count[4]) );
  NAND2X1 U44 ( .A(N11), .B(n1), .Y(n47) );
  NAND3X1 U45 ( .A(n48), .B(n49), .C(n50), .Y(n32) );
  NOR2X1 U46 ( .A(n51), .B(n52), .Y(n50) );
  XOR2X1 U47 ( .A(rollover_val[6]), .B(next_count[6]), .Y(n52) );
  OAI21X1 U48 ( .A(n23), .B(n7), .C(n53), .Y(next_count[6]) );
  NAND2X1 U49 ( .A(N13), .B(n1), .Y(n53) );
  XOR2X1 U50 ( .A(rollover_val[9]), .B(next_count[9]), .Y(n51) );
  OAI21X1 U51 ( .A(n23), .B(n21), .C(n54), .Y(next_count[9]) );
  NAND2X1 U52 ( .A(N16), .B(n1), .Y(n54) );
  XNOR2X1 U53 ( .A(rollover_val[3]), .B(next_count[3]), .Y(n49) );
  OAI21X1 U54 ( .A(n23), .B(n4), .C(n55), .Y(next_count[3]) );
  NAND2X1 U55 ( .A(N10), .B(n1), .Y(n55) );
  NOR2X1 U56 ( .A(n56), .B(n57), .Y(n48) );
  XOR2X1 U57 ( .A(rollover_val[8]), .B(next_count[8]), .Y(n57) );
  OAI21X1 U58 ( .A(n23), .B(n20), .C(n58), .Y(next_count[8]) );
  NAND2X1 U59 ( .A(N15), .B(n1), .Y(n58) );
  XOR2X1 U60 ( .A(rollover_val[7]), .B(next_count[7]), .Y(n56) );
  OAI21X1 U61 ( .A(n23), .B(n8), .C(n59), .Y(next_count[7]) );
  NAND2X1 U62 ( .A(N14), .B(n1), .Y(n59) );
  NAND3X1 U63 ( .A(n39), .B(n22), .C(count_enable), .Y(n60) );
  NAND3X1 U64 ( .A(n61), .B(n62), .C(n63), .Y(n39) );
  NOR2X1 U65 ( .A(n64), .B(n65), .Y(n63) );
  NAND3X1 U66 ( .A(n66), .B(n67), .C(n68), .Y(n65) );
  XOR2X1 U67 ( .A(n21), .B(rollover_val[9]), .Y(n68) );
  XOR2X1 U68 ( .A(n7), .B(rollover_val[6]), .Y(n67) );
  XOR2X1 U69 ( .A(n8), .B(rollover_val[7]), .Y(n66) );
  NAND3X1 U70 ( .A(n69), .B(count_enable), .C(n70), .Y(n64) );
  XOR2X1 U71 ( .A(n4), .B(rollover_val[3]), .Y(n70) );
  XOR2X1 U72 ( .A(n20), .B(rollover_val[8]), .Y(n69) );
  NOR2X1 U73 ( .A(n71), .B(n72), .Y(n62) );
  NAND2X1 U74 ( .A(n73), .B(n74), .Y(n72) );
  XOR2X1 U75 ( .A(n5), .B(rollover_val[4]), .Y(n74) );
  XOR2X1 U76 ( .A(n6), .B(rollover_val[5]), .Y(n73) );
  XOR2X1 U77 ( .A(rollover_val[2]), .B(count_out[2]), .Y(n71) );
  NOR2X1 U78 ( .A(n75), .B(n76), .Y(n61) );
  XOR2X1 U79 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n76) );
  XOR2X1 U80 ( .A(rollover_val[1]), .B(count_out[1]), .Y(n75) );
  NOR2X1 U81 ( .A(clear), .B(count_enable), .Y(n41) );
  flex_counter_NUM_CNT_BITS10_DW01_inc_0 add_51 ( .A(count_out), .SUM({N16, 
        N15, N14, N13, N12, N11, N10, N9, N8, N7}) );
  INVX2 U14 ( .A(n41), .Y(n23) );
  INVX2 U15 ( .A(n60), .Y(n1) );
  INVX2 U16 ( .A(count_out[1]), .Y(n2) );
  INVX2 U17 ( .A(count_out[2]), .Y(n3) );
  INVX2 U18 ( .A(count_out[3]), .Y(n4) );
  INVX2 U19 ( .A(count_out[4]), .Y(n5) );
  INVX2 U20 ( .A(count_out[5]), .Y(n6) );
  INVX2 U21 ( .A(count_out[6]), .Y(n7) );
  INVX2 U22 ( .A(count_out[7]), .Y(n8) );
  INVX2 U23 ( .A(count_out[8]), .Y(n20) );
  INVX2 U24 ( .A(count_out[9]), .Y(n21) );
  INVX2 U25 ( .A(clear), .Y(n22) );
endmodule


module counter ( clk, n_rst, cnt_up, clear, one_k_samples );
  input clk, n_rst, cnt_up, clear;
  output one_k_samples;


  flex_counter_NUM_CNT_BITS10 A1 ( .clk(clk), .n_rst(n_rst), .clear(clear), 
        .count_enable(cnt_up), .rollover_val({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 
        1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .rollover_flag(one_k_samples) );
endmodule


module alu_DW_mult_uns_1 ( a, b, product );
  input [30:0] a;
  input [15:0] b;
  output [46:0] product;
  wire   n1, n6, n7, n9, n13, n16, n19, n25, n28, n31, n34, n37, n46, n49, n51,
         n52, n53, n54, n55, n56, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n69, n70, n71, n72, n73, n75, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n87, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n101, n103, n104, n106, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n188, n189, n190, n191, n196, n197, n198,
         n199, n204, n205, n206, n207, n215, n217, n219, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268,
         n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
         n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290,
         n291, n292, n293, n294, n295, n296, n297, n298, n299, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456,
         n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467,
         n468, n469, n470, n471, n472, n473, n474, n475, n476, n477, n478,
         n479, n480, n481, n482, n485, n486, n488, n489, n491, n492, n494,
         n495, n497, n500, n503, n505, n506, n507, n508, n509, n510, n511,
         n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, n522,
         n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534,
         n535, n536, n537, n538, n539, n540, n541, n542, n543, n544, n545,
         n546, n547, n548, n549, n550, n551, n552, n553, n554, n555, n556,
         n557, n558, n559, n560, n561, n562, n563, n564, n565, n566, n567,
         n568, n569, n570, n571, n572, n573, n574, n575, n576, n577, n578,
         n579, n580, n581, n582, n583, n584, n585, n586, n587, n588, n589,
         n590, n591, n592, n593, n594, n595, n596, n597, n598, n599, n600,
         n601, n602, n603, n604, n605, n606, n607, n608, n609, n610, n611,
         n612, n613, n614, n615, n616, n617, n618, n619, n620, n621, n622,
         n623, n624, n625, n626, n627, n628, n629, n630, n631, n632, n633,
         n634, n635, n636, n637, n638, n639, n640, n641, n642, n643, n644,
         n645, n646, n647, n648, n649, n650, n651, n652, n653, n654, n655,
         n656, n657, n658, n659, n660, n661, n662, n663, n664, n665, n681,
         n682, n683, n684, n685, n686, n687, n688, n689, n690, n691, n692,
         n693, n694, n695, n696, n697, n698, n699, n700, n701, n702, n703,
         n704, n705, n706, n707, n708, n709, n710, n711, n712, n713, n714,
         n715, n716, n717, n718, n719, n720, n721, n722, n723, n724, n725,
         n726, n727, n728, n729, n730, n731, n732, n733, n734, n735, n736,
         n737, n738, n739, n740, n741, n742, n743, n744, n745, n746, n747,
         n748, n749, n750, n751, n752, n753, n754, n755, n756, n757, n758,
         n759, n760, n761, n762, n763, n764, n765, n766, n767, n768, n769,
         n770, n771, n772, n773, n774, n775, n776, n777, n778, n779, n780,
         n781, n782, n783, n784, n785, n786, n787, n788, n789, n790, n791,
         n792, n793, n794, n795, n796, n797, n798, n799, n800, n801, n802,
         n803, n804, n805, n806, n807, n808, n809, n810, n811, n812, n813,
         n814, n815, n816, n817, n818, n819, n820, n821, n822, n823, n824,
         n825, n826, n827, n828, n829, n830, n831, n833, n834, n835, n836,
         n837, n838, n839, n840, n857, n858, n935, n936, n937, n938, n939,
         n940, n941, n942, n943, n944, n945, n946, n947, n948, n949, n950,
         n951, n952, n953, n954, n955, n956, n957, n958, n959, n960, n961,
         n962, n963, n964, n965, n966, n967, n968, n969, n970, n971, n972,
         n973, n974, n975, n976, n977, n978, n979, n980, n981, n982, n983,
         n984, n985, n986, n987, n988, n989, n990, n991, n992, n993, n994,
         n995, n996, n997, n998, n999, n1000, n1001, n1002, n1003, n1004,
         n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012, n1013, n1014,
         n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022, n1023, n1024,
         n1025, n1026, n1027, n1028, n1029, n1030, n1031, n1032, n1033, n1034,
         n1035, n1036, n1037, n1038, n1039, n1040, n1041, n1042, n1043, n1044,
         n1045, n1046, n1047, n1048, n1049, n1050, n1051, n1052, n1053, n1054,
         n1055, n1056, n1057, n1058, n1059, n1060, n1061, n1062, n1063, n1064,
         n1065, n1066, n1067, n1068, n1069, n1070, n1071, n1072, n1073, n1074,
         n1075, n1076, n1077, n1078, n1079, n1080, n1081, n1082, n1083, n1084,
         n1085, n1086, n1087, n1088, n1089, n1090, n1091, n1092, n1093, n1094,
         n1095, n1096, n1097, n1098, n1099, n1100, n1101, n1102, n1103, n1104,
         n1105, n1106, n1107, n1108, n1109, n1110, n1111, n1112, n1113, n1114,
         n1115, n1116, n1117, n1118, n1119, n1120, n1121, n1122, n1123, n1124,
         n1125, n1126, n1127, n1128, n1129, n1130;
  assign n1 = a[16];
  assign n7 = a[18];
  assign n13 = a[20];
  assign n19 = a[22];
  assign n25 = a[24];
  assign n31 = a[26];
  assign n37 = a[28];
  assign n49 = b[0];
  assign n481 = a[30];
  assign n817 = b[15];
  assign n818 = b[14];
  assign n819 = b[13];
  assign n820 = b[12];
  assign n821 = b[11];
  assign n822 = b[10];
  assign n823 = b[9];
  assign n824 = b[8];
  assign n825 = b[7];
  assign n826 = b[6];
  assign n827 = b[5];
  assign n828 = b[4];
  assign n829 = b[3];
  assign n830 = b[2];
  assign n831 = b[1];

  XNOR2X1 U51 ( .A(n70), .B(n51), .Y(product[46]) );
  NAND2X1 U52 ( .A(n69), .B(n952), .Y(n51) );
  NAND2X1 U55 ( .A(n232), .B(n233), .Y(n69) );
  XOR2X1 U56 ( .A(n73), .B(n52), .Y(product[45]) );
  OAI21X1 U57 ( .A(n73), .B(n71), .C(n72), .Y(n70) );
  NAND2X1 U58 ( .A(n72), .B(n215), .Y(n52) );
  NOR2X1 U60 ( .A(n234), .B(n237), .Y(n71) );
  NAND2X1 U61 ( .A(n234), .B(n237), .Y(n72) );
  XNOR2X1 U62 ( .A(n975), .B(n53), .Y(product[44]) );
  AOI21X1 U63 ( .A(n951), .B(n78), .C(n75), .Y(n73) );
  NAND2X1 U66 ( .A(n77), .B(n951), .Y(n53) );
  NAND2X1 U69 ( .A(n238), .B(n241), .Y(n77) );
  XOR2X1 U70 ( .A(n81), .B(n54), .Y(product[43]) );
  OAI21X1 U71 ( .A(n81), .B(n79), .C(n80), .Y(n78) );
  NAND2X1 U72 ( .A(n80), .B(n217), .Y(n54) );
  NOR2X1 U74 ( .A(n242), .B(n247), .Y(n79) );
  NAND2X1 U75 ( .A(n242), .B(n247), .Y(n80) );
  XOR2X1 U76 ( .A(n90), .B(n55), .Y(product[42]) );
  AOI21X1 U77 ( .A(n132), .B(n82), .C(n83), .Y(n81) );
  NOR2X1 U78 ( .A(n84), .B(n110), .Y(n82) );
  OAI21X1 U79 ( .A(n84), .B(n111), .C(n85), .Y(n83) );
  NAND2X1 U80 ( .A(n950), .B(n91), .Y(n84) );
  AOI21X1 U81 ( .A(n950), .B(n92), .C(n87), .Y(n85) );
  NAND2X1 U84 ( .A(n89), .B(n950), .Y(n55) );
  NAND2X1 U87 ( .A(n248), .B(n253), .Y(n89) );
  XOR2X1 U88 ( .A(n95), .B(n56), .Y(product[41]) );
  AOI21X1 U89 ( .A(n91), .B(n109), .C(n92), .Y(n90) );
  NOR2X1 U90 ( .A(n93), .B(n98), .Y(n91) );
  OAI21X1 U91 ( .A(n99), .B(n93), .C(n94), .Y(n92) );
  NAND2X1 U92 ( .A(n94), .B(n219), .Y(n56) );
  NOR2X1 U94 ( .A(n254), .B(n261), .Y(n93) );
  NAND2X1 U95 ( .A(n254), .B(n261), .Y(n94) );
  AOI21X1 U97 ( .A(n96), .B(n109), .C(n97), .Y(n95) );
  NAND2X1 U100 ( .A(n1018), .B(n949), .Y(n98) );
  AOI21X1 U101 ( .A(n106), .B(n1018), .C(n101), .Y(n99) );
  NAND2X1 U107 ( .A(n262), .B(n269), .Y(n103) );
  XNOR2X1 U108 ( .A(n943), .B(n58), .Y(product[39]) );
  AOI21X1 U109 ( .A(n949), .B(n109), .C(n106), .Y(n104) );
  NAND2X1 U112 ( .A(n108), .B(n949), .Y(n58) );
  NAND2X1 U115 ( .A(n279), .B(n270), .Y(n108) );
  XOR2X1 U116 ( .A(n116), .B(n59), .Y(product[38]) );
  OAI21X1 U117 ( .A(n131), .B(n110), .C(n111), .Y(n109) );
  NAND2X1 U118 ( .A(n112), .B(n124), .Y(n110) );
  AOI21X1 U119 ( .A(n125), .B(n112), .C(n113), .Y(n111) );
  NOR2X1 U120 ( .A(n114), .B(n119), .Y(n112) );
  OAI21X1 U121 ( .A(n114), .B(n120), .C(n115), .Y(n113) );
  NAND2X1 U122 ( .A(n115), .B(n222), .Y(n59) );
  NOR2X1 U124 ( .A(n280), .B(n289), .Y(n114) );
  NAND2X1 U125 ( .A(n280), .B(n289), .Y(n115) );
  XNOR2X1 U126 ( .A(n121), .B(n60), .Y(product[37]) );
  AOI21X1 U127 ( .A(n223), .B(n121), .C(n118), .Y(n116) );
  NAND2X1 U130 ( .A(n120), .B(n223), .Y(n60) );
  NOR2X1 U132 ( .A(n290), .B(n301), .Y(n119) );
  NAND2X1 U133 ( .A(n290), .B(n301), .Y(n120) );
  XNOR2X1 U134 ( .A(n128), .B(n61), .Y(product[36]) );
  OAI21X1 U135 ( .A(n131), .B(n122), .C(n123), .Y(n121) );
  NOR2X1 U138 ( .A(n126), .B(n129), .Y(n124) );
  OAI21X1 U139 ( .A(n126), .B(n130), .C(n127), .Y(n125) );
  NAND2X1 U140 ( .A(n127), .B(n224), .Y(n61) );
  NOR2X1 U142 ( .A(n313), .B(n302), .Y(n126) );
  NAND2X1 U143 ( .A(n313), .B(n302), .Y(n127) );
  XOR2X1 U144 ( .A(n131), .B(n62), .Y(product[35]) );
  OAI21X1 U145 ( .A(n131), .B(n129), .C(n130), .Y(n128) );
  NAND2X1 U146 ( .A(n130), .B(n225), .Y(n62) );
  NOR2X1 U148 ( .A(n327), .B(n314), .Y(n129) );
  NAND2X1 U149 ( .A(n327), .B(n314), .Y(n130) );
  XNOR2X1 U150 ( .A(n139), .B(n63), .Y(product[34]) );
  OAI21X1 U152 ( .A(n133), .B(n153), .C(n134), .Y(n132) );
  NAND2X1 U153 ( .A(n135), .B(n143), .Y(n133) );
  AOI21X1 U154 ( .A(n144), .B(n135), .C(n136), .Y(n134) );
  NOR2X1 U155 ( .A(n140), .B(n137), .Y(n135) );
  OAI21X1 U156 ( .A(n958), .B(n141), .C(n138), .Y(n136) );
  NAND2X1 U157 ( .A(n138), .B(n226), .Y(n63) );
  NOR2X1 U159 ( .A(n341), .B(n328), .Y(n137) );
  NAND2X1 U160 ( .A(n341), .B(n328), .Y(n138) );
  XOR2X1 U161 ( .A(n142), .B(n64), .Y(product[33]) );
  OAI21X1 U162 ( .A(n142), .B(n140), .C(n141), .Y(n139) );
  NAND2X1 U163 ( .A(n141), .B(n227), .Y(n64) );
  NOR2X1 U165 ( .A(n355), .B(n342), .Y(n140) );
  NAND2X1 U166 ( .A(n355), .B(n342), .Y(n141) );
  XOR2X1 U167 ( .A(n147), .B(n65), .Y(product[32]) );
  AOI21X1 U168 ( .A(n143), .B(n152), .C(n144), .Y(n142) );
  NOR2X1 U169 ( .A(n150), .B(n973), .Y(n143) );
  OAI21X1 U170 ( .A(n145), .B(n151), .C(n146), .Y(n144) );
  NAND2X1 U171 ( .A(n146), .B(n228), .Y(n65) );
  NOR2X1 U173 ( .A(n369), .B(n356), .Y(n145) );
  NAND2X1 U174 ( .A(n369), .B(n356), .Y(n146) );
  XNOR2X1 U175 ( .A(n152), .B(n66), .Y(product[31]) );
  AOI21X1 U176 ( .A(n229), .B(n152), .C(n149), .Y(n147) );
  NAND2X1 U179 ( .A(n151), .B(n229), .Y(n66) );
  NOR2X1 U181 ( .A(n383), .B(n370), .Y(n150) );
  NAND2X1 U182 ( .A(n383), .B(n370), .Y(n151) );
  XNOR2X1 U183 ( .A(n158), .B(n67), .Y(product[30]) );
  AOI21X1 U185 ( .A(n162), .B(n154), .C(n155), .Y(n153) );
  NOR2X1 U186 ( .A(n159), .B(n967), .Y(n154) );
  OAI21X1 U187 ( .A(n156), .B(n160), .C(n157), .Y(n155) );
  NAND2X1 U188 ( .A(n157), .B(n230), .Y(n67) );
  NOR2X1 U190 ( .A(n397), .B(n384), .Y(n156) );
  NAND2X1 U191 ( .A(n397), .B(n384), .Y(n157) );
  OAI21X1 U192 ( .A(n161), .B(n159), .C(n160), .Y(n158) );
  NOR2X1 U193 ( .A(n409), .B(n398), .Y(n159) );
  NAND2X1 U194 ( .A(n409), .B(n398), .Y(n160) );
  OAI21X1 U196 ( .A(n163), .B(n173), .C(n164), .Y(n162) );
  NAND2X1 U197 ( .A(n1021), .B(n1019), .Y(n163) );
  AOI21X1 U198 ( .A(n1020), .B(n1019), .C(n1022), .Y(n164) );
  AOI21X1 U207 ( .A(n180), .B(n174), .C(n175), .Y(n173) );
  NOR2X1 U208 ( .A(n178), .B(n176), .Y(n174) );
  OAI21X1 U209 ( .A(n176), .B(n179), .C(n177), .Y(n175) );
  NOR2X1 U210 ( .A(n441), .B(n432), .Y(n176) );
  NAND2X1 U211 ( .A(n441), .B(n432), .Y(n177) );
  NOR2X1 U212 ( .A(n449), .B(n442), .Y(n178) );
  NAND2X1 U213 ( .A(n449), .B(n442), .Y(n179) );
  OAI21X1 U214 ( .A(n183), .B(n181), .C(n182), .Y(n180) );
  NOR2X1 U215 ( .A(n457), .B(n450), .Y(n181) );
  NAND2X1 U216 ( .A(n457), .B(n450), .Y(n182) );
  AOI21X1 U217 ( .A(n1023), .B(n188), .C(n1024), .Y(n183) );
  OAI21X1 U222 ( .A(n191), .B(n189), .C(n190), .Y(n188) );
  NOR2X1 U223 ( .A(n469), .B(n464), .Y(n189) );
  NAND2X1 U224 ( .A(n469), .B(n464), .Y(n190) );
  AOI21X1 U225 ( .A(n196), .B(n1025), .C(n1026), .Y(n191) );
  OAI21X1 U230 ( .A(n197), .B(n199), .C(n198), .Y(n196) );
  NOR2X1 U231 ( .A(n477), .B(n474), .Y(n197) );
  NAND2X1 U232 ( .A(n477), .B(n474), .Y(n198) );
  AOI21X1 U233 ( .A(n204), .B(n1015), .C(n1017), .Y(n199) );
  OAI21X1 U238 ( .A(n205), .B(n207), .C(n206), .Y(n204) );
  NOR2X1 U239 ( .A(n511), .B(n480), .Y(n205) );
  NAND2X1 U240 ( .A(n511), .B(n480), .Y(n206) );
  AOI21X1 U241 ( .A(n1027), .B(n1014), .C(n1016), .Y(n207) );
  XOR2X1 U248 ( .A(n235), .B(n231), .Y(n232) );
  FAX1 U250 ( .A(n236), .B(n524), .C(n239), .YC(n233), .YS(n234) );
  FAX1 U252 ( .A(n541), .B(n240), .C(n243), .YC(n237), .YS(n238) );
  FAX1 U253 ( .A(n245), .B(n514), .C(n525), .YC(n239), .YS(n240) );
  FAX1 U254 ( .A(n251), .B(n244), .C(n249), .YC(n241), .YS(n242) );
  FAX1 U255 ( .A(n246), .B(n526), .C(n542), .YC(n243), .YS(n244) );
  FAX1 U257 ( .A(n257), .B(n255), .C(n250), .YC(n247), .YS(n248) );
  FAX1 U258 ( .A(n543), .B(n559), .C(n252), .YC(n249), .YS(n250) );
  FAX1 U259 ( .A(n259), .B(n515), .C(n527), .YC(n251), .YS(n252) );
  FAX1 U260 ( .A(n258), .B(n256), .C(n263), .YC(n253), .YS(n254) );
  FAX1 U261 ( .A(n544), .B(n267), .C(n265), .YC(n255), .YS(n256) );
  FAX1 U262 ( .A(n260), .B(n528), .C(n560), .YC(n257), .YS(n258) );
  FAX1 U264 ( .A(n273), .B(n264), .C(n271), .YC(n261), .YS(n262) );
  FAX1 U265 ( .A(n268), .B(n275), .C(n266), .YC(n263), .YS(n264) );
  FAX1 U266 ( .A(n545), .B(n561), .C(n577), .YC(n265), .YS(n266) );
  FAX1 U267 ( .A(n277), .B(n516), .C(n529), .YC(n267), .YS(n268) );
  FAX1 U268 ( .A(n283), .B(n272), .C(n281), .YC(n269), .YS(n270) );
  FAX1 U270 ( .A(n562), .B(n546), .C(n287), .YC(n273), .YS(n274) );
  FAX1 U271 ( .A(n278), .B(n530), .C(n578), .YC(n275), .YS(n276) );
  FAX1 U273 ( .A(n284), .B(n935), .C(n282), .YC(n279), .YS(n280) );
  FAX1 U274 ( .A(n295), .B(n286), .C(n293), .YC(n281), .YS(n282) );
  FAX1 U275 ( .A(n547), .B(n288), .C(n297), .YC(n283), .YS(n284) );
  FAX1 U276 ( .A(n563), .B(n579), .C(n595), .YC(n285), .YS(n286) );
  FAX1 U277 ( .A(n299), .B(n517), .C(n531), .YC(n287), .YS(n288) );
  FAX1 U278 ( .A(n294), .B(n292), .C(n303), .YC(n289), .YS(n290) );
  FAX1 U279 ( .A(n296), .B(n307), .C(n305), .YC(n291), .YS(n292) );
  FAX1 U280 ( .A(n311), .B(n309), .C(n298), .YC(n293), .YS(n294) );
  FAX1 U281 ( .A(n548), .B(n564), .C(n580), .YC(n295), .YS(n296) );
  FAX1 U282 ( .A(n1012), .B(n532), .C(n596), .YC(n297), .YS(n298) );
  FAX1 U284 ( .A(n306), .B(n1032), .C(n304), .YC(n301), .YS(n302) );
  FAX1 U285 ( .A(n319), .B(n308), .C(n317), .YC(n303), .YS(n304) );
  FAX1 U286 ( .A(n323), .B(n1035), .C(n310), .YC(n305), .YS(n306) );
  FAX1 U287 ( .A(n597), .B(n581), .C(n312), .YC(n307), .YS(n308) );
  FAX1 U288 ( .A(n565), .B(n549), .C(n613), .YC(n309), .YS(n310) );
  FAX1 U289 ( .A(n325), .B(n518), .C(n533), .YC(n311), .YS(n312) );
  FAX1 U290 ( .A(n318), .B(n329), .C(n316), .YC(n313), .YS(n314) );
  FAX1 U291 ( .A(n1044), .B(n333), .C(n331), .YC(n315), .YS(n316) );
  FAX1 U292 ( .A(n335), .B(n324), .C(n322), .YC(n317), .YS(n318) );
  FAX1 U293 ( .A(n566), .B(n339), .C(n337), .YC(n319), .YS(n320) );
  FAX1 U294 ( .A(n582), .B(n550), .C(n598), .YC(n321), .YS(n322) );
  FAX1 U295 ( .A(n326), .B(n534), .C(n614), .YC(n323), .YS(n324) );
  FAX1 U297 ( .A(n332), .B(n972), .C(n330), .YC(n327), .YS(n328) );
  FAX1 U298 ( .A(n347), .B(n334), .C(n345), .YC(n329), .YS(n330) );
  FAX1 U299 ( .A(n340), .B(n336), .C(n338), .YC(n331), .YS(n332) );
  FAX1 U302 ( .A(n567), .B(n551), .C(n631), .YC(n337), .YS(n338) );
  FAX1 U303 ( .A(n519), .B(n535), .C(n583), .YC(n339), .YS(n340) );
  FAX1 U304 ( .A(n346), .B(n357), .C(n344), .YC(n341), .YS(n342) );
  FAX1 U305 ( .A(n361), .B(n348), .C(n359), .YC(n343), .YS(n344) );
  FAX1 U306 ( .A(n363), .B(n350), .C(n352), .YC(n345), .YS(n346) );
  FAX1 U307 ( .A(n367), .B(n354), .C(n365), .YC(n347), .YS(n348) );
  FAX1 U308 ( .A(n616), .B(n568), .C(n600), .YC(n349), .YS(n350) );
  FAX1 U311 ( .A(n360), .B(n371), .C(n358), .YC(n355), .YS(n356) );
  FAX1 U313 ( .A(n379), .B(n364), .C(n366), .YC(n359), .YS(n360) );
  FAX1 U314 ( .A(n368), .B(n381), .C(n377), .YC(n361), .YS(n362) );
  FAX1 U315 ( .A(n617), .B(n569), .C(n601), .YC(n363), .YS(n364) );
  FAX1 U316 ( .A(n553), .B(n633), .C(n585), .YC(n365), .YS(n366) );
  FAX1 U317 ( .A(n503), .B(n521), .C(n537), .YC(n367), .YS(n368) );
  FAX1 U318 ( .A(n374), .B(n385), .C(n372), .YC(n369), .YS(n370) );
  FAX1 U321 ( .A(n395), .B(n393), .C(n391), .YC(n375), .YS(n376) );
  FAX1 U322 ( .A(n618), .B(n586), .C(n602), .YC(n377), .YS(n378) );
  FAX1 U323 ( .A(n634), .B(n554), .C(n570), .YC(n379), .YS(n380) );
  FAX1 U324 ( .A(n522), .B(n650), .C(n538), .YC(n381), .YS(n382) );
  FAX1 U325 ( .A(n388), .B(n399), .C(n386), .YC(n383), .YS(n384) );
  FAX1 U327 ( .A(n405), .B(n394), .C(n392), .YC(n387), .YS(n388) );
  FAX1 U329 ( .A(n603), .B(n587), .C(n635), .YC(n391), .YS(n392) );
  HAX1 U331 ( .A(n651), .B(n505), .YC(n395), .YS(n396) );
  FAX1 U332 ( .A(n402), .B(n411), .C(n400), .YC(n397), .YS(n398) );
  FAX1 U333 ( .A(n408), .B(n404), .C(n413), .YC(n399), .YS(n400) );
  FAX1 U335 ( .A(n604), .B(n588), .C(n419), .YC(n403), .YS(n404) );
  FAX1 U336 ( .A(n620), .B(n556), .C(n572), .YC(n405), .YS(n406) );
  FAX1 U337 ( .A(n652), .B(n540), .C(n636), .YC(n407), .YS(n408) );
  FAX1 U338 ( .A(n414), .B(n423), .C(n412), .YC(n409), .YS(n410) );
  FAX1 U339 ( .A(n416), .B(n418), .C(n425), .YC(n411), .YS(n412) );
  FAX1 U340 ( .A(n420), .B(n429), .C(n427), .YC(n413), .YS(n414) );
  FAX1 U341 ( .A(n605), .B(n506), .C(n573), .YC(n415), .YS(n416) );
  FAX1 U342 ( .A(n589), .B(n637), .C(n621), .YC(n417), .YS(n418) );
  HAX1 U343 ( .A(n653), .B(n557), .YC(n419), .YS(n420) );
  FAX1 U344 ( .A(n426), .B(n433), .C(n424), .YC(n421), .YS(n422) );
  FAX1 U345 ( .A(n430), .B(n428), .C(n435), .YC(n423), .YS(n424) );
  FAX1 U346 ( .A(n606), .B(n439), .C(n437), .YC(n425), .YS(n426) );
  FAX1 U347 ( .A(n622), .B(n574), .C(n590), .YC(n427), .YS(n428) );
  FAX1 U348 ( .A(n654), .B(n638), .C(n558), .YC(n429), .YS(n430) );
  FAX1 U349 ( .A(n436), .B(n443), .C(n434), .YC(n431), .YS(n432) );
  FAX1 U350 ( .A(n447), .B(n445), .C(n438), .YC(n433), .YS(n434) );
  FAX1 U351 ( .A(n623), .B(n591), .C(n440), .YC(n435), .YS(n436) );
  FAX1 U352 ( .A(n607), .B(n507), .C(n639), .YC(n437), .YS(n438) );
  HAX1 U353 ( .A(n655), .B(n575), .YC(n439), .YS(n440) );
  FAX1 U354 ( .A(n446), .B(n451), .C(n444), .YC(n441), .YS(n442) );
  FAX1 U355 ( .A(n455), .B(n453), .C(n448), .YC(n443), .YS(n444) );
  FAX1 U356 ( .A(n624), .B(n592), .C(n608), .YC(n445), .YS(n446) );
  FAX1 U357 ( .A(n656), .B(n640), .C(n576), .YC(n447), .YS(n448) );
  FAX1 U358 ( .A(n454), .B(n459), .C(n452), .YC(n449), .YS(n450) );
  FAX1 U359 ( .A(n641), .B(n456), .C(n461), .YC(n451), .YS(n452) );
  FAX1 U360 ( .A(n609), .B(n508), .C(n625), .YC(n453), .YS(n454) );
  HAX1 U361 ( .A(n657), .B(n593), .YC(n455), .YS(n456) );
  FAX1 U362 ( .A(n465), .B(n462), .C(n460), .YC(n457), .YS(n458) );
  FAX1 U363 ( .A(n626), .B(n610), .C(n467), .YC(n459), .YS(n460) );
  FAX1 U364 ( .A(n658), .B(n642), .C(n594), .YC(n461), .YS(n462) );
  FAX1 U365 ( .A(n468), .B(n471), .C(n466), .YC(n463), .YS(n464) );
  FAX1 U366 ( .A(n643), .B(n509), .C(n627), .YC(n465), .YS(n466) );
  HAX1 U367 ( .A(n659), .B(n611), .YC(n467), .YS(n468) );
  FAX1 U368 ( .A(n628), .B(n475), .C(n472), .YC(n469), .YS(n470) );
  FAX1 U369 ( .A(n660), .B(n644), .C(n612), .YC(n471), .YS(n472) );
  FAX1 U370 ( .A(n629), .B(n510), .C(n476), .YC(n473), .YS(n474) );
  HAX1 U371 ( .A(n661), .B(n645), .YC(n475), .YS(n476) );
  FAX1 U372 ( .A(n662), .B(n646), .C(n630), .YC(n477), .YS(n478) );
  HAX1 U373 ( .A(n663), .B(n647), .YC(n479), .YS(n480) );
  NOR2X1 U374 ( .A(n1106), .B(n858), .Y(n513) );
  NOR2X1 U375 ( .A(n1104), .B(n858), .Y(n235) );
  NOR2X1 U376 ( .A(n1103), .B(n858), .Y(n514) );
  NOR2X1 U377 ( .A(n1101), .B(n858), .Y(n245) );
  NOR2X1 U378 ( .A(n1100), .B(n858), .Y(n515) );
  NOR2X1 U379 ( .A(n1098), .B(n858), .Y(n259) );
  NOR2X1 U380 ( .A(n1096), .B(n858), .Y(n516) );
  NOR2X1 U381 ( .A(n1094), .B(n858), .Y(n277) );
  NOR2X1 U382 ( .A(n1092), .B(n858), .Y(n517) );
  NOR2X1 U384 ( .A(n1088), .B(n858), .Y(n518) );
  NOR2X1 U386 ( .A(n1084), .B(n858), .Y(n519) );
  NOR2X1 U387 ( .A(n858), .B(n1082), .Y(n520) );
  NOR2X1 U388 ( .A(n1080), .B(n858), .Y(n521) );
  AND2X1 U389 ( .A(n1116), .B(n1114), .Y(n522) );
  OAI22X1 U406 ( .A(n697), .B(n1051), .C(n858), .D(n1079), .Y(n505) );
  OAI22X1 U409 ( .A(n858), .B(n1051), .C(n681), .D(n1079), .Y(n524) );
  OAI22X1 U410 ( .A(n681), .B(n1051), .C(n682), .D(n1079), .Y(n525) );
  OAI22X1 U411 ( .A(n682), .B(n1078), .C(n683), .D(n1079), .Y(n526) );
  OAI22X1 U412 ( .A(n683), .B(n1051), .C(n684), .D(n1079), .Y(n527) );
  OAI22X1 U413 ( .A(n684), .B(n1078), .C(n685), .D(n1079), .Y(n528) );
  OAI22X1 U414 ( .A(n685), .B(n1078), .C(n686), .D(n1079), .Y(n529) );
  OAI22X1 U415 ( .A(n686), .B(n1078), .C(n687), .D(n1079), .Y(n530) );
  OAI22X1 U416 ( .A(n687), .B(n1078), .C(n688), .D(n1079), .Y(n531) );
  OAI22X1 U417 ( .A(n688), .B(n1078), .C(n689), .D(n1079), .Y(n532) );
  OAI22X1 U418 ( .A(n689), .B(n1078), .C(n690), .D(n1079), .Y(n533) );
  OAI22X1 U419 ( .A(n690), .B(n1078), .C(n691), .D(n1079), .Y(n534) );
  OAI22X1 U420 ( .A(n691), .B(n1051), .C(n692), .D(n1079), .Y(n535) );
  OAI22X1 U421 ( .A(n692), .B(n1078), .C(n693), .D(n1079), .Y(n536) );
  OAI22X1 U422 ( .A(n693), .B(n1078), .C(n694), .D(n1079), .Y(n537) );
  OAI22X1 U423 ( .A(n1051), .B(n694), .C(n695), .D(n1079), .Y(n538) );
  OAI22X1 U424 ( .A(n695), .B(n1078), .C(n696), .D(n1079), .Y(n539) );
  AND2X1 U425 ( .A(n1116), .B(n1077), .Y(n540) );
  XNOR2X1 U427 ( .A(n1114), .B(n817), .Y(n681) );
  XNOR2X1 U428 ( .A(n1114), .B(n1105), .Y(n682) );
  XNOR2X1 U429 ( .A(n1114), .B(n819), .Y(n683) );
  XNOR2X1 U430 ( .A(n1114), .B(n1102), .Y(n684) );
  XNOR2X1 U431 ( .A(n1114), .B(n821), .Y(n685) );
  XNOR2X1 U432 ( .A(n1114), .B(n1099), .Y(n686) );
  XNOR2X1 U433 ( .A(n1114), .B(n1097), .Y(n687) );
  XNOR2X1 U434 ( .A(n1114), .B(n1095), .Y(n688) );
  XNOR2X1 U435 ( .A(n1113), .B(n1093), .Y(n689) );
  XNOR2X1 U436 ( .A(n1113), .B(n1091), .Y(n690) );
  XNOR2X1 U437 ( .A(n1113), .B(n1089), .Y(n691) );
  XNOR2X1 U438 ( .A(n1113), .B(n1087), .Y(n692) );
  XNOR2X1 U439 ( .A(n1113), .B(n1085), .Y(n693) );
  XNOR2X1 U440 ( .A(n1083), .B(n1113), .Y(n694) );
  XNOR2X1 U441 ( .A(n1113), .B(n1081), .Y(n695) );
  XNOR2X1 U442 ( .A(n1113), .B(n1115), .Y(n696) );
  OR2X1 U443 ( .A(n1115), .B(n858), .Y(n697) );
  OAI22X1 U445 ( .A(n1073), .B(n714), .C(n1109), .D(n1075), .Y(n506) );
  OAI22X1 U448 ( .A(n1109), .B(n1074), .C(n698), .D(n1076), .Y(n542) );
  OAI22X1 U449 ( .A(n698), .B(n1073), .C(n699), .D(n1034), .Y(n543) );
  OAI22X1 U450 ( .A(n699), .B(n1074), .C(n700), .D(n1076), .Y(n544) );
  OAI22X1 U451 ( .A(n700), .B(n1073), .C(n701), .D(n1075), .Y(n545) );
  OAI22X1 U452 ( .A(n701), .B(n1074), .C(n702), .D(n1076), .Y(n546) );
  OAI22X1 U453 ( .A(n702), .B(n1073), .C(n703), .D(n1034), .Y(n547) );
  OAI22X1 U454 ( .A(n703), .B(n1074), .C(n704), .D(n1076), .Y(n548) );
  OAI22X1 U455 ( .A(n704), .B(n1073), .C(n705), .D(n1075), .Y(n549) );
  OAI22X1 U456 ( .A(n705), .B(n1074), .C(n706), .D(n1076), .Y(n550) );
  OAI22X1 U457 ( .A(n706), .B(n1073), .C(n707), .D(n1075), .Y(n551) );
  OAI22X1 U458 ( .A(n707), .B(n1074), .C(n708), .D(n1076), .Y(n552) );
  OAI22X1 U459 ( .A(n708), .B(n1073), .C(n709), .D(n1075), .Y(n553) );
  OAI22X1 U460 ( .A(n709), .B(n1074), .C(n710), .D(n1076), .Y(n554) );
  OAI22X1 U461 ( .A(n710), .B(n1073), .C(n711), .D(n1075), .Y(n555) );
  OAI22X1 U462 ( .A(n1073), .B(n711), .C(n712), .D(n1076), .Y(n556) );
  OAI22X1 U463 ( .A(n712), .B(n1074), .C(n713), .D(n1075), .Y(n557) );
  AND2X1 U464 ( .A(n1116), .B(n486), .Y(n558) );
  XNOR2X1 U466 ( .A(n1111), .B(n817), .Y(n698) );
  XNOR2X1 U467 ( .A(n1013), .B(n1105), .Y(n699) );
  XNOR2X1 U468 ( .A(n1013), .B(n819), .Y(n700) );
  XNOR2X1 U469 ( .A(n1111), .B(n1102), .Y(n701) );
  XNOR2X1 U470 ( .A(n1111), .B(n821), .Y(n702) );
  XNOR2X1 U471 ( .A(n1013), .B(n1099), .Y(n703) );
  XNOR2X1 U472 ( .A(n1111), .B(n1097), .Y(n704) );
  XNOR2X1 U473 ( .A(n1013), .B(n1095), .Y(n705) );
  XNOR2X1 U474 ( .A(n1013), .B(n1093), .Y(n706) );
  XNOR2X1 U475 ( .A(n1111), .B(n1091), .Y(n707) );
  XNOR2X1 U476 ( .A(n1013), .B(n1089), .Y(n708) );
  XNOR2X1 U477 ( .A(n1111), .B(n1087), .Y(n709) );
  XNOR2X1 U478 ( .A(n1013), .B(n1085), .Y(n710) );
  XNOR2X1 U479 ( .A(n1083), .B(n1111), .Y(n711) );
  XNOR2X1 U480 ( .A(n1013), .B(n1081), .Y(n712) );
  XNOR2X1 U481 ( .A(n1111), .B(n1115), .Y(n713) );
  OR2X1 U482 ( .A(n1115), .B(n1109), .Y(n714) );
  OAI22X1 U484 ( .A(n1069), .B(n731), .C(n1039), .D(n1071), .Y(n507) );
  OAI22X1 U487 ( .A(n1039), .B(n1070), .C(n715), .D(n1072), .Y(n560) );
  OAI22X1 U488 ( .A(n715), .B(n1069), .C(n716), .D(n1072), .Y(n561) );
  OAI22X1 U489 ( .A(n716), .B(n1070), .C(n717), .D(n1072), .Y(n562) );
  OAI22X1 U490 ( .A(n717), .B(n1069), .C(n718), .D(n1072), .Y(n563) );
  OAI22X1 U491 ( .A(n718), .B(n1070), .C(n719), .D(n1072), .Y(n564) );
  OAI22X1 U492 ( .A(n719), .B(n1069), .C(n720), .D(n1071), .Y(n565) );
  OAI22X1 U493 ( .A(n720), .B(n1070), .C(n721), .D(n1072), .Y(n566) );
  OAI22X1 U494 ( .A(n721), .B(n1069), .C(n722), .D(n1071), .Y(n567) );
  OAI22X1 U495 ( .A(n722), .B(n1070), .C(n723), .D(n1071), .Y(n568) );
  OAI22X1 U496 ( .A(n723), .B(n1069), .C(n724), .D(n1071), .Y(n569) );
  OAI22X1 U497 ( .A(n724), .B(n1070), .C(n725), .D(n1072), .Y(n570) );
  OAI22X1 U498 ( .A(n725), .B(n1069), .C(n726), .D(n1071), .Y(n571) );
  OAI22X1 U499 ( .A(n726), .B(n1070), .C(n727), .D(n1071), .Y(n572) );
  OAI22X1 U500 ( .A(n727), .B(n1069), .C(n728), .D(n1072), .Y(n573) );
  OAI22X1 U501 ( .A(n1069), .B(n728), .C(n729), .D(n1072), .Y(n574) );
  OAI22X1 U502 ( .A(n729), .B(n1070), .C(n730), .D(n1072), .Y(n575) );
  AND2X1 U503 ( .A(n1115), .B(n489), .Y(n576) );
  XNOR2X1 U505 ( .A(n1033), .B(n817), .Y(n715) );
  XNOR2X1 U506 ( .A(n1033), .B(n1105), .Y(n716) );
  XNOR2X1 U507 ( .A(n1033), .B(n819), .Y(n717) );
  XNOR2X1 U508 ( .A(n1033), .B(n1102), .Y(n718) );
  XNOR2X1 U509 ( .A(n1033), .B(n821), .Y(n719) );
  XNOR2X1 U510 ( .A(n1033), .B(n1099), .Y(n720) );
  XNOR2X1 U511 ( .A(n1108), .B(n1097), .Y(n721) );
  XNOR2X1 U512 ( .A(n1108), .B(n1095), .Y(n722) );
  XNOR2X1 U513 ( .A(n1108), .B(n1093), .Y(n723) );
  XNOR2X1 U514 ( .A(n1108), .B(n1091), .Y(n724) );
  XNOR2X1 U515 ( .A(n1108), .B(n1089), .Y(n725) );
  XNOR2X1 U516 ( .A(n1108), .B(n1087), .Y(n726) );
  XNOR2X1 U517 ( .A(n1108), .B(n1085), .Y(n727) );
  XNOR2X1 U518 ( .A(n1083), .B(n1033), .Y(n728) );
  XNOR2X1 U519 ( .A(n1108), .B(n1081), .Y(n729) );
  XNOR2X1 U520 ( .A(n1108), .B(n1115), .Y(n730) );
  OR2X1 U521 ( .A(n1115), .B(n1107), .Y(n731) );
  OAI22X1 U523 ( .A(n1064), .B(n748), .C(n1130), .D(n1066), .Y(n508) );
  OAI22X1 U526 ( .A(n1130), .B(n1065), .C(n732), .D(n1066), .Y(n578) );
  OAI22X1 U527 ( .A(n732), .B(n1064), .C(n733), .D(n1066), .Y(n579) );
  OAI22X1 U528 ( .A(n733), .B(n1065), .C(n734), .D(n1040), .Y(n580) );
  OAI22X1 U529 ( .A(n734), .B(n1064), .C(n735), .D(n1066), .Y(n581) );
  OAI22X1 U530 ( .A(n735), .B(n1065), .C(n736), .D(n1067), .Y(n582) );
  OAI22X1 U531 ( .A(n736), .B(n1064), .C(n737), .D(n1067), .Y(n583) );
  OAI22X1 U533 ( .A(n738), .B(n1064), .C(n739), .D(n1066), .Y(n585) );
  OAI22X1 U534 ( .A(n739), .B(n1065), .C(n740), .D(n1067), .Y(n586) );
  OAI22X1 U535 ( .A(n740), .B(n1064), .C(n741), .D(n1066), .Y(n587) );
  OAI22X1 U536 ( .A(n741), .B(n1065), .C(n742), .D(n1040), .Y(n588) );
  OAI22X1 U537 ( .A(n742), .B(n1064), .C(n743), .D(n1066), .Y(n589) );
  OAI22X1 U538 ( .A(n743), .B(n1065), .C(n744), .D(n1066), .Y(n590) );
  OAI22X1 U539 ( .A(n744), .B(n1064), .C(n745), .D(n1040), .Y(n591) );
  OAI22X1 U540 ( .A(n1064), .B(n745), .C(n746), .D(n1066), .Y(n592) );
  OAI22X1 U541 ( .A(n746), .B(n1065), .C(n747), .D(n1040), .Y(n593) );
  AND2X1 U542 ( .A(n1116), .B(n492), .Y(n594) );
  XNOR2X1 U544 ( .A(n937), .B(n817), .Y(n732) );
  XNOR2X1 U545 ( .A(n937), .B(n1105), .Y(n733) );
  XNOR2X1 U546 ( .A(n937), .B(n819), .Y(n734) );
  XNOR2X1 U547 ( .A(n937), .B(n1102), .Y(n735) );
  XNOR2X1 U548 ( .A(n936), .B(n821), .Y(n736) );
  XNOR2X1 U549 ( .A(n937), .B(n1099), .Y(n737) );
  XNOR2X1 U550 ( .A(n937), .B(n1097), .Y(n738) );
  XNOR2X1 U551 ( .A(n937), .B(n1095), .Y(n739) );
  XNOR2X1 U552 ( .A(n937), .B(n1093), .Y(n740) );
  XNOR2X1 U553 ( .A(n937), .B(n1091), .Y(n741) );
  XNOR2X1 U554 ( .A(n937), .B(n1089), .Y(n742) );
  XNOR2X1 U555 ( .A(n937), .B(n1087), .Y(n743) );
  XNOR2X1 U556 ( .A(n937), .B(n1085), .Y(n744) );
  XNOR2X1 U557 ( .A(n1083), .B(n937), .Y(n745) );
  XNOR2X1 U558 ( .A(n937), .B(n1081), .Y(n746) );
  XNOR2X1 U559 ( .A(n937), .B(n1115), .Y(n747) );
  OR2X1 U560 ( .A(n1115), .B(n1130), .Y(n748) );
  OAI22X1 U562 ( .A(n1059), .B(n765), .C(n1038), .D(n1061), .Y(n509) );
  OAI22X1 U565 ( .A(n1038), .B(n1036), .C(n749), .D(n1062), .Y(n596) );
  OAI22X1 U566 ( .A(n749), .B(n1059), .C(n750), .D(n1061), .Y(n597) );
  OAI22X1 U567 ( .A(n750), .B(n1060), .C(n751), .D(n1062), .Y(n598) );
  OAI22X1 U568 ( .A(n751), .B(n1059), .C(n752), .D(n1061), .Y(n599) );
  OAI22X1 U569 ( .A(n752), .B(n1036), .C(n753), .D(n1062), .Y(n600) );
  OAI22X1 U570 ( .A(n753), .B(n1059), .C(n754), .D(n1061), .Y(n601) );
  OAI22X1 U571 ( .A(n754), .B(n1036), .C(n755), .D(n1062), .Y(n602) );
  OAI22X1 U572 ( .A(n755), .B(n1059), .C(n756), .D(n1061), .Y(n603) );
  OAI22X1 U573 ( .A(n756), .B(n1036), .C(n757), .D(n1062), .Y(n604) );
  OAI22X1 U574 ( .A(n757), .B(n1059), .C(n758), .D(n1061), .Y(n605) );
  OAI22X1 U575 ( .A(n758), .B(n1036), .C(n759), .D(n1062), .Y(n606) );
  OAI22X1 U576 ( .A(n759), .B(n1059), .C(n760), .D(n1061), .Y(n607) );
  OAI22X1 U577 ( .A(n760), .B(n1036), .C(n761), .D(n1062), .Y(n608) );
  OAI22X1 U578 ( .A(n761), .B(n1059), .C(n762), .D(n1061), .Y(n609) );
  OAI22X1 U579 ( .A(n1059), .B(n762), .C(n763), .D(n1062), .Y(n610) );
  OAI22X1 U580 ( .A(n763), .B(n1036), .C(n764), .D(n1061), .Y(n611) );
  AND2X1 U581 ( .A(n1116), .B(n495), .Y(n612) );
  XNOR2X1 U583 ( .A(n1127), .B(n817), .Y(n749) );
  XNOR2X1 U584 ( .A(n1127), .B(n1105), .Y(n750) );
  XNOR2X1 U585 ( .A(n1126), .B(n819), .Y(n751) );
  XNOR2X1 U586 ( .A(n1127), .B(n1102), .Y(n752) );
  XNOR2X1 U587 ( .A(n1127), .B(n821), .Y(n753) );
  XNOR2X1 U588 ( .A(n1126), .B(n1099), .Y(n754) );
  XNOR2X1 U589 ( .A(n1126), .B(n1097), .Y(n755) );
  XNOR2X1 U590 ( .A(n1127), .B(n1095), .Y(n756) );
  XNOR2X1 U591 ( .A(n1127), .B(n1093), .Y(n757) );
  XNOR2X1 U592 ( .A(n1126), .B(n1091), .Y(n758) );
  XNOR2X1 U593 ( .A(n1126), .B(n1089), .Y(n759) );
  XNOR2X1 U594 ( .A(n1126), .B(n1087), .Y(n760) );
  XNOR2X1 U595 ( .A(n1127), .B(n1085), .Y(n761) );
  XNOR2X1 U596 ( .A(n1083), .B(n1126), .Y(n762) );
  XNOR2X1 U597 ( .A(n1126), .B(n1081), .Y(n763) );
  XNOR2X1 U598 ( .A(n1127), .B(n1115), .Y(n764) );
  OR2X1 U599 ( .A(n1115), .B(n1038), .Y(n765) );
  OAI22X1 U601 ( .A(n939), .B(n782), .C(n1041), .D(n1058), .Y(n510) );
  OAI22X1 U604 ( .A(n1041), .B(n938), .C(n766), .D(n1058), .Y(n614) );
  OAI22X1 U605 ( .A(n766), .B(n1006), .C(n767), .D(n1058), .Y(n615) );
  OAI22X1 U606 ( .A(n767), .B(n938), .C(n768), .D(n1058), .Y(n616) );
  OAI22X1 U607 ( .A(n768), .B(n1006), .C(n769), .D(n1058), .Y(n617) );
  OAI22X1 U608 ( .A(n769), .B(n1006), .C(n770), .D(n1058), .Y(n618) );
  OAI22X1 U609 ( .A(n770), .B(n939), .C(n771), .D(n1058), .Y(n619) );
  OAI22X1 U610 ( .A(n771), .B(n1006), .C(n772), .D(n1058), .Y(n620) );
  OAI22X1 U611 ( .A(n772), .B(n939), .C(n773), .D(n1058), .Y(n621) );
  OAI22X1 U612 ( .A(n773), .B(n939), .C(n774), .D(n1058), .Y(n622) );
  OAI22X1 U613 ( .A(n774), .B(n1006), .C(n775), .D(n1058), .Y(n623) );
  OAI22X1 U614 ( .A(n775), .B(n1006), .C(n776), .D(n1058), .Y(n624) );
  OAI22X1 U615 ( .A(n776), .B(n939), .C(n777), .D(n1058), .Y(n625) );
  OAI22X1 U616 ( .A(n777), .B(n1006), .C(n778), .D(n1058), .Y(n626) );
  OAI22X1 U617 ( .A(n778), .B(n939), .C(n779), .D(n1058), .Y(n627) );
  OAI22X1 U618 ( .A(n1006), .B(n779), .C(n780), .D(n1058), .Y(n628) );
  OAI22X1 U619 ( .A(n780), .B(n939), .C(n781), .D(n1058), .Y(n629) );
  AND2X1 U620 ( .A(n1116), .B(n1057), .Y(n630) );
  XNOR2X1 U622 ( .A(n1123), .B(n817), .Y(n766) );
  XNOR2X1 U623 ( .A(n1124), .B(n1105), .Y(n767) );
  XNOR2X1 U624 ( .A(n1124), .B(n819), .Y(n768) );
  XNOR2X1 U625 ( .A(n1124), .B(n1102), .Y(n769) );
  XNOR2X1 U626 ( .A(n1124), .B(n821), .Y(n770) );
  XNOR2X1 U627 ( .A(n1123), .B(n1099), .Y(n771) );
  XNOR2X1 U628 ( .A(n1123), .B(n1097), .Y(n772) );
  XNOR2X1 U629 ( .A(n1123), .B(n1095), .Y(n773) );
  XNOR2X1 U630 ( .A(n1123), .B(n1093), .Y(n774) );
  XNOR2X1 U631 ( .A(n1123), .B(n1091), .Y(n775) );
  XNOR2X1 U632 ( .A(n1123), .B(n1089), .Y(n776) );
  XNOR2X1 U633 ( .A(n1123), .B(n1087), .Y(n777) );
  XNOR2X1 U634 ( .A(n1123), .B(n1085), .Y(n778) );
  XNOR2X1 U635 ( .A(n1083), .B(n1123), .Y(n779) );
  XNOR2X1 U636 ( .A(n1123), .B(n1081), .Y(n780) );
  XNOR2X1 U637 ( .A(n1123), .B(n1115), .Y(n781) );
  OAI22X1 U640 ( .A(n1055), .B(n799), .C(n1122), .D(n1037), .Y(n511) );
  OAI22X1 U643 ( .A(n1122), .B(n1050), .C(n783), .D(n1056), .Y(n632) );
  OAI22X1 U644 ( .A(n783), .B(n1055), .C(n784), .D(n1056), .Y(n633) );
  OAI22X1 U645 ( .A(n784), .B(n1050), .C(n1056), .D(n785), .Y(n634) );
  OAI22X1 U646 ( .A(n785), .B(n1055), .C(n786), .D(n1056), .Y(n635) );
  OAI22X1 U647 ( .A(n786), .B(n1050), .C(n787), .D(n1056), .Y(n636) );
  OAI22X1 U648 ( .A(n787), .B(n1055), .C(n788), .D(n1056), .Y(n637) );
  OAI22X1 U649 ( .A(n788), .B(n1050), .C(n789), .D(n1056), .Y(n638) );
  OAI22X1 U650 ( .A(n789), .B(n1055), .C(n790), .D(n1056), .Y(n639) );
  OAI22X1 U651 ( .A(n790), .B(n1050), .C(n791), .D(n1056), .Y(n640) );
  OAI22X1 U652 ( .A(n791), .B(n1055), .C(n792), .D(n1037), .Y(n641) );
  OAI22X1 U653 ( .A(n792), .B(n1055), .C(n793), .D(n1037), .Y(n642) );
  OAI22X1 U654 ( .A(n793), .B(n1055), .C(n794), .D(n1056), .Y(n643) );
  OAI22X1 U655 ( .A(n794), .B(n1050), .C(n795), .D(n1037), .Y(n644) );
  OAI22X1 U656 ( .A(n795), .B(n1055), .C(n796), .D(n1056), .Y(n645) );
  OAI22X1 U657 ( .A(n1055), .B(n796), .C(n797), .D(n1056), .Y(n646) );
  OAI22X1 U658 ( .A(n797), .B(n1055), .C(n798), .D(n1056), .Y(n647) );
  AND2X1 U659 ( .A(n1115), .B(n1054), .Y(n648) );
  XNOR2X1 U661 ( .A(n1120), .B(n817), .Y(n783) );
  XNOR2X1 U662 ( .A(n1121), .B(n1105), .Y(n784) );
  XNOR2X1 U663 ( .A(n1121), .B(n819), .Y(n785) );
  XNOR2X1 U664 ( .A(n1120), .B(n1102), .Y(n786) );
  XNOR2X1 U665 ( .A(n1121), .B(n821), .Y(n787) );
  XNOR2X1 U666 ( .A(n1121), .B(n1099), .Y(n788) );
  XNOR2X1 U667 ( .A(n1120), .B(n1097), .Y(n789) );
  XNOR2X1 U668 ( .A(n1120), .B(n1095), .Y(n790) );
  XNOR2X1 U669 ( .A(n1120), .B(n1093), .Y(n791) );
  XNOR2X1 U670 ( .A(n1120), .B(n1091), .Y(n792) );
  XNOR2X1 U671 ( .A(n1121), .B(n1089), .Y(n793) );
  XNOR2X1 U672 ( .A(n1121), .B(n1087), .Y(n794) );
  XNOR2X1 U673 ( .A(n1120), .B(n1085), .Y(n795) );
  XNOR2X1 U674 ( .A(n1083), .B(n1121), .Y(n796) );
  XNOR2X1 U675 ( .A(n1120), .B(n1081), .Y(n797) );
  XNOR2X1 U676 ( .A(n1121), .B(n1115), .Y(n798) );
  OR2X1 U677 ( .A(n1115), .B(n1122), .Y(n799) );
  OAI22X1 U679 ( .A(n857), .B(n816), .C(n1119), .D(n1053), .Y(n512) );
  OAI22X1 U682 ( .A(n857), .B(n1119), .C(n800), .D(n1053), .Y(n650) );
  OAI22X1 U683 ( .A(n857), .B(n800), .C(n801), .D(n1053), .Y(n651) );
  OAI22X1 U684 ( .A(n857), .B(n801), .C(n802), .D(n1053), .Y(n652) );
  OAI22X1 U685 ( .A(n857), .B(n802), .C(n803), .D(n1053), .Y(n653) );
  OAI22X1 U686 ( .A(n857), .B(n803), .C(n804), .D(n1053), .Y(n654) );
  OAI22X1 U687 ( .A(n857), .B(n804), .C(n805), .D(n1053), .Y(n655) );
  OAI22X1 U688 ( .A(n857), .B(n805), .C(n806), .D(n1053), .Y(n656) );
  OAI22X1 U689 ( .A(n857), .B(n806), .C(n807), .D(n1053), .Y(n657) );
  OAI22X1 U690 ( .A(n857), .B(n807), .C(n808), .D(n1053), .Y(n658) );
  OAI22X1 U691 ( .A(n857), .B(n808), .C(n809), .D(n1053), .Y(n659) );
  OAI22X1 U692 ( .A(n857), .B(n809), .C(n810), .D(n1053), .Y(n660) );
  OAI22X1 U693 ( .A(n857), .B(n810), .C(n811), .D(n1053), .Y(n661) );
  OAI22X1 U694 ( .A(n857), .B(n811), .C(n812), .D(n1053), .Y(n662) );
  OAI22X1 U695 ( .A(n857), .B(n812), .C(n1053), .D(n813), .Y(n663) );
  OAI22X1 U696 ( .A(n814), .B(n1053), .C(n857), .D(n813), .Y(n664) );
  OAI22X1 U697 ( .A(n857), .B(n814), .C(n815), .D(n1053), .Y(n665) );
  XNOR2X1 U698 ( .A(n1), .B(n817), .Y(n800) );
  XNOR2X1 U699 ( .A(n1), .B(n1105), .Y(n801) );
  XNOR2X1 U700 ( .A(n1), .B(n819), .Y(n802) );
  XNOR2X1 U701 ( .A(n945), .B(n1102), .Y(n803) );
  XNOR2X1 U702 ( .A(n945), .B(n821), .Y(n804) );
  XNOR2X1 U703 ( .A(n945), .B(n1099), .Y(n805) );
  XNOR2X1 U704 ( .A(n940), .B(n1097), .Y(n806) );
  XNOR2X1 U705 ( .A(n942), .B(n1095), .Y(n807) );
  XNOR2X1 U706 ( .A(n941), .B(n1093), .Y(n808) );
  XNOR2X1 U707 ( .A(n942), .B(n1091), .Y(n809) );
  XNOR2X1 U708 ( .A(n941), .B(n1089), .Y(n810) );
  XNOR2X1 U709 ( .A(n942), .B(n1087), .Y(n811) );
  XNOR2X1 U710 ( .A(n942), .B(n1085), .Y(n812) );
  XNOR2X1 U711 ( .A(n1083), .B(n941), .Y(n813) );
  XNOR2X1 U712 ( .A(n942), .B(n1081), .Y(n814) );
  XNOR2X1 U713 ( .A(n941), .B(n1115), .Y(n815) );
  OR2X1 U714 ( .A(n1115), .B(n1119), .Y(n816) );
  XOR2X1 U742 ( .A(a[29]), .B(n1113), .Y(n833) );
  XNOR2X1 U743 ( .A(a[29]), .B(n1110), .Y(n46) );
  XOR2X1 U745 ( .A(a[27]), .B(n1110), .Y(n834) );
  XOR2X1 U751 ( .A(a[23]), .B(n936), .Y(n836) );
  XNOR2X1 U752 ( .A(a[23]), .B(n1126), .Y(n28) );
  XOR2X1 U754 ( .A(a[21]), .B(n1127), .Y(n837) );
  XOR2X1 U757 ( .A(a[19]), .B(n1123), .Y(n838) );
  XNOR2X1 U758 ( .A(a[19]), .B(n1120), .Y(n16) );
  XOR2X1 U760 ( .A(a[17]), .B(n1121), .Y(n839) );
  XNOR2X1 U761 ( .A(n1), .B(a[17]), .Y(n9) );
  NAND2X1 U762 ( .A(n857), .B(n840), .Y(n6) );
  XOR2X1 U763 ( .A(n1), .B(a[15]), .Y(n840) );
  BUFX2 U768 ( .A(n291), .Y(n935) );
  INVX4 U769 ( .A(n1109), .Y(n1110) );
  INVX4 U770 ( .A(n1117), .Y(n1115) );
  INVX8 U771 ( .A(n1114), .Y(n858) );
  BUFX4 U772 ( .A(n1060), .Y(n1036) );
  BUFX2 U773 ( .A(n1129), .Y(n936) );
  BUFX4 U774 ( .A(n1129), .Y(n937) );
  INVX1 U775 ( .A(n1130), .Y(n1129) );
  BUFX2 U776 ( .A(n1007), .Y(n938) );
  BUFX2 U777 ( .A(n1007), .Y(n939) );
  INVX1 U778 ( .A(n1057), .Y(n1007) );
  INVX4 U779 ( .A(n1042), .Y(n1075) );
  INVX8 U780 ( .A(n1045), .Y(n1058) );
  BUFX2 U781 ( .A(n946), .Y(n940) );
  BUFX4 U782 ( .A(n946), .Y(n941) );
  BUFX4 U783 ( .A(n946), .Y(n942) );
  INVX4 U784 ( .A(n944), .Y(n946) );
  INVX2 U785 ( .A(n1118), .Y(n944) );
  INVX2 U786 ( .A(n1119), .Y(n1118) );
  INVX4 U787 ( .A(n944), .Y(n945) );
  INVX2 U788 ( .A(n1041), .Y(n1124) );
  INVX2 U789 ( .A(n28), .Y(n1063) );
  INVX4 U790 ( .A(n1092), .Y(n1093) );
  INVX4 U791 ( .A(n1086), .Y(n1087) );
  INVX2 U792 ( .A(n34), .Y(n1068) );
  INVX4 U793 ( .A(n1090), .Y(n1091) );
  INVX2 U794 ( .A(n1054), .Y(n1055) );
  INVX4 U795 ( .A(n1052), .Y(n1053) );
  INVX4 U796 ( .A(n25), .Y(n1130) );
  INVX2 U797 ( .A(n948), .Y(n1071) );
  INVX2 U798 ( .A(n948), .Y(n1072) );
  INVX2 U799 ( .A(n503), .Y(n649) );
  INVX4 U800 ( .A(n1104), .Y(n1105) );
  INVX4 U801 ( .A(n481), .Y(n1112) );
  BUFX2 U802 ( .A(n417), .Y(n1031) );
  INVX4 U803 ( .A(n947), .Y(n1074) );
  BUFX2 U804 ( .A(n343), .Y(n972) );
  BUFX2 U805 ( .A(n109), .Y(n943) );
  BUFX4 U806 ( .A(n31), .Y(n1033) );
  INVX2 U807 ( .A(n821), .Y(n1100) );
  INVX2 U808 ( .A(n1057), .Y(n1006) );
  XNOR2X1 U809 ( .A(a[27]), .B(n1107), .Y(n947) );
  AND2X2 U810 ( .A(n1070), .B(n835), .Y(n948) );
  OR2X2 U811 ( .A(n279), .B(n270), .Y(n949) );
  OR2X2 U812 ( .A(n248), .B(n253), .Y(n950) );
  INVX2 U813 ( .A(n1080), .Y(n1081) );
  INVX4 U814 ( .A(n1112), .Y(n1114) );
  INVX4 U815 ( .A(n1084), .Y(n1085) );
  INVX4 U816 ( .A(n1088), .Y(n1089) );
  INVX4 U817 ( .A(n1096), .Y(n1097) );
  INVX4 U818 ( .A(n1094), .Y(n1095) );
  INVX2 U819 ( .A(n824), .Y(n1094) );
  INVX4 U820 ( .A(n1098), .Y(n1099) );
  INVX2 U821 ( .A(n822), .Y(n1098) );
  INVX2 U822 ( .A(n825), .Y(n1092) );
  INVX2 U823 ( .A(n1077), .Y(n1051) );
  INVX2 U824 ( .A(n46), .Y(n1077) );
  OR2X2 U825 ( .A(n238), .B(n241), .Y(n951) );
  INVX4 U826 ( .A(n1101), .Y(n1102) );
  INVX2 U827 ( .A(n820), .Y(n1101) );
  INVX2 U828 ( .A(n818), .Y(n1104) );
  INVX2 U829 ( .A(n819), .Y(n1103) );
  OR2X2 U830 ( .A(n232), .B(n233), .Y(n952) );
  INVX2 U831 ( .A(n817), .Y(n1106) );
  XNOR2X1 U832 ( .A(n104), .B(n953), .Y(product[40]) );
  AND2X2 U833 ( .A(n103), .B(n1018), .Y(n953) );
  XOR2X1 U834 ( .A(n387), .B(n389), .Y(n954) );
  XOR2X1 U835 ( .A(n376), .B(n954), .Y(n372) );
  NAND2X1 U836 ( .A(n376), .B(n387), .Y(n955) );
  NAND2X1 U837 ( .A(n376), .B(n389), .Y(n956) );
  NAND2X1 U838 ( .A(n387), .B(n389), .Y(n957) );
  NAND3X1 U839 ( .A(n956), .B(n955), .C(n957), .Y(n371) );
  INVX1 U840 ( .A(n151), .Y(n149) );
  NOR2X1 U841 ( .A(n341), .B(n328), .Y(n958) );
  INVX1 U842 ( .A(n114), .Y(n222) );
  XOR2X1 U843 ( .A(n1031), .B(n415), .Y(n959) );
  XOR2X1 U844 ( .A(n959), .B(n406), .Y(n402) );
  NAND2X1 U845 ( .A(n1031), .B(n415), .Y(n960) );
  NAND2X1 U846 ( .A(n1031), .B(n406), .Y(n961) );
  NAND2X1 U847 ( .A(n415), .B(n406), .Y(n962) );
  NAND3X1 U848 ( .A(n960), .B(n961), .C(n962), .Y(n401) );
  XOR2X1 U849 ( .A(n403), .B(n390), .Y(n963) );
  XOR2X1 U850 ( .A(n963), .B(n401), .Y(n386) );
  NAND2X1 U851 ( .A(n403), .B(n390), .Y(n964) );
  NAND2X1 U852 ( .A(n403), .B(n401), .Y(n965) );
  NAND2X1 U853 ( .A(n390), .B(n401), .Y(n966) );
  NAND3X1 U854 ( .A(n964), .B(n965), .C(n966), .Y(n385) );
  NOR2X1 U855 ( .A(n397), .B(n384), .Y(n967) );
  XOR2X1 U856 ( .A(n503), .B(n520), .Y(n968) );
  XOR2X1 U857 ( .A(n968), .B(n536), .Y(n354) );
  NAND2X1 U858 ( .A(n536), .B(n503), .Y(n969) );
  NAND2X1 U859 ( .A(n536), .B(n520), .Y(n970) );
  NAND2X1 U860 ( .A(n503), .B(n520), .Y(n971) );
  NAND3X1 U861 ( .A(n970), .B(n969), .C(n971), .Y(n353) );
  NOR2X1 U862 ( .A(n369), .B(n356), .Y(n973) );
  INVX1 U863 ( .A(n78), .Y(n974) );
  INVX2 U864 ( .A(n974), .Y(n975) );
  XOR2X1 U865 ( .A(n584), .B(n632), .Y(n976) );
  XOR2X1 U866 ( .A(n976), .B(n552), .Y(n352) );
  NAND2X1 U867 ( .A(n584), .B(n632), .Y(n977) );
  NAND2X1 U868 ( .A(n584), .B(n552), .Y(n978) );
  NAND2X1 U869 ( .A(n632), .B(n552), .Y(n979) );
  NAND3X1 U870 ( .A(n977), .B(n978), .C(n979), .Y(n351) );
  XOR2X1 U871 ( .A(n353), .B(n349), .Y(n980) );
  XOR2X1 U872 ( .A(n980), .B(n351), .Y(n334) );
  NAND2X1 U873 ( .A(n353), .B(n349), .Y(n981) );
  NAND2X1 U874 ( .A(n353), .B(n351), .Y(n982) );
  NAND2X1 U875 ( .A(n349), .B(n351), .Y(n983) );
  NAND3X1 U876 ( .A(n981), .B(n982), .C(n983), .Y(n333) );
  OR2X1 U877 ( .A(n737), .B(n1065), .Y(n984) );
  OR2X1 U878 ( .A(n738), .B(n1067), .Y(n985) );
  NAND2X1 U879 ( .A(n984), .B(n985), .Y(n584) );
  XOR2X1 U880 ( .A(n407), .B(n619), .Y(n986) );
  XOR2X1 U881 ( .A(n396), .B(n986), .Y(n390) );
  NAND2X1 U882 ( .A(n396), .B(n407), .Y(n987) );
  NAND2X1 U883 ( .A(n396), .B(n619), .Y(n988) );
  NAND2X1 U884 ( .A(n407), .B(n619), .Y(n989) );
  NAND3X1 U885 ( .A(n988), .B(n987), .C(n989), .Y(n389) );
  XOR2X1 U886 ( .A(n615), .B(n649), .Y(n990) );
  XOR2X1 U887 ( .A(n990), .B(n599), .Y(n336) );
  NAND2X1 U888 ( .A(n599), .B(n615), .Y(n991) );
  NAND2X1 U889 ( .A(n599), .B(n649), .Y(n992) );
  NAND2X1 U890 ( .A(n615), .B(n649), .Y(n993) );
  NAND3X1 U891 ( .A(n992), .B(n991), .C(n993), .Y(n335) );
  XOR2X1 U892 ( .A(n382), .B(n378), .Y(n994) );
  XOR2X1 U893 ( .A(n994), .B(n380), .Y(n374) );
  NAND2X1 U894 ( .A(n382), .B(n378), .Y(n995) );
  NAND2X1 U895 ( .A(n382), .B(n380), .Y(n996) );
  NAND2X1 U896 ( .A(n378), .B(n380), .Y(n997) );
  NAND3X1 U897 ( .A(n995), .B(n996), .C(n997), .Y(n373) );
  XOR2X1 U898 ( .A(n375), .B(n362), .Y(n998) );
  XOR2X1 U899 ( .A(n998), .B(n373), .Y(n358) );
  NAND2X1 U900 ( .A(n375), .B(n362), .Y(n999) );
  NAND2X1 U901 ( .A(n375), .B(n373), .Y(n1000) );
  NAND2X1 U902 ( .A(n362), .B(n373), .Y(n1001) );
  NAND3X1 U903 ( .A(n999), .B(n1000), .C(n1001), .Y(n357) );
  XOR2X1 U904 ( .A(n276), .B(n285), .Y(n1002) );
  XOR2X1 U905 ( .A(n274), .B(n1002), .Y(n272) );
  NAND2X1 U906 ( .A(n274), .B(n276), .Y(n1003) );
  NAND2X1 U907 ( .A(n274), .B(n285), .Y(n1004) );
  NAND2X1 U908 ( .A(n276), .B(n285), .Y(n1005) );
  NAND3X1 U909 ( .A(n1004), .B(n1003), .C(n1005), .Y(n271) );
  INVX2 U910 ( .A(n1012), .Y(n299) );
  XOR2X1 U911 ( .A(n571), .B(n555), .Y(n1008) );
  XOR2X1 U912 ( .A(n1008), .B(n539), .Y(n394) );
  NAND2X1 U913 ( .A(n539), .B(n571), .Y(n1009) );
  NAND2X1 U914 ( .A(n539), .B(n555), .Y(n1010) );
  NAND2X1 U915 ( .A(n571), .B(n555), .Y(n1011) );
  NAND3X1 U916 ( .A(n1010), .B(n1009), .C(n1011), .Y(n393) );
  OR2X2 U917 ( .A(n1090), .B(n858), .Y(n1012) );
  INVX2 U918 ( .A(n1109), .Y(n1013) );
  INVX8 U919 ( .A(n37), .Y(n1109) );
  INVX2 U920 ( .A(n1), .Y(n1119) );
  INVX8 U921 ( .A(n1030), .Y(n1079) );
  OR2X2 U922 ( .A(n421), .B(n410), .Y(n1019) );
  OR2X2 U923 ( .A(n262), .B(n269), .Y(n1018) );
  OR2X1 U924 ( .A(n664), .B(n648), .Y(n1014) );
  OR2X1 U925 ( .A(n479), .B(n478), .Y(n1015) );
  AND2X2 U926 ( .A(n664), .B(n648), .Y(n1016) );
  AND2X2 U927 ( .A(n479), .B(n478), .Y(n1017) );
  INVX4 U928 ( .A(n1028), .Y(n1056) );
  XOR2X1 U929 ( .A(a[25]), .B(n1033), .Y(n835) );
  INVX1 U930 ( .A(n49), .Y(n1117) );
  AND2X2 U931 ( .A(n431), .B(n422), .Y(n1020) );
  OR2X1 U932 ( .A(n431), .B(n422), .Y(n1021) );
  AND2X2 U933 ( .A(n421), .B(n410), .Y(n1022) );
  BUFX2 U934 ( .A(n1107), .Y(n1039) );
  OR2X1 U935 ( .A(n463), .B(n458), .Y(n1023) );
  AND2X2 U936 ( .A(n463), .B(n458), .Y(n1024) );
  INVX2 U937 ( .A(n494), .Y(n595) );
  INVX2 U938 ( .A(n497), .Y(n613) );
  INVX2 U939 ( .A(n491), .Y(n577) );
  INVX2 U940 ( .A(n488), .Y(n559) );
  OR2X1 U941 ( .A(n473), .B(n470), .Y(n1025) );
  AND2X2 U942 ( .A(n473), .B(n470), .Y(n1026) );
  INVX2 U943 ( .A(n485), .Y(n541) );
  XNOR2X1 U944 ( .A(n482), .B(n513), .Y(n231) );
  AND2X2 U945 ( .A(n1087), .B(n1114), .Y(n325) );
  INVX2 U946 ( .A(n16), .Y(n1057) );
  INVX4 U947 ( .A(n1122), .Y(n1121) );
  INVX4 U948 ( .A(n1128), .Y(n1127) );
  INVX4 U949 ( .A(n1048), .Y(n1061) );
  INVX4 U950 ( .A(n1049), .Y(n1062) );
  INVX4 U951 ( .A(n1043), .Y(n1076) );
  INVX2 U952 ( .A(n1029), .Y(n1060) );
  INVX2 U953 ( .A(n1117), .Y(n1116) );
  AND2X2 U954 ( .A(n665), .B(n512), .Y(n1027) );
  INVX4 U955 ( .A(n1082), .Y(n1083) );
  INVX2 U956 ( .A(n828), .Y(n1086) );
  INVX2 U957 ( .A(n826), .Y(n1090) );
  INVX2 U958 ( .A(n823), .Y(n1096) );
  INVX2 U959 ( .A(n827), .Y(n1088) );
  INVX2 U960 ( .A(n829), .Y(n1084) );
  AND2X2 U961 ( .A(n9), .B(n839), .Y(n1028) );
  XOR2X1 U962 ( .A(a[21]), .B(n1123), .Y(n1029) );
  XOR2X1 U963 ( .A(a[25]), .B(n1130), .Y(n34) );
  AND2X2 U964 ( .A(n833), .B(n46), .Y(n1030) );
  INVX1 U965 ( .A(n126), .Y(n224) );
  BUFX4 U966 ( .A(n315), .Y(n1032) );
  INVX2 U967 ( .A(n9), .Y(n1054) );
  OR2X2 U968 ( .A(n1115), .B(n1041), .Y(n782) );
  INVX1 U969 ( .A(n830), .Y(n1082) );
  INVX4 U970 ( .A(a[15]), .Y(n857) );
  BUFX2 U971 ( .A(n1075), .Y(n1034) );
  BUFX4 U972 ( .A(n321), .Y(n1035) );
  BUFX2 U973 ( .A(n1056), .Y(n1037) );
  INVX1 U974 ( .A(n1126), .Y(n1038) );
  INVX2 U975 ( .A(n947), .Y(n1073) );
  INVX2 U976 ( .A(n500), .Y(n631) );
  INVX1 U977 ( .A(n140), .Y(n227) );
  INVX1 U978 ( .A(n1046), .Y(n1040) );
  INVX1 U979 ( .A(n13), .Y(n1041) );
  INVX4 U980 ( .A(n1046), .Y(n1066) );
  INVX4 U981 ( .A(n1047), .Y(n1067) );
  INVX1 U982 ( .A(n162), .Y(n161) );
  INVX2 U983 ( .A(n1068), .Y(n1069) );
  INVX1 U984 ( .A(n153), .Y(n152) );
  INVX1 U985 ( .A(n831), .Y(n1080) );
  AND2X2 U986 ( .A(n1074), .B(n834), .Y(n1042) );
  AND2X2 U987 ( .A(n1074), .B(n834), .Y(n1043) );
  BUFX4 U988 ( .A(n320), .Y(n1044) );
  AND2X2 U989 ( .A(n16), .B(n838), .Y(n1045) );
  INVX1 U990 ( .A(n1073), .Y(n486) );
  AND2X2 U991 ( .A(n1065), .B(n836), .Y(n1046) );
  AND2X2 U992 ( .A(n1065), .B(n836), .Y(n1047) );
  AND2X2 U993 ( .A(n1060), .B(n837), .Y(n1048) );
  AND2X2 U994 ( .A(n1060), .B(n837), .Y(n1049) );
  BUFX2 U995 ( .A(n9), .Y(n1050) );
  INVX2 U996 ( .A(n1063), .Y(n1064) );
  INVX2 U997 ( .A(n1107), .Y(n1108) );
  INVX2 U998 ( .A(n1029), .Y(n1059) );
  INVX2 U999 ( .A(n6), .Y(n1052) );
  INVX1 U1000 ( .A(n137), .Y(n226) );
  INVX4 U1001 ( .A(n1077), .Y(n1078) );
  INVX1 U1002 ( .A(n967), .Y(n230) );
  INVX4 U1003 ( .A(n31), .Y(n1107) );
  INVX1 U1004 ( .A(n125), .Y(n123) );
  INVX1 U1005 ( .A(n973), .Y(n228) );
  INVX2 U1006 ( .A(n1109), .Y(n1111) );
  INVX8 U1007 ( .A(n1063), .Y(n1065) );
  INVX8 U1008 ( .A(n1068), .Y(n1070) );
  INVX8 U1009 ( .A(n1112), .Y(n1113) );
  INVX8 U1010 ( .A(n1122), .Y(n1120) );
  INVX8 U1011 ( .A(n7), .Y(n1122) );
  INVX8 U1012 ( .A(n1125), .Y(n1123) );
  INVX8 U1013 ( .A(n13), .Y(n1125) );
  INVX8 U1014 ( .A(n1128), .Y(n1126) );
  INVX8 U1015 ( .A(n19), .Y(n1128) );
  INVX2 U1016 ( .A(n99), .Y(n97) );
  INVX2 U1017 ( .A(n98), .Y(n96) );
  INVX2 U1018 ( .A(n89), .Y(n87) );
  INVX2 U1019 ( .A(n77), .Y(n75) );
  OAI22X1 U1020 ( .A(n857), .B(n1119), .C(n6), .D(n1119), .Y(n503) );
  OAI22X1 U1021 ( .A(n1050), .B(n1122), .C(n1056), .D(n1122), .Y(n500) );
  OAI22X1 U1022 ( .A(n1006), .B(n1041), .C(n1058), .D(n1041), .Y(n497) );
  INVX2 U1023 ( .A(n1059), .Y(n495) );
  OAI22X1 U1024 ( .A(n1036), .B(n1038), .C(n1062), .D(n1038), .Y(n494) );
  INVX2 U1025 ( .A(n1064), .Y(n492) );
  OAI22X1 U1026 ( .A(n1065), .B(n1130), .C(n1067), .D(n1130), .Y(n491) );
  INVX2 U1027 ( .A(n1069), .Y(n489) );
  OAI22X1 U1028 ( .A(n1070), .B(n1039), .C(n1072), .D(n1039), .Y(n488) );
  OAI22X1 U1029 ( .A(n1074), .B(n1109), .C(n1076), .D(n1109), .Y(n485) );
  OAI22X1 U1030 ( .A(n1078), .B(n858), .C(n1079), .D(n858), .Y(n482) );
  INVX2 U1031 ( .A(n325), .Y(n326) );
  INVX2 U1032 ( .A(n277), .Y(n278) );
  INVX2 U1033 ( .A(n259), .Y(n260) );
  INVX2 U1034 ( .A(n245), .Y(n246) );
  INVX2 U1035 ( .A(n235), .Y(n236) );
  INVX2 U1036 ( .A(n129), .Y(n225) );
  INVX2 U1037 ( .A(n93), .Y(n219) );
  INVX2 U1038 ( .A(n79), .Y(n217) );
  INVX2 U1039 ( .A(n71), .Y(n215) );
  INVX2 U1040 ( .A(n150), .Y(n229) );
  INVX2 U1041 ( .A(n132), .Y(n131) );
  INVX2 U1042 ( .A(n124), .Y(n122) );
  INVX2 U1043 ( .A(n120), .Y(n118) );
  INVX2 U1044 ( .A(n119), .Y(n223) );
  INVX2 U1045 ( .A(n108), .Y(n106) );
  INVX2 U1046 ( .A(n103), .Y(n101) );
endmodule


module alu_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n19, n21, n22, n23, n24, n25, n27, n29, n30, n31, n32, n33, n35,
         n37, n38, n39, n40, n41, n43, n45, n46, n47, n48, n49, n51, n53, n54,
         n55, n56, n57, n58, n60, n62, n64, n66, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n85, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155;

  FAX1 U3 ( .A(n69), .B(A[15]), .C(n13), .YC(n12), .YS(DIFF[15]) );
  FAX1 U4 ( .A(A[14]), .B(n70), .C(n14), .YC(n13), .YS(DIFF[14]) );
  FAX1 U5 ( .A(n71), .B(A[13]), .C(n15), .YC(n14), .YS(DIFF[13]) );
  FAX1 U6 ( .A(A[12]), .B(n72), .C(n16), .YC(n15), .YS(DIFF[12]) );
  FAX1 U7 ( .A(n73), .B(A[11]), .C(n58), .YC(n16), .YS(DIFF[11]) );
  XNOR2X1 U9 ( .A(n22), .B(n1), .Y(DIFF[10]) );
  AOI21X1 U10 ( .A(n154), .B(n22), .C(n19), .Y(n17) );
  NAND2X1 U13 ( .A(n21), .B(n154), .Y(n1) );
  NAND2X1 U16 ( .A(A[10]), .B(n74), .Y(n21) );
  XOR2X1 U17 ( .A(n25), .B(n2), .Y(DIFF[9]) );
  OAI21X1 U18 ( .A(n25), .B(n23), .C(n24), .Y(n22) );
  NAND2X1 U19 ( .A(n24), .B(n60), .Y(n2) );
  NOR2X1 U21 ( .A(n75), .B(A[9]), .Y(n23) );
  NAND2X1 U22 ( .A(n75), .B(A[9]), .Y(n24) );
  XNOR2X1 U23 ( .A(n150), .B(n3), .Y(DIFF[8]) );
  AOI21X1 U24 ( .A(n153), .B(n30), .C(n27), .Y(n25) );
  NAND2X1 U27 ( .A(n29), .B(n153), .Y(n3) );
  NAND2X1 U30 ( .A(A[8]), .B(n76), .Y(n29) );
  XOR2X1 U31 ( .A(n144), .B(n4), .Y(DIFF[7]) );
  OAI21X1 U32 ( .A(n33), .B(n31), .C(n32), .Y(n30) );
  NAND2X1 U33 ( .A(n32), .B(n62), .Y(n4) );
  NOR2X1 U35 ( .A(n77), .B(A[7]), .Y(n31) );
  NAND2X1 U36 ( .A(n77), .B(A[7]), .Y(n32) );
  XNOR2X1 U37 ( .A(n38), .B(n5), .Y(DIFF[6]) );
  AOI21X1 U38 ( .A(n152), .B(n38), .C(n35), .Y(n33) );
  NAND2X1 U41 ( .A(n37), .B(n152), .Y(n5) );
  NAND2X1 U44 ( .A(A[6]), .B(n78), .Y(n37) );
  XOR2X1 U45 ( .A(n41), .B(n6), .Y(DIFF[5]) );
  OAI21X1 U46 ( .A(n41), .B(n39), .C(n40), .Y(n38) );
  NAND2X1 U47 ( .A(n40), .B(n64), .Y(n6) );
  NOR2X1 U49 ( .A(n79), .B(A[5]), .Y(n39) );
  NAND2X1 U50 ( .A(n79), .B(A[5]), .Y(n40) );
  XNOR2X1 U51 ( .A(n46), .B(n7), .Y(DIFF[4]) );
  AOI21X1 U52 ( .A(n151), .B(n46), .C(n43), .Y(n41) );
  NAND2X1 U55 ( .A(n45), .B(n151), .Y(n7) );
  NAND2X1 U58 ( .A(A[4]), .B(n80), .Y(n45) );
  XOR2X1 U59 ( .A(n49), .B(n8), .Y(DIFF[3]) );
  OAI21X1 U60 ( .A(n49), .B(n47), .C(n48), .Y(n46) );
  NAND2X1 U61 ( .A(n48), .B(n66), .Y(n8) );
  NOR2X1 U63 ( .A(n81), .B(A[3]), .Y(n47) );
  NAND2X1 U64 ( .A(n81), .B(A[3]), .Y(n48) );
  XNOR2X1 U65 ( .A(n54), .B(n9), .Y(DIFF[2]) );
  AOI21X1 U66 ( .A(n145), .B(n54), .C(n51), .Y(n49) );
  NAND2X1 U69 ( .A(n53), .B(n145), .Y(n9) );
  NAND2X1 U72 ( .A(A[2]), .B(n82), .Y(n53) );
  XOR2X1 U73 ( .A(n10), .B(n57), .Y(DIFF[1]) );
  OAI21X1 U74 ( .A(n55), .B(n57), .C(n56), .Y(n54) );
  NAND2X1 U75 ( .A(n56), .B(n68), .Y(n10) );
  NOR2X1 U77 ( .A(n83), .B(A[1]), .Y(n55) );
  NAND2X1 U78 ( .A(n83), .B(A[1]), .Y(n56) );
  NOR2X1 U80 ( .A(A[0]), .B(n155), .Y(n57) );
  INVX1 U101 ( .A(B[12]), .Y(n72) );
  BUFX2 U102 ( .A(n33), .Y(n144) );
  INVX2 U103 ( .A(B[0]), .Y(n155) );
  OR2X2 U104 ( .A(A[2]), .B(n82), .Y(n145) );
  XOR2X1 U105 ( .A(B[16]), .B(n85), .Y(n146) );
  XOR2X1 U106 ( .A(n12), .B(n146), .Y(DIFF[16]) );
  NAND2X1 U107 ( .A(n12), .B(B[16]), .Y(n147) );
  NAND2X1 U108 ( .A(n12), .B(n85), .Y(n148) );
  NAND2X1 U109 ( .A(B[16]), .B(n85), .Y(n149) );
  NAND3X1 U110 ( .A(n148), .B(n147), .C(n149), .Y(n11) );
  OAI21X1 U111 ( .A(n33), .B(n31), .C(n32), .Y(n150) );
  OR2X2 U112 ( .A(A[4]), .B(n80), .Y(n151) );
  OR2X2 U113 ( .A(A[6]), .B(n78), .Y(n152) );
  OR2X2 U114 ( .A(A[8]), .B(n76), .Y(n153) );
  OR2X2 U115 ( .A(A[10]), .B(n74), .Y(n154) );
  XNOR2X1 U116 ( .A(n155), .B(A[0]), .Y(DIFF[0]) );
  INVX1 U117 ( .A(n55), .Y(n68) );
  INVX2 U118 ( .A(A[17]), .Y(n85) );
  INVX2 U119 ( .A(B[1]), .Y(n83) );
  INVX2 U120 ( .A(B[2]), .Y(n82) );
  INVX2 U121 ( .A(B[3]), .Y(n81) );
  INVX2 U122 ( .A(B[4]), .Y(n80) );
  INVX2 U123 ( .A(B[5]), .Y(n79) );
  INVX2 U124 ( .A(B[6]), .Y(n78) );
  INVX2 U125 ( .A(B[7]), .Y(n77) );
  INVX2 U126 ( .A(B[8]), .Y(n76) );
  INVX2 U127 ( .A(B[9]), .Y(n75) );
  INVX2 U128 ( .A(B[10]), .Y(n74) );
  INVX2 U129 ( .A(B[11]), .Y(n73) );
  INVX2 U130 ( .A(B[13]), .Y(n71) );
  INVX2 U131 ( .A(B[14]), .Y(n70) );
  INVX2 U132 ( .A(B[15]), .Y(n69) );
  INVX2 U133 ( .A(n47), .Y(n66) );
  INVX2 U134 ( .A(n39), .Y(n64) );
  INVX2 U135 ( .A(n31), .Y(n62) );
  INVX2 U136 ( .A(n23), .Y(n60) );
  INVX2 U137 ( .A(n17), .Y(n58) );
  INVX2 U138 ( .A(n53), .Y(n51) );
  INVX2 U139 ( .A(n45), .Y(n43) );
  INVX2 U140 ( .A(n37), .Y(n35) );
  INVX2 U141 ( .A(n29), .Y(n27) );
  INVX2 U142 ( .A(n21), .Y(n19) );
  INVX2 U143 ( .A(n11), .Y(DIFF[17]) );
endmodule


module alu_DW01_add_1 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n12, n13, n14, n15, n16, n17,
         n18, n20, n22, n23, n24, n25, n26, n28, n30, n31, n32, n33, n34, n36,
         n38, n39, n40, n41, n42, n44, n46, n47, n48, n49, n50, n52, n54, n55,
         n56, n57, n59, n60, n62, n64, n66, n68, n70, n72, n73, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146;

  FAX1 U4 ( .A(A[14]), .B(B[14]), .C(n15), .YC(n14), .YS(SUM[14]) );
  FAX1 U5 ( .A(B[13]), .B(A[13]), .C(n16), .YC(n15), .YS(SUM[13]) );
  FAX1 U6 ( .A(A[12]), .B(B[12]), .C(n17), .YC(n16), .YS(SUM[12]) );
  FAX1 U7 ( .A(B[11]), .B(A[11]), .C(n60), .YC(n17), .YS(SUM[11]) );
  XNOR2X1 U9 ( .A(n23), .B(n1), .Y(SUM[10]) );
  AOI21X1 U10 ( .A(n145), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U13 ( .A(n22), .B(n145), .Y(n1) );
  NAND2X1 U16 ( .A(A[10]), .B(B[10]), .Y(n22) );
  XOR2X1 U17 ( .A(n26), .B(n2), .Y(SUM[9]) );
  OAI21X1 U18 ( .A(n26), .B(n24), .C(n25), .Y(n23) );
  NAND2X1 U19 ( .A(n25), .B(n62), .Y(n2) );
  NOR2X1 U21 ( .A(B[9]), .B(A[9]), .Y(n24) );
  NAND2X1 U22 ( .A(B[9]), .B(A[9]), .Y(n25) );
  XNOR2X1 U23 ( .A(n31), .B(n3), .Y(SUM[8]) );
  AOI21X1 U24 ( .A(n144), .B(n31), .C(n28), .Y(n26) );
  NAND2X1 U27 ( .A(n30), .B(n144), .Y(n3) );
  NAND2X1 U30 ( .A(A[8]), .B(B[8]), .Y(n30) );
  XOR2X1 U31 ( .A(n34), .B(n4), .Y(SUM[7]) );
  OAI21X1 U32 ( .A(n32), .B(n34), .C(n33), .Y(n31) );
  NAND2X1 U33 ( .A(n33), .B(n64), .Y(n4) );
  NOR2X1 U35 ( .A(B[7]), .B(A[7]), .Y(n32) );
  NAND2X1 U36 ( .A(B[7]), .B(A[7]), .Y(n33) );
  XNOR2X1 U37 ( .A(n39), .B(n5), .Y(SUM[6]) );
  AOI21X1 U38 ( .A(n143), .B(n39), .C(n36), .Y(n34) );
  NAND2X1 U41 ( .A(n38), .B(n143), .Y(n5) );
  NAND2X1 U44 ( .A(A[6]), .B(B[6]), .Y(n38) );
  XOR2X1 U45 ( .A(n42), .B(n6), .Y(SUM[5]) );
  OAI21X1 U46 ( .A(n42), .B(n40), .C(n41), .Y(n39) );
  NAND2X1 U47 ( .A(n41), .B(n66), .Y(n6) );
  NOR2X1 U49 ( .A(B[5]), .B(A[5]), .Y(n40) );
  NAND2X1 U50 ( .A(B[5]), .B(A[5]), .Y(n41) );
  XNOR2X1 U51 ( .A(n47), .B(n7), .Y(SUM[4]) );
  AOI21X1 U52 ( .A(n142), .B(n47), .C(n44), .Y(n42) );
  NAND2X1 U55 ( .A(n46), .B(n142), .Y(n7) );
  NAND2X1 U58 ( .A(A[4]), .B(B[4]), .Y(n46) );
  XOR2X1 U59 ( .A(n50), .B(n8), .Y(SUM[3]) );
  OAI21X1 U60 ( .A(n50), .B(n48), .C(n49), .Y(n47) );
  NAND2X1 U61 ( .A(n49), .B(n68), .Y(n8) );
  NOR2X1 U63 ( .A(B[3]), .B(A[3]), .Y(n48) );
  NAND2X1 U64 ( .A(B[3]), .B(A[3]), .Y(n49) );
  XNOR2X1 U65 ( .A(n55), .B(n9), .Y(SUM[2]) );
  AOI21X1 U66 ( .A(n141), .B(n55), .C(n52), .Y(n50) );
  NAND2X1 U69 ( .A(n54), .B(n141), .Y(n9) );
  NAND2X1 U72 ( .A(A[2]), .B(B[2]), .Y(n54) );
  XOR2X1 U73 ( .A(n10), .B(n59), .Y(SUM[1]) );
  OAI21X1 U74 ( .A(n56), .B(n59), .C(n57), .Y(n55) );
  NAND2X1 U75 ( .A(n57), .B(n70), .Y(n10) );
  NOR2X1 U77 ( .A(B[1]), .B(A[1]), .Y(n56) );
  NAND2X1 U78 ( .A(B[1]), .B(A[1]), .Y(n57) );
  NAND2X1 U83 ( .A(A[0]), .B(B[0]), .Y(n59) );
  OR2X1 U89 ( .A(A[0]), .B(B[0]), .Y(n146) );
  AND2X2 U90 ( .A(n59), .B(n146), .Y(SUM[0]) );
  XOR2X1 U91 ( .A(B[15]), .B(A[15]), .Y(n133) );
  XOR2X1 U92 ( .A(n133), .B(n14), .Y(SUM[15]) );
  NAND2X1 U93 ( .A(B[15]), .B(A[15]), .Y(n134) );
  NAND2X1 U94 ( .A(B[15]), .B(n14), .Y(n135) );
  NAND2X1 U95 ( .A(A[15]), .B(n14), .Y(n136) );
  NAND3X1 U96 ( .A(n134), .B(n135), .C(n136), .Y(n13) );
  XOR2X1 U97 ( .A(n72), .B(n73), .Y(n137) );
  XOR2X1 U98 ( .A(n137), .B(n13), .Y(SUM[16]) );
  NAND2X1 U99 ( .A(n72), .B(n73), .Y(n138) );
  NAND2X1 U100 ( .A(n72), .B(n13), .Y(n139) );
  NAND2X1 U101 ( .A(n73), .B(n13), .Y(n140) );
  NAND3X1 U102 ( .A(n138), .B(n139), .C(n140), .Y(n12) );
  OR2X2 U103 ( .A(A[2]), .B(B[2]), .Y(n141) );
  OR2X2 U104 ( .A(A[4]), .B(B[4]), .Y(n142) );
  OR2X2 U105 ( .A(A[8]), .B(B[8]), .Y(n144) );
  OR2X2 U106 ( .A(A[10]), .B(B[10]), .Y(n145) );
  OR2X1 U107 ( .A(A[6]), .B(B[6]), .Y(n143) );
  INVX2 U108 ( .A(A[17]), .Y(n73) );
  INVX2 U109 ( .A(B[17]), .Y(n72) );
  INVX2 U110 ( .A(n56), .Y(n70) );
  INVX2 U111 ( .A(n48), .Y(n68) );
  INVX2 U112 ( .A(n40), .Y(n66) );
  INVX2 U113 ( .A(n32), .Y(n64) );
  INVX2 U114 ( .A(n24), .Y(n62) );
  INVX2 U115 ( .A(n18), .Y(n60) );
  INVX2 U116 ( .A(n54), .Y(n52) );
  INVX2 U117 ( .A(n46), .Y(n44) );
  INVX2 U118 ( .A(n38), .Y(n36) );
  INVX2 U119 ( .A(n30), .Y(n28) );
  INVX2 U120 ( .A(n22), .Y(n20) );
  INVX2 U121 ( .A(n12), .Y(SUM[17]) );
endmodule


module alu ( src1_data, src2_data, alu_op, result, overflow );
  input [16:0] src1_data;
  input [16:0] src2_data;
  input [1:0] alu_op;
  output [16:0] result;
  output overflow;
  wire   N26, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69;
  wire   [46:30] full_mult;
  wire   [17:0] large_sum;
  wire   [17:0] large_dif;
  tri   [1:0] alu_op;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29;

  alu_DW_mult_uns_1 mult_35 ( .a({src1_data[15:11], n1, src1_data[9:8], n23, 
        src1_data[6], n21, src1_data[4], n19, src1_data[2], n17, n16, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0}), .b({n13, src2_data[14], n11, src2_data[12], n9, 
        src2_data[10:0]}), .product({N26, full_mult[45:30], 
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29}) );
  alu_DW01_sub_1 sub_44 ( .A({src1_data[16], src1_data[16:11], n1, n25, 
        src1_data[8], n23, src1_data[6], n21, src1_data[4], n19, src1_data[2], 
        n2, n16}), .B({src2_data[16], src2_data[16], n13, src2_data[14], n11, 
        src2_data[12], n9, src2_data[10:0]}), .CI(1'b0), .DIFF(large_dif) );
  alu_DW01_add_1 add_41 ( .A({src1_data[16], src1_data[16:13], n14, 
        src1_data[11], n1, n25, src1_data[8], n23, src1_data[6], n21, 
        src1_data[4], n19, src1_data[2], n2, n16}), .B({src2_data[16], 
        src2_data[16], n13, src2_data[14], n11, src2_data[12], n9, 
        src2_data[10:0]}), .CI(1'b0), .SUM(large_sum) );
  BUFX4 U3 ( .A(src1_data[10]), .Y(n1) );
  BUFX4 U4 ( .A(src1_data[1]), .Y(n2) );
  INVX4 U6 ( .A(n8), .Y(n9) );
  INVX2 U7 ( .A(src2_data[11]), .Y(n8) );
  INVX4 U9 ( .A(n10), .Y(n11) );
  INVX4 U10 ( .A(n20), .Y(n19) );
  INVX2 U11 ( .A(src1_data[3]), .Y(n20) );
  INVX2 U12 ( .A(src1_data[5]), .Y(n22) );
  INVX2 U13 ( .A(src1_data[7]), .Y(n24) );
  INVX4 U14 ( .A(n12), .Y(n13) );
  INVX2 U15 ( .A(src2_data[15]), .Y(n12) );
  INVX4 U16 ( .A(n15), .Y(n16) );
  INVX2 U17 ( .A(src1_data[0]), .Y(n15) );
  INVX1 U18 ( .A(n26), .Y(n25) );
  INVX2 U19 ( .A(src1_data[9]), .Y(n26) );
  AND2X2 U20 ( .A(n1), .B(n5), .Y(n3) );
  AND2X1 U21 ( .A(n7), .B(full_mult[40]), .Y(n4) );
  NOR2X1 U22 ( .A(n3), .B(n4), .Y(n55) );
  INVX2 U23 ( .A(src2_data[13]), .Y(n10) );
  INVX2 U24 ( .A(n69), .Y(n64) );
  AND2X2 U25 ( .A(n33), .B(n32), .Y(n5) );
  AND2X2 U26 ( .A(alu_op[1]), .B(n32), .Y(n6) );
  AND2X2 U27 ( .A(alu_op[0]), .B(alu_op[1]), .Y(n7) );
  BUFX2 U28 ( .A(src1_data[12]), .Y(n14) );
  INVX4 U29 ( .A(n18), .Y(n17) );
  INVX2 U30 ( .A(n2), .Y(n18) );
  INVX8 U31 ( .A(n22), .Y(n21) );
  INVX8 U32 ( .A(n24), .Y(n23) );
  INVX2 U33 ( .A(large_sum[16]), .Y(n68) );
  XOR2X1 U34 ( .A(n68), .B(large_sum[17]), .Y(n31) );
  INVX2 U35 ( .A(alu_op[1]), .Y(n33) );
  NAND2X1 U36 ( .A(alu_op[0]), .B(n33), .Y(n69) );
  INVX2 U37 ( .A(alu_op[0]), .Y(n32) );
  XOR2X1 U38 ( .A(large_dif[16]), .B(large_dif[17]), .Y(n29) );
  AOI22X1 U39 ( .A(N26), .B(n7), .C(n6), .D(n29), .Y(n30) );
  OAI21X1 U40 ( .A(n31), .B(n69), .C(n30), .Y(overflow) );
  AOI22X1 U41 ( .A(n16), .B(n5), .C(full_mult[30]), .D(n7), .Y(n35) );
  AOI22X1 U42 ( .A(large_dif[0]), .B(n6), .C(large_sum[0]), .D(n64), .Y(n34)
         );
  NAND2X1 U43 ( .A(n35), .B(n34), .Y(result[0]) );
  AOI22X1 U44 ( .A(n2), .B(n5), .C(full_mult[31]), .D(n7), .Y(n37) );
  AOI22X1 U45 ( .A(large_dif[1]), .B(n6), .C(large_sum[1]), .D(n64), .Y(n36)
         );
  NAND2X1 U46 ( .A(n37), .B(n36), .Y(result[1]) );
  AOI22X1 U47 ( .A(src1_data[2]), .B(n5), .C(full_mult[32]), .D(n7), .Y(n39)
         );
  AOI22X1 U48 ( .A(large_dif[2]), .B(n6), .C(large_sum[2]), .D(n64), .Y(n38)
         );
  NAND2X1 U49 ( .A(n39), .B(n38), .Y(result[2]) );
  AOI22X1 U50 ( .A(n19), .B(n5), .C(full_mult[33]), .D(n7), .Y(n41) );
  AOI22X1 U51 ( .A(large_dif[3]), .B(n6), .C(large_sum[3]), .D(n64), .Y(n40)
         );
  NAND2X1 U52 ( .A(n41), .B(n40), .Y(result[3]) );
  AOI22X1 U53 ( .A(src1_data[4]), .B(n5), .C(full_mult[34]), .D(n7), .Y(n43)
         );
  AOI22X1 U54 ( .A(large_dif[4]), .B(n6), .C(large_sum[4]), .D(n64), .Y(n42)
         );
  NAND2X1 U55 ( .A(n43), .B(n42), .Y(result[4]) );
  AOI22X1 U56 ( .A(n21), .B(n5), .C(full_mult[35]), .D(n7), .Y(n45) );
  AOI22X1 U57 ( .A(large_dif[5]), .B(n6), .C(large_sum[5]), .D(n64), .Y(n44)
         );
  NAND2X1 U58 ( .A(n45), .B(n44), .Y(result[5]) );
  AOI22X1 U59 ( .A(src1_data[6]), .B(n5), .C(full_mult[36]), .D(n7), .Y(n47)
         );
  AOI22X1 U60 ( .A(large_dif[6]), .B(n6), .C(large_sum[6]), .D(n64), .Y(n46)
         );
  NAND2X1 U61 ( .A(n47), .B(n46), .Y(result[6]) );
  AOI22X1 U62 ( .A(n23), .B(n5), .C(full_mult[37]), .D(n7), .Y(n49) );
  AOI22X1 U63 ( .A(large_dif[7]), .B(n6), .C(large_sum[7]), .D(n64), .Y(n48)
         );
  NAND2X1 U64 ( .A(n49), .B(n48), .Y(result[7]) );
  AOI22X1 U65 ( .A(src1_data[8]), .B(n5), .C(full_mult[38]), .D(n7), .Y(n51)
         );
  AOI22X1 U66 ( .A(large_dif[8]), .B(n6), .C(large_sum[8]), .D(n64), .Y(n50)
         );
  NAND2X1 U67 ( .A(n51), .B(n50), .Y(result[8]) );
  AOI22X1 U68 ( .A(n25), .B(n5), .C(full_mult[39]), .D(n7), .Y(n53) );
  AOI22X1 U69 ( .A(large_dif[9]), .B(n6), .C(large_sum[9]), .D(n64), .Y(n52)
         );
  NAND2X1 U70 ( .A(n53), .B(n52), .Y(result[9]) );
  AOI22X1 U71 ( .A(large_dif[10]), .B(n6), .C(large_sum[10]), .D(n64), .Y(n54)
         );
  NAND2X1 U72 ( .A(n55), .B(n54), .Y(result[10]) );
  AOI22X1 U73 ( .A(src1_data[11]), .B(n5), .C(full_mult[41]), .D(n7), .Y(n57)
         );
  AOI22X1 U74 ( .A(large_dif[11]), .B(n6), .C(large_sum[11]), .D(n64), .Y(n56)
         );
  NAND2X1 U75 ( .A(n57), .B(n56), .Y(result[11]) );
  AOI22X1 U76 ( .A(n14), .B(n5), .C(full_mult[42]), .D(n7), .Y(n59) );
  AOI22X1 U77 ( .A(large_dif[12]), .B(n6), .C(large_sum[12]), .D(n64), .Y(n58)
         );
  NAND2X1 U78 ( .A(n59), .B(n58), .Y(result[12]) );
  AOI22X1 U79 ( .A(src1_data[13]), .B(n5), .C(full_mult[43]), .D(n7), .Y(n61)
         );
  AOI22X1 U80 ( .A(large_dif[13]), .B(n6), .C(large_sum[13]), .D(n64), .Y(n60)
         );
  NAND2X1 U81 ( .A(n61), .B(n60), .Y(result[13]) );
  AOI22X1 U82 ( .A(src1_data[14]), .B(n5), .C(full_mult[44]), .D(n7), .Y(n63)
         );
  AOI22X1 U83 ( .A(large_dif[14]), .B(n6), .C(large_sum[14]), .D(n64), .Y(n62)
         );
  NAND2X1 U84 ( .A(n63), .B(n62), .Y(result[14]) );
  AOI22X1 U85 ( .A(src1_data[15]), .B(n5), .C(full_mult[45]), .D(n7), .Y(n66)
         );
  AOI22X1 U86 ( .A(large_dif[15]), .B(n6), .C(large_sum[15]), .D(n64), .Y(n65)
         );
  NAND2X1 U87 ( .A(n66), .B(n65), .Y(result[15]) );
  AOI22X1 U88 ( .A(src1_data[16]), .B(n5), .C(large_dif[16]), .D(n6), .Y(n67)
         );
  OAI21X1 U89 ( .A(n69), .B(n68), .C(n67), .Y(result[16]) );
endmodule


module flex_sreg_NUM_BITS17_15 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n15), .Y(n38) );
  INVX1 U3 ( .A(n5), .Y(n55) );
  INVX1 U4 ( .A(n10), .Y(n48) );
  INVX1 U5 ( .A(n6), .Y(n54) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(n4), .Y(n3) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  MUX2X1 U10 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  MUX2X1 U11 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(n6) );
  MUX2X1 U12 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U13 ( .A(n7), .Y(n53) );
  MUX2X1 U14 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U15 ( .A(n8), .Y(n52) );
  MUX2X1 U16 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U17 ( .A(n9), .Y(n50) );
  MUX2X1 U18 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  MUX2X1 U19 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U20 ( .A(n11), .Y(n46) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U22 ( .A(n12), .Y(n44) );
  MUX2X1 U23 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U24 ( .A(n13), .Y(n42) );
  MUX2X1 U25 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U26 ( .A(n14), .Y(n40) );
  MUX2X1 U27 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(n2), .Y(n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_14 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n15), .Y(n38) );
  INVX1 U3 ( .A(n10), .Y(n48) );
  INVX1 U4 ( .A(n6), .Y(n54) );
  INVX1 U5 ( .A(n5), .Y(n55) );
  INVX2 U6 ( .A(n4), .Y(n3) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  INVX2 U9 ( .A(write_enable), .Y(n1) );
  MUX2X1 U10 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  MUX2X1 U11 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(n6) );
  MUX2X1 U12 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U13 ( .A(n7), .Y(n53) );
  MUX2X1 U14 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U15 ( .A(n8), .Y(n52) );
  MUX2X1 U16 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U17 ( .A(n9), .Y(n50) );
  MUX2X1 U18 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  MUX2X1 U19 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U20 ( .A(n11), .Y(n46) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(n2), .Y(n12) );
  INVX2 U22 ( .A(n12), .Y(n44) );
  MUX2X1 U23 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U24 ( .A(n13), .Y(n42) );
  MUX2X1 U25 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U26 ( .A(n14), .Y(n40) );
  MUX2X1 U27 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_13 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n10), .Y(n48) );
  INVX1 U3 ( .A(n6), .Y(n54) );
  INVX1 U4 ( .A(n5), .Y(n55) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(n4), .Y(n3) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  MUX2X1 U9 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  MUX2X1 U10 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(n6) );
  MUX2X1 U11 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U12 ( .A(n7), .Y(n53) );
  MUX2X1 U13 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U14 ( .A(n8), .Y(n52) );
  MUX2X1 U15 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U16 ( .A(n9), .Y(n50) );
  MUX2X1 U17 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(n2), .Y(n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_12 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n10), .Y(n48) );
  INVX1 U3 ( .A(n6), .Y(n54) );
  INVX1 U4 ( .A(n5), .Y(n55) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(n_reset), .Y(n4) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  MUX2X1 U9 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  MUX2X1 U10 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(n6) );
  MUX2X1 U11 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U12 ( .A(n7), .Y(n53) );
  MUX2X1 U13 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U14 ( .A(n8), .Y(n52) );
  MUX2X1 U15 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U16 ( .A(n9), .Y(n50) );
  MUX2X1 U17 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(n2), .Y(n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_11 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n10), .Y(n48) );
  INVX1 U3 ( .A(n6), .Y(n54) );
  INVX1 U4 ( .A(n5), .Y(n55) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(n4), .Y(n3) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  MUX2X1 U9 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  MUX2X1 U10 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(n6) );
  MUX2X1 U11 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U12 ( .A(n7), .Y(n53) );
  MUX2X1 U13 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U14 ( .A(n8), .Y(n52) );
  MUX2X1 U15 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U16 ( .A(n9), .Y(n50) );
  MUX2X1 U17 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(n2), .Y(n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_10 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n10), .Y(n48) );
  INVX1 U3 ( .A(n6), .Y(n54) );
  INVX1 U4 ( .A(n5), .Y(n55) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(n_reset), .Y(n4) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  MUX2X1 U9 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  MUX2X1 U10 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(n6) );
  MUX2X1 U11 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U12 ( .A(n7), .Y(n53) );
  MUX2X1 U13 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U14 ( .A(n8), .Y(n52) );
  MUX2X1 U15 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U16 ( .A(n9), .Y(n50) );
  MUX2X1 U17 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(n2), .Y(n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_9 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n10), .Y(n48) );
  INVX1 U3 ( .A(n6), .Y(n54) );
  INVX1 U4 ( .A(n5), .Y(n55) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(n4), .Y(n3) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  MUX2X1 U9 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  MUX2X1 U10 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(n6) );
  MUX2X1 U11 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U12 ( .A(n7), .Y(n53) );
  MUX2X1 U13 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U14 ( .A(n8), .Y(n52) );
  MUX2X1 U15 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U16 ( .A(n9), .Y(n50) );
  MUX2X1 U17 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(n2), .Y(n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_8 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n10), .Y(n48) );
  INVX1 U3 ( .A(n6), .Y(n54) );
  INVX1 U4 ( .A(n5), .Y(n55) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(n_reset), .Y(n4) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  MUX2X1 U9 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  MUX2X1 U10 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(n6) );
  MUX2X1 U11 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U12 ( .A(n7), .Y(n53) );
  MUX2X1 U13 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U14 ( .A(n8), .Y(n52) );
  MUX2X1 U15 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U16 ( .A(n9), .Y(n50) );
  MUX2X1 U17 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(n2), .Y(n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_7 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n10), .Y(n48) );
  INVX1 U3 ( .A(n6), .Y(n54) );
  INVX1 U4 ( .A(n5), .Y(n55) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(n4), .Y(n3) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  MUX2X1 U9 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  MUX2X1 U10 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(n6) );
  MUX2X1 U11 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U12 ( .A(n7), .Y(n53) );
  MUX2X1 U13 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U14 ( .A(n8), .Y(n52) );
  MUX2X1 U15 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U16 ( .A(n9), .Y(n50) );
  MUX2X1 U17 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(n2), .Y(n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_6 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n10), .Y(n48) );
  INVX1 U3 ( .A(n6), .Y(n54) );
  INVX1 U4 ( .A(n5), .Y(n55) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(n_reset), .Y(n4) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  MUX2X1 U9 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  MUX2X1 U10 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(n6) );
  MUX2X1 U11 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U12 ( .A(n7), .Y(n53) );
  MUX2X1 U13 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U14 ( .A(n8), .Y(n52) );
  MUX2X1 U15 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U16 ( .A(n9), .Y(n50) );
  MUX2X1 U17 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(n2), .Y(n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_5 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n10), .Y(n48) );
  INVX1 U3 ( .A(n6), .Y(n54) );
  INVX1 U4 ( .A(n5), .Y(n55) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(n4), .Y(n3) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  MUX2X1 U9 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  MUX2X1 U10 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(n6) );
  MUX2X1 U11 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U12 ( .A(n7), .Y(n53) );
  MUX2X1 U13 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U14 ( .A(n8), .Y(n52) );
  MUX2X1 U15 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U16 ( .A(n9), .Y(n50) );
  MUX2X1 U17 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(n2), .Y(n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_4 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n10), .Y(n48) );
  INVX1 U3 ( .A(n6), .Y(n54) );
  INVX1 U4 ( .A(n5), .Y(n55) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(n_reset), .Y(n4) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  MUX2X1 U9 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  MUX2X1 U10 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(n6) );
  MUX2X1 U11 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U12 ( .A(n7), .Y(n53) );
  MUX2X1 U13 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U14 ( .A(n8), .Y(n52) );
  MUX2X1 U15 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U16 ( .A(n9), .Y(n50) );
  MUX2X1 U17 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(n2), .Y(n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_3 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n10), .Y(n48) );
  INVX1 U3 ( .A(n6), .Y(n54) );
  INVX1 U4 ( .A(n5), .Y(n55) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(n4), .Y(n3) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  MUX2X1 U9 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  MUX2X1 U10 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(n6) );
  MUX2X1 U11 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U12 ( .A(n7), .Y(n53) );
  MUX2X1 U13 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U14 ( .A(n8), .Y(n52) );
  MUX2X1 U15 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U16 ( .A(n9), .Y(n50) );
  MUX2X1 U17 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(n2), .Y(n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_2 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n10), .Y(n48) );
  INVX1 U3 ( .A(n6), .Y(n54) );
  INVX1 U4 ( .A(n5), .Y(n55) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(n_reset), .Y(n4) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  MUX2X1 U9 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  MUX2X1 U10 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(n6) );
  MUX2X1 U11 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U12 ( .A(n7), .Y(n53) );
  MUX2X1 U13 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U14 ( .A(n8), .Y(n52) );
  MUX2X1 U15 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U16 ( .A(n9), .Y(n50) );
  MUX2X1 U17 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(n2), .Y(n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_1 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n10), .Y(n48) );
  INVX1 U3 ( .A(n6), .Y(n54) );
  INVX1 U4 ( .A(n5), .Y(n55) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(n4), .Y(n3) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  MUX2X1 U9 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  MUX2X1 U10 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(n6) );
  MUX2X1 U11 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U12 ( .A(n7), .Y(n53) );
  MUX2X1 U13 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U14 ( .A(n8), .Y(n52) );
  MUX2X1 U15 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U16 ( .A(n9), .Y(n50) );
  MUX2X1 U17 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(n2), .Y(n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_0 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n10), .Y(n48) );
  INVX1 U3 ( .A(n6), .Y(n54) );
  INVX1 U4 ( .A(n5), .Y(n55) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(n_reset), .Y(n4) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  MUX2X1 U9 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  MUX2X1 U10 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(n6) );
  MUX2X1 U11 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U12 ( .A(n7), .Y(n53) );
  MUX2X1 U13 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U14 ( .A(n8), .Y(n52) );
  MUX2X1 U15 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U16 ( .A(n9), .Y(n50) );
  MUX2X1 U17 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  MUX2X1 U18 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U19 ( .A(n11), .Y(n46) );
  MUX2X1 U20 ( .B(current_value[7]), .A(new_value[7]), .S(n2), .Y(n12) );
  INVX2 U21 ( .A(n12), .Y(n44) );
  MUX2X1 U22 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U23 ( .A(n13), .Y(n42) );
  MUX2X1 U24 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U25 ( .A(n14), .Y(n40) );
  MUX2X1 U26 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  INVX2 U27 ( .A(n15), .Y(n38) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n36) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module register_file ( clk, n_reset, w_en, r1_sel, r2_sel, w_sel, w_data, 
        r1_data, r2_data, outreg_data );
  input [3:0] r1_sel;
  input [3:0] r2_sel;
  input [3:0] w_sel;
  input [16:0] w_data;
  output [16:0] r1_data;
  output [16:0] r2_data;
  output [16:0] outreg_data;
  input clk, n_reset, w_en;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, \regs_matrix[15][16] ,
         \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] ,
         \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] ,
         \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] ,
         \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] ,
         \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] ,
         \regs_matrix[15][0] , \regs_matrix[14][16] , \regs_matrix[14][15] ,
         \regs_matrix[14][14] , \regs_matrix[14][13] , \regs_matrix[14][12] ,
         \regs_matrix[14][11] , \regs_matrix[14][10] , \regs_matrix[14][9] ,
         \regs_matrix[14][8] , \regs_matrix[14][7] , \regs_matrix[14][6] ,
         \regs_matrix[14][5] , \regs_matrix[14][4] , \regs_matrix[14][3] ,
         \regs_matrix[14][2] , \regs_matrix[14][1] , \regs_matrix[14][0] ,
         \regs_matrix[13][16] , \regs_matrix[13][15] , \regs_matrix[13][14] ,
         \regs_matrix[13][13] , \regs_matrix[13][12] , \regs_matrix[13][11] ,
         \regs_matrix[13][10] , \regs_matrix[13][9] , \regs_matrix[13][8] ,
         \regs_matrix[13][7] , \regs_matrix[13][6] , \regs_matrix[13][5] ,
         \regs_matrix[13][4] , \regs_matrix[13][3] , \regs_matrix[13][2] ,
         \regs_matrix[13][1] , \regs_matrix[13][0] , \regs_matrix[12][16] ,
         \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] ,
         \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] ,
         \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] ,
         \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] ,
         \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] ,
         \regs_matrix[12][0] , \regs_matrix[11][16] , \regs_matrix[11][15] ,
         \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] ,
         \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] ,
         \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] ,
         \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] ,
         \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] ,
         \regs_matrix[10][16] , \regs_matrix[10][15] , \regs_matrix[10][14] ,
         \regs_matrix[10][13] , \regs_matrix[10][12] , \regs_matrix[10][11] ,
         \regs_matrix[10][10] , \regs_matrix[10][9] , \regs_matrix[10][8] ,
         \regs_matrix[10][7] , \regs_matrix[10][6] , \regs_matrix[10][5] ,
         \regs_matrix[10][4] , \regs_matrix[10][3] , \regs_matrix[10][2] ,
         \regs_matrix[10][1] , \regs_matrix[10][0] , \regs_matrix[9][16] ,
         \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] ,
         \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] ,
         \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] ,
         \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] ,
         \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] ,
         \regs_matrix[9][0] , \regs_matrix[8][16] , \regs_matrix[8][15] ,
         \regs_matrix[8][14] , \regs_matrix[8][13] , \regs_matrix[8][12] ,
         \regs_matrix[8][11] , \regs_matrix[8][10] , \regs_matrix[8][9] ,
         \regs_matrix[8][8] , \regs_matrix[8][7] , \regs_matrix[8][6] ,
         \regs_matrix[8][5] , \regs_matrix[8][4] , \regs_matrix[8][3] ,
         \regs_matrix[8][2] , \regs_matrix[8][1] , \regs_matrix[8][0] ,
         \regs_matrix[7][16] , \regs_matrix[7][15] , \regs_matrix[7][14] ,
         \regs_matrix[7][13] , \regs_matrix[7][12] , \regs_matrix[7][11] ,
         \regs_matrix[7][10] , \regs_matrix[7][9] , \regs_matrix[7][8] ,
         \regs_matrix[7][7] , \regs_matrix[7][6] , \regs_matrix[7][5] ,
         \regs_matrix[7][4] , \regs_matrix[7][3] , \regs_matrix[7][2] ,
         \regs_matrix[7][1] , \regs_matrix[7][0] , \regs_matrix[6][16] ,
         \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] ,
         \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] ,
         \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] ,
         \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] ,
         \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] ,
         \regs_matrix[6][0] , \regs_matrix[5][16] , \regs_matrix[5][15] ,
         \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] ,
         \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] ,
         \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] ,
         \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] ,
         \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] ,
         \regs_matrix[4][16] , \regs_matrix[4][15] , \regs_matrix[4][14] ,
         \regs_matrix[4][13] , \regs_matrix[4][12] , \regs_matrix[4][11] ,
         \regs_matrix[4][10] , \regs_matrix[4][9] , \regs_matrix[4][8] ,
         \regs_matrix[4][7] , \regs_matrix[4][6] , \regs_matrix[4][5] ,
         \regs_matrix[4][4] , \regs_matrix[4][3] , \regs_matrix[4][2] ,
         \regs_matrix[4][1] , \regs_matrix[4][0] , \regs_matrix[3][16] ,
         \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] ,
         \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] ,
         \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] ,
         \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] ,
         \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] ,
         \regs_matrix[3][0] , \regs_matrix[2][16] , \regs_matrix[2][15] ,
         \regs_matrix[2][14] , \regs_matrix[2][13] , \regs_matrix[2][12] ,
         \regs_matrix[2][11] , \regs_matrix[2][10] , \regs_matrix[2][9] ,
         \regs_matrix[2][8] , \regs_matrix[2][7] , \regs_matrix[2][6] ,
         \regs_matrix[2][5] , \regs_matrix[2][4] , \regs_matrix[2][3] ,
         \regs_matrix[2][2] , \regs_matrix[2][1] , \regs_matrix[2][0] ,
         \regs_matrix[1][16] , \regs_matrix[1][15] , \regs_matrix[1][14] ,
         \regs_matrix[1][13] , \regs_matrix[1][12] , \regs_matrix[1][11] ,
         \regs_matrix[1][10] , \regs_matrix[1][9] , \regs_matrix[1][8] ,
         \regs_matrix[1][7] , \regs_matrix[1][6] , \regs_matrix[1][5] ,
         \regs_matrix[1][4] , \regs_matrix[1][3] , \regs_matrix[1][2] ,
         \regs_matrix[1][1] , \regs_matrix[1][0] , n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n1, n2, n3, n4, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456,
         n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467,
         n468, n469, n470, n471, n472, n473, n474, n475, n476, n477, n478,
         n479, n480, n481, n482, n483, n484, n485, n486, n487, n488, n489,
         n490, n491, n492, n493, n494, n495, n496, n497, n498, n499, n500,
         n501, n502, n503, n504, n505, n506, n507, n508, n509, n510, n511,
         n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, n522,
         n523, n524, n525, n526, n527, n528, n529, n530, n531, n532, n533,
         n534, n535, n536, n537, n538, n539, n540, n541, n542, n543, n544,
         n545, n546, n547, n548, n549, n550, n551, n552, n553, n554, n555,
         n556, n557, n558, n559, n560, n561, n562, n563, n564, n565, n566,
         n567, n568, n569, n570, n571, n572, n573, n574, n575, n576, n577,
         n578, n579, n580, n581, n582, n583, n584, n585, n586, n587, n588,
         n589, n590, n591, n592, n593, n594, n595, n596, n597, n598, n599,
         n600, n601, n602, n603, n604, n605, n606, n607, n608, n609, n610,
         n611, n612, n613, n614, n615, n616, n617, n618, n619, n620, n621,
         n622, n623, n624, n625, n626, n627, n628, n629, n630, n631, n632,
         n633, n634, n635, n636, n637, n638, n639, n640, n641, n642, n643,
         n644, n645, n646, n647, n648, n649, n650, n651, n652, n653, n654,
         n655, n656, n657, n658, n659, n660, n661, n662, n663, n664, n665,
         n666, n667, n668, n669, n670, n671, n672, n673, n674, n675, n676,
         n677, n678, n679, n680, n681, n682, n683, n684, n685, n686, n687,
         n688, n689, n690, n691, n692, n693, n694, n695, n696, n697, n698,
         n699, n700, n701, n702, n703, n704, n705, n706, n707, n708, n709,
         n710, n711, n712, n713, n714, n715, n716, n717, n718, n719, n720,
         n721, n722, n723, n724, n725, n726, n727, n728, n729, n730, n731,
         n732, n733, n734, n735, n736, n737, n738, n739, n740, n741, n742,
         n743, n744, n745, n746, n747, n748, n749, n750, n751, n752, n753,
         n754, n755, n756, n757, n758, n759, n760, n761, n762, n763, n764,
         n765, n766, n767, n768, n769, n770, n771, n772, n773, n774;
  wire   [15:0] write_enables;
  tri   w_en;
  assign N10 = r1_sel[0];
  assign N11 = r1_sel[1];
  assign N12 = r1_sel[2];
  assign N13 = r1_sel[3];
  assign N14 = r2_sel[0];
  assign N15 = r2_sel[1];
  assign N16 = r2_sel[2];
  assign N17 = r2_sel[3];

  NOR2X1 U6 ( .A(n5), .B(n6), .Y(write_enables[9]) );
  NOR2X1 U7 ( .A(n6), .B(n7), .Y(write_enables[8]) );
  NOR2X1 U8 ( .A(n8), .B(n9), .Y(write_enables[7]) );
  NOR2X1 U9 ( .A(n8), .B(n10), .Y(write_enables[6]) );
  NOR2X1 U10 ( .A(n9), .B(n11), .Y(write_enables[5]) );
  NOR2X1 U11 ( .A(n10), .B(n11), .Y(write_enables[4]) );
  NOR2X1 U12 ( .A(n9), .B(n12), .Y(write_enables[3]) );
  NOR2X1 U13 ( .A(n10), .B(n12), .Y(write_enables[2]) );
  NOR2X1 U14 ( .A(n6), .B(n9), .Y(write_enables[1]) );
  NAND3X1 U15 ( .A(w_en), .B(n772), .C(w_sel[0]), .Y(n9) );
  NOR2X1 U16 ( .A(n5), .B(n8), .Y(write_enables[15]) );
  NOR2X1 U17 ( .A(n7), .B(n8), .Y(write_enables[14]) );
  NAND2X1 U18 ( .A(w_sel[2]), .B(w_sel[1]), .Y(n8) );
  NOR2X1 U19 ( .A(n5), .B(n11), .Y(write_enables[13]) );
  NOR2X1 U20 ( .A(n7), .B(n11), .Y(write_enables[12]) );
  NAND2X1 U21 ( .A(w_sel[2]), .B(n773), .Y(n11) );
  NOR2X1 U22 ( .A(n5), .B(n12), .Y(write_enables[11]) );
  NAND3X1 U23 ( .A(w_sel[0]), .B(w_en), .C(w_sel[3]), .Y(n5) );
  NOR2X1 U24 ( .A(n7), .B(n12), .Y(write_enables[10]) );
  NAND2X1 U25 ( .A(w_sel[1]), .B(n774), .Y(n12) );
  NAND2X1 U26 ( .A(n13), .B(w_sel[3]), .Y(n7) );
  NOR2X1 U27 ( .A(n6), .B(n10), .Y(write_enables[0]) );
  NAND2X1 U28 ( .A(n13), .B(n772), .Y(n10) );
  NOR2X1 U29 ( .A(n771), .B(w_sel[0]), .Y(n13) );
  NAND2X1 U30 ( .A(n773), .B(n774), .Y(n6) );
  flex_sreg_NUM_BITS17_15 \genblk1[0].REGX  ( .clk(clk), .n_reset(n770), 
        .write_enable(write_enables[0]), .new_value({w_data[16], n762, n759, 
        n756, n72, n751, n748, n745, n742, n739, n736, n734, n731, n728, n725, 
        n723, n720}), .current_value(outreg_data) );
  flex_sreg_NUM_BITS17_14 \genblk1[1].REGX  ( .clk(clk), .n_reset(n763), 
        .write_enable(write_enables[1]), .new_value({w_data[16], n69, n758, 
        n755, n71, n75, n73, n744, n741, n738, n736, n733, n730, n727, n725, 
        n722, n720}), .current_value({\regs_matrix[1][16] , 
        \regs_matrix[1][15] , \regs_matrix[1][14] , \regs_matrix[1][13] , 
        \regs_matrix[1][12] , \regs_matrix[1][11] , \regs_matrix[1][10] , 
        \regs_matrix[1][9] , \regs_matrix[1][8] , \regs_matrix[1][7] , 
        \regs_matrix[1][6] , \regs_matrix[1][5] , \regs_matrix[1][4] , 
        \regs_matrix[1][3] , \regs_matrix[1][2] , \regs_matrix[1][1] , 
        \regs_matrix[1][0] }) );
  flex_sreg_NUM_BITS17_13 \genblk1[2].REGX  ( .clk(clk), .n_reset(n763), 
        .write_enable(write_enables[2]), .new_value({w_data[16], n762, n759, 
        n756, n71, n751, n748, n745, n742, n739, n56, n734, n731, n728, 
        w_data[2], n723, w_data[0]}), .current_value({\regs_matrix[2][16] , 
        \regs_matrix[2][15] , \regs_matrix[2][14] , \regs_matrix[2][13] , 
        \regs_matrix[2][12] , \regs_matrix[2][11] , \regs_matrix[2][10] , 
        \regs_matrix[2][9] , \regs_matrix[2][8] , \regs_matrix[2][7] , 
        \regs_matrix[2][6] , \regs_matrix[2][5] , \regs_matrix[2][4] , 
        \regs_matrix[2][3] , \regs_matrix[2][2] , \regs_matrix[2][1] , 
        \regs_matrix[2][0] }) );
  flex_sreg_NUM_BITS17_12 \genblk1[3].REGX  ( .clk(clk), .n_reset(n764), 
        .write_enable(write_enables[3]), .new_value({w_data[16], n761, n758, 
        n755, n753, n750, n747, n744, n741, n738, n736, n733, n730, n727, n725, 
        n722, n720}), .current_value({\regs_matrix[3][16] , 
        \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] , 
        \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] , 
        \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] , 
        \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] , 
        \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] , 
        \regs_matrix[3][0] }) );
  flex_sreg_NUM_BITS17_11 \genblk1[4].REGX  ( .clk(clk), .n_reset(n764), 
        .write_enable(write_enables[4]), .new_value({w_data[16], n762, n759, 
        n756, w_data[12], n751, n748, n745, n742, n739, n57, n734, n731, n728, 
        w_data[2], n723, w_data[0]}), .current_value({\regs_matrix[4][16] , 
        \regs_matrix[4][15] , \regs_matrix[4][14] , \regs_matrix[4][13] , 
        \regs_matrix[4][12] , \regs_matrix[4][11] , \regs_matrix[4][10] , 
        \regs_matrix[4][9] , \regs_matrix[4][8] , \regs_matrix[4][7] , 
        \regs_matrix[4][6] , \regs_matrix[4][5] , \regs_matrix[4][4] , 
        \regs_matrix[4][3] , \regs_matrix[4][2] , \regs_matrix[4][1] , 
        \regs_matrix[4][0] }) );
  flex_sreg_NUM_BITS17_10 \genblk1[5].REGX  ( .clk(clk), .n_reset(n765), 
        .write_enable(write_enables[5]), .new_value({w_data[16], n70, n758, 
        n755, n72, n76, n74, n744, n741, n738, n736, n733, n730, n727, n725, 
        n722, n720}), .current_value({\regs_matrix[5][16] , 
        \regs_matrix[5][15] , \regs_matrix[5][14] , \regs_matrix[5][13] , 
        \regs_matrix[5][12] , \regs_matrix[5][11] , \regs_matrix[5][10] , 
        \regs_matrix[5][9] , \regs_matrix[5][8] , \regs_matrix[5][7] , 
        \regs_matrix[5][6] , \regs_matrix[5][5] , \regs_matrix[5][4] , 
        \regs_matrix[5][3] , \regs_matrix[5][2] , \regs_matrix[5][1] , 
        \regs_matrix[5][0] }) );
  flex_sreg_NUM_BITS17_9 \genblk1[6].REGX  ( .clk(clk), .n_reset(n765), 
        .write_enable(write_enables[6]), .new_value({w_data[16], n762, n759, 
        n756, n753, n751, n748, n745, n742, n739, n56, n734, n731, n728, 
        w_data[2], n723, w_data[0]}), .current_value({\regs_matrix[6][16] , 
        \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] , 
        \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] , 
        \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] , 
        \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] , 
        \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] , 
        \regs_matrix[6][0] }) );
  flex_sreg_NUM_BITS17_8 \genblk1[7].REGX  ( .clk(clk), .n_reset(n766), 
        .write_enable(write_enables[7]), .new_value({w_data[16], n69, n758, 
        n755, n71, n75, n73, n744, n741, n738, n736, n733, n730, n727, n725, 
        n722, n720}), .current_value({\regs_matrix[7][16] , 
        \regs_matrix[7][15] , \regs_matrix[7][14] , \regs_matrix[7][13] , 
        \regs_matrix[7][12] , \regs_matrix[7][11] , \regs_matrix[7][10] , 
        \regs_matrix[7][9] , \regs_matrix[7][8] , \regs_matrix[7][7] , 
        \regs_matrix[7][6] , \regs_matrix[7][5] , \regs_matrix[7][4] , 
        \regs_matrix[7][3] , \regs_matrix[7][2] , \regs_matrix[7][1] , 
        \regs_matrix[7][0] }) );
  flex_sreg_NUM_BITS17_7 \genblk1[8].REGX  ( .clk(clk), .n_reset(n766), 
        .write_enable(write_enables[8]), .new_value({w_data[16], n70, n759, 
        n756, n72, n76, n74, n745, n742, n739, n57, n734, n731, n728, 
        w_data[2], n723, w_data[0]}), .current_value({\regs_matrix[8][16] , 
        \regs_matrix[8][15] , \regs_matrix[8][14] , \regs_matrix[8][13] , 
        \regs_matrix[8][12] , \regs_matrix[8][11] , \regs_matrix[8][10] , 
        \regs_matrix[8][9] , \regs_matrix[8][8] , \regs_matrix[8][7] , 
        \regs_matrix[8][6] , \regs_matrix[8][5] , \regs_matrix[8][4] , 
        \regs_matrix[8][3] , \regs_matrix[8][2] , \regs_matrix[8][1] , 
        \regs_matrix[8][0] }) );
  flex_sreg_NUM_BITS17_6 \genblk1[9].REGX  ( .clk(clk), .n_reset(n767), 
        .write_enable(write_enables[9]), .new_value({w_data[16], n761, n758, 
        n755, n753, n750, n747, n744, n741, n738, n736, n733, n730, n727, n725, 
        n722, n720}), .current_value({\regs_matrix[9][16] , 
        \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] , 
        \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] , 
        \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] , 
        \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] , 
        \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] , 
        \regs_matrix[9][0] }) );
  flex_sreg_NUM_BITS17_5 \genblk1[10].REGX  ( .clk(clk), .n_reset(n767), 
        .write_enable(write_enables[10]), .new_value({w_data[16], n69, n759, 
        n756, n71, n75, n73, n745, n742, n739, n56, n734, n731, n728, 
        w_data[2], n723, w_data[0]}), .current_value({\regs_matrix[10][16] , 
        \regs_matrix[10][15] , \regs_matrix[10][14] , \regs_matrix[10][13] , 
        \regs_matrix[10][12] , \regs_matrix[10][11] , \regs_matrix[10][10] , 
        \regs_matrix[10][9] , \regs_matrix[10][8] , \regs_matrix[10][7] , 
        \regs_matrix[10][6] , \regs_matrix[10][5] , \regs_matrix[10][4] , 
        \regs_matrix[10][3] , \regs_matrix[10][2] , \regs_matrix[10][1] , 
        \regs_matrix[10][0] }) );
  flex_sreg_NUM_BITS17_4 \genblk1[11].REGX  ( .clk(clk), .n_reset(n768), 
        .write_enable(write_enables[11]), .new_value({w_data[16], n70, n758, 
        n755, n72, n76, n74, n744, n741, n738, n736, n733, n730, n727, n725, 
        n722, n720}), .current_value({\regs_matrix[11][16] , 
        \regs_matrix[11][15] , \regs_matrix[11][14] , \regs_matrix[11][13] , 
        \regs_matrix[11][12] , \regs_matrix[11][11] , \regs_matrix[11][10] , 
        \regs_matrix[11][9] , \regs_matrix[11][8] , \regs_matrix[11][7] , 
        \regs_matrix[11][6] , \regs_matrix[11][5] , \regs_matrix[11][4] , 
        \regs_matrix[11][3] , \regs_matrix[11][2] , \regs_matrix[11][1] , 
        \regs_matrix[11][0] }) );
  flex_sreg_NUM_BITS17_3 \genblk1[12].REGX  ( .clk(clk), .n_reset(n768), 
        .write_enable(write_enables[12]), .new_value({w_data[16], n761, n759, 
        n756, n753, n750, n747, n745, n742, n739, n57, n734, n731, n728, 
        w_data[2], n723, w_data[0]}), .current_value({\regs_matrix[12][16] , 
        \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] , 
        \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] , 
        \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] , 
        \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] , 
        \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] , 
        \regs_matrix[12][0] }) );
  flex_sreg_NUM_BITS17_2 \genblk1[13].REGX  ( .clk(clk), .n_reset(n769), 
        .write_enable(write_enables[13]), .new_value({w_data[16], n69, n758, 
        n755, n71, n75, n73, n744, n741, n738, n736, n733, n730, n727, n725, 
        n722, n720}), .current_value({\regs_matrix[13][16] , 
        \regs_matrix[13][15] , \regs_matrix[13][14] , \regs_matrix[13][13] , 
        \regs_matrix[13][12] , \regs_matrix[13][11] , \regs_matrix[13][10] , 
        \regs_matrix[13][9] , \regs_matrix[13][8] , \regs_matrix[13][7] , 
        \regs_matrix[13][6] , \regs_matrix[13][5] , \regs_matrix[13][4] , 
        \regs_matrix[13][3] , \regs_matrix[13][2] , \regs_matrix[13][1] , 
        \regs_matrix[13][0] }) );
  flex_sreg_NUM_BITS17_1 \genblk1[14].REGX  ( .clk(clk), .n_reset(n769), 
        .write_enable(write_enables[14]), .new_value({w_data[16], n70, n759, 
        n756, n72, n76, n74, n745, n742, n739, n56, n734, n731, n728, 
        w_data[2], n723, w_data[0]}), .current_value({\regs_matrix[14][16] , 
        \regs_matrix[14][15] , \regs_matrix[14][14] , \regs_matrix[14][13] , 
        \regs_matrix[14][12] , \regs_matrix[14][11] , \regs_matrix[14][10] , 
        \regs_matrix[14][9] , \regs_matrix[14][8] , \regs_matrix[14][7] , 
        \regs_matrix[14][6] , \regs_matrix[14][5] , \regs_matrix[14][4] , 
        \regs_matrix[14][3] , \regs_matrix[14][2] , \regs_matrix[14][1] , 
        \regs_matrix[14][0] }) );
  flex_sreg_NUM_BITS17_0 \genblk1[15].REGX  ( .clk(clk), .n_reset(n770), 
        .write_enable(write_enables[15]), .new_value({w_data[16], n761, n758, 
        n755, n753, n750, n747, n744, n741, n738, n736, n733, n730, n727, n725, 
        n722, n720}), .current_value({\regs_matrix[15][16] , 
        \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] , 
        \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] , 
        \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] , 
        \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] , 
        \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] , 
        \regs_matrix[15][0] }) );
  BUFX2 U2 ( .A(n101), .Y(n1) );
  BUFX4 U3 ( .A(n68), .Y(n2) );
  BUFX2 U4 ( .A(n68), .Y(n3) );
  BUFX2 U5 ( .A(n68), .Y(n4) );
  BUFX2 U31 ( .A(n68), .Y(n14) );
  INVX2 U32 ( .A(n2), .Y(n15) );
  INVX1 U33 ( .A(n2), .Y(n16) );
  INVX2 U34 ( .A(n2), .Y(n17) );
  INVX1 U35 ( .A(n2), .Y(n18) );
  INVX2 U36 ( .A(n2), .Y(n19) );
  INVX1 U37 ( .A(n3), .Y(n20) );
  INVX1 U38 ( .A(n3), .Y(n21) );
  INVX1 U39 ( .A(n3), .Y(n22) );
  INVX1 U40 ( .A(n3), .Y(n23) );
  INVX1 U41 ( .A(n3), .Y(n24) );
  INVX1 U42 ( .A(n4), .Y(n25) );
  INVX1 U43 ( .A(n4), .Y(n26) );
  INVX1 U44 ( .A(n4), .Y(n27) );
  INVX1 U45 ( .A(n4), .Y(n28) );
  INVX1 U46 ( .A(n4), .Y(n29) );
  INVX1 U47 ( .A(n14), .Y(n30) );
  INVX1 U48 ( .A(n14), .Y(n31) );
  INVX1 U49 ( .A(n14), .Y(n32) );
  INVX1 U50 ( .A(n14), .Y(n33) );
  INVX1 U51 ( .A(n14), .Y(n34) );
  INVX1 U52 ( .A(n101), .Y(n35) );
  INVX1 U53 ( .A(n101), .Y(n36) );
  INVX1 U54 ( .A(n101), .Y(n37) );
  INVX1 U55 ( .A(n35), .Y(n38) );
  INVX1 U56 ( .A(n35), .Y(n39) );
  INVX1 U57 ( .A(n35), .Y(n40) );
  INVX1 U58 ( .A(n36), .Y(n41) );
  INVX1 U59 ( .A(n36), .Y(n42) );
  INVX1 U60 ( .A(n36), .Y(n43) );
  INVX1 U61 ( .A(n37), .Y(n44) );
  INVX1 U62 ( .A(n37), .Y(n45) );
  INVX1 U63 ( .A(n37), .Y(n46) );
  INVX1 U64 ( .A(n1), .Y(n47) );
  INVX1 U65 ( .A(n1), .Y(n48) );
  INVX1 U66 ( .A(n47), .Y(n49) );
  INVX1 U67 ( .A(n47), .Y(n50) );
  INVX1 U68 ( .A(n47), .Y(n51) );
  INVX1 U69 ( .A(n48), .Y(n52) );
  INVX1 U70 ( .A(n48), .Y(n53) );
  INVX8 U71 ( .A(n378), .Y(r1_data[13]) );
  INVX4 U72 ( .A(n85), .Y(n378) );
  INVX4 U73 ( .A(n338), .Y(n339) );
  INVX8 U74 ( .A(n336), .Y(n341) );
  INVX2 U75 ( .A(w_data[6]), .Y(n54) );
  INVX2 U76 ( .A(n54), .Y(n55) );
  INVX1 U77 ( .A(n54), .Y(n56) );
  INVX1 U78 ( .A(n54), .Y(n57) );
  INVX2 U79 ( .A(n640), .Y(n641) );
  INVX2 U80 ( .A(n718), .Y(n717) );
  INVX2 U81 ( .A(n400), .Y(n647) );
  BUFX2 U82 ( .A(n649), .Y(n62) );
  INVX2 U83 ( .A(n674), .Y(n675) );
  INVX2 U84 ( .A(n717), .Y(n699) );
  INVX4 U85 ( .A(n643), .Y(n646) );
  INVX4 U86 ( .A(n647), .Y(n648) );
  BUFX2 U87 ( .A(n651), .Y(n65) );
  INVX2 U88 ( .A(n394), .Y(n636) );
  INVX2 U89 ( .A(n392), .Y(n630) );
  INVX2 U90 ( .A(n398), .Y(n640) );
  BUFX2 U91 ( .A(n335), .Y(n336) );
  INVX2 U92 ( .A(n332), .Y(n334) );
  INVX4 U93 ( .A(n353), .Y(n354) );
  INVX2 U94 ( .A(n357), .Y(n333) );
  INVX2 U95 ( .A(n95), .Y(n345) );
  BUFX2 U96 ( .A(n335), .Y(n338) );
  INVX2 U97 ( .A(w_data[10]), .Y(n746) );
  INVX2 U98 ( .A(w_data[11]), .Y(n749) );
  INVX2 U99 ( .A(w_data[15]), .Y(n760) );
  BUFX4 U100 ( .A(n638), .Y(n58) );
  INVX1 U101 ( .A(n636), .Y(n638) );
  BUFX2 U102 ( .A(n641), .Y(n59) );
  BUFX4 U103 ( .A(n641), .Y(n60) );
  BUFX4 U104 ( .A(n641), .Y(n61) );
  INVX4 U105 ( .A(n100), .Y(n353) );
  BUFX4 U106 ( .A(n649), .Y(n63) );
  BUFX4 U107 ( .A(n649), .Y(n64) );
  INVX2 U108 ( .A(n647), .Y(n649) );
  BUFX4 U109 ( .A(n651), .Y(n66) );
  INVX2 U110 ( .A(n77), .Y(n651) );
  INVX8 U111 ( .A(n636), .Y(n637) );
  INVX1 U112 ( .A(n639), .Y(n712) );
  INVX1 U113 ( .A(n639), .Y(n714) );
  INVX2 U114 ( .A(n367), .Y(n374) );
  INVX2 U115 ( .A(w_data[12]), .Y(n752) );
  INVX2 U116 ( .A(N16), .Y(n654) );
  INVX2 U117 ( .A(n360), .Y(n367) );
  BUFX4 U118 ( .A(n335), .Y(n337) );
  BUFX2 U119 ( .A(n77), .Y(n67) );
  INVX4 U120 ( .A(N10), .Y(n327) );
  AND2X2 U121 ( .A(N12), .B(n330), .Y(n68) );
  INVX2 U122 ( .A(n760), .Y(n69) );
  INVX2 U123 ( .A(n760), .Y(n70) );
  INVX2 U124 ( .A(n752), .Y(n71) );
  INVX2 U125 ( .A(n752), .Y(n72) );
  INVX2 U126 ( .A(n746), .Y(n73) );
  INVX2 U127 ( .A(n746), .Y(n74) );
  INVX2 U128 ( .A(n749), .Y(n75) );
  INVX2 U129 ( .A(n749), .Y(n76) );
  AND2X2 U130 ( .A(n290), .B(n291), .Y(n371) );
  INVX2 U131 ( .A(n55), .Y(n735) );
  INVX2 U132 ( .A(w_data[8]), .Y(n740) );
  INVX2 U133 ( .A(w_data[9]), .Y(n743) );
  INVX2 U134 ( .A(w_data[4]), .Y(n729) );
  INVX2 U135 ( .A(w_data[14]), .Y(n757) );
  INVX2 U136 ( .A(n640), .Y(n642) );
  INVX2 U137 ( .A(n643), .Y(n645) );
  BUFX2 U138 ( .A(n630), .Y(n633) );
  AND2X2 U139 ( .A(N16), .B(n78), .Y(n77) );
  INVX2 U140 ( .A(N17), .Y(n653) );
  AND2X2 U141 ( .A(N15), .B(N14), .Y(n78) );
  INVX4 U142 ( .A(n373), .Y(r1_data[14]) );
  INVX2 U143 ( .A(n746), .Y(n748) );
  INVX2 U144 ( .A(n746), .Y(n747) );
  INVX2 U145 ( .A(n749), .Y(n751) );
  INVX2 U146 ( .A(n752), .Y(n753) );
  INVX2 U147 ( .A(n749), .Y(n750) );
  INVX2 U148 ( .A(n724), .Y(n725) );
  INVX2 U149 ( .A(n726), .Y(n727) );
  INVX2 U150 ( .A(n735), .Y(n736) );
  INVX2 U151 ( .A(n754), .Y(n755) );
  INVX2 U152 ( .A(n726), .Y(n728) );
  INVX2 U153 ( .A(n754), .Y(n756) );
  INVX2 U154 ( .A(n760), .Y(n762) );
  INVX2 U155 ( .A(n760), .Y(n761) );
  INVX2 U156 ( .A(n740), .Y(n742) );
  INVX2 U157 ( .A(n740), .Y(n741) );
  INVX2 U158 ( .A(n743), .Y(n745) );
  INVX2 U159 ( .A(n743), .Y(n744) );
  INVX2 U160 ( .A(n729), .Y(n731) );
  INVX2 U161 ( .A(n729), .Y(n730) );
  INVX2 U162 ( .A(n757), .Y(n759) );
  INVX2 U163 ( .A(n757), .Y(n758) );
  INVX2 U164 ( .A(n737), .Y(n739) );
  INVX2 U165 ( .A(n737), .Y(n738) );
  INVX2 U166 ( .A(n719), .Y(n720) );
  INVX2 U167 ( .A(n721), .Y(n722) );
  INVX2 U168 ( .A(n732), .Y(n733) );
  INVX2 U169 ( .A(n721), .Y(n723) );
  INVX2 U170 ( .A(n732), .Y(n734) );
  BUFX2 U171 ( .A(n_reset), .Y(n763) );
  BUFX2 U172 ( .A(n_reset), .Y(n764) );
  BUFX2 U173 ( .A(n_reset), .Y(n765) );
  BUFX2 U174 ( .A(n_reset), .Y(n766) );
  BUFX2 U175 ( .A(n_reset), .Y(n767) );
  BUFX2 U176 ( .A(n_reset), .Y(n768) );
  BUFX2 U177 ( .A(n_reset), .Y(n769) );
  BUFX2 U178 ( .A(n_reset), .Y(n770) );
  INVX2 U179 ( .A(w_data[2]), .Y(n724) );
  INVX2 U180 ( .A(w_data[3]), .Y(n726) );
  INVX2 U181 ( .A(w_data[13]), .Y(n754) );
  INVX2 U182 ( .A(w_data[7]), .Y(n737) );
  INVX2 U183 ( .A(w_data[0]), .Y(n719) );
  INVX2 U184 ( .A(w_data[1]), .Y(n721) );
  INVX2 U185 ( .A(w_data[5]), .Y(n732) );
  AOI22X1 U186 ( .A(n82), .B(n81), .C(n80), .D(n79), .Y(n83) );
  INVX2 U187 ( .A(n83), .Y(r1_data[16]) );
  MUX2X1 U188 ( .B(n86), .A(n87), .S(N13), .Y(r1_data[0]) );
  NAND2X1 U189 ( .A(n89), .B(n88), .Y(n87) );
  NOR2X1 U190 ( .A(n91), .B(n90), .Y(n89) );
  OAI22X1 U191 ( .A(\regs_matrix[8][0] ), .B(n334), .C(\regs_matrix[10][0] ), 
        .D(n339), .Y(n91) );
  OAI22X1 U192 ( .A(\regs_matrix[12][0] ), .B(n343), .C(\regs_matrix[14][0] ), 
        .D(n347), .Y(n90) );
  NOR2X1 U193 ( .A(n96), .B(n97), .Y(n88) );
  OAI22X1 U194 ( .A(\regs_matrix[11][0] ), .B(n349), .C(\regs_matrix[9][0] ), 
        .D(n352), .Y(n97) );
  OAI22X1 U195 ( .A(\regs_matrix[13][0] ), .B(n354), .C(\regs_matrix[15][0] ), 
        .D(n27), .Y(n96) );
  NAND2X1 U196 ( .A(n102), .B(n103), .Y(n86) );
  NOR2X1 U197 ( .A(n105), .B(n104), .Y(n103) );
  OAI22X1 U198 ( .A(outreg_data[0]), .B(n380), .C(\regs_matrix[2][0] ), .D(
        n339), .Y(n105) );
  OAI22X1 U199 ( .A(\regs_matrix[4][0] ), .B(n343), .C(\regs_matrix[6][0] ), 
        .D(n348), .Y(n104) );
  NOR2X1 U200 ( .A(n106), .B(n107), .Y(n102) );
  OAI22X1 U201 ( .A(\regs_matrix[3][0] ), .B(n349), .C(\regs_matrix[1][0] ), 
        .D(n352), .Y(n107) );
  OAI22X1 U202 ( .A(\regs_matrix[5][0] ), .B(n355), .C(\regs_matrix[7][0] ), 
        .D(n23), .Y(n106) );
  MUX2X1 U203 ( .B(n108), .A(n109), .S(N13), .Y(r1_data[1]) );
  NAND2X1 U204 ( .A(n111), .B(n110), .Y(n109) );
  NOR2X1 U205 ( .A(n112), .B(n113), .Y(n111) );
  OAI22X1 U206 ( .A(\regs_matrix[8][1] ), .B(n334), .C(\regs_matrix[10][1] ), 
        .D(n339), .Y(n113) );
  OAI22X1 U207 ( .A(\regs_matrix[12][1] ), .B(n343), .C(\regs_matrix[14][1] ), 
        .D(n348), .Y(n112) );
  NOR2X1 U208 ( .A(n114), .B(n115), .Y(n110) );
  OAI22X1 U209 ( .A(\regs_matrix[11][1] ), .B(n349), .C(\regs_matrix[9][1] ), 
        .D(n352), .Y(n115) );
  OAI22X1 U210 ( .A(\regs_matrix[13][1] ), .B(n354), .C(\regs_matrix[15][1] ), 
        .D(n25), .Y(n114) );
  NAND2X1 U211 ( .A(n116), .B(n117), .Y(n108) );
  NOR2X1 U212 ( .A(n119), .B(n118), .Y(n117) );
  OAI22X1 U213 ( .A(outreg_data[1]), .B(n380), .C(\regs_matrix[2][1] ), .D(
        n339), .Y(n119) );
  OAI22X1 U214 ( .A(\regs_matrix[4][1] ), .B(n343), .C(\regs_matrix[6][1] ), 
        .D(n348), .Y(n118) );
  NOR2X1 U215 ( .A(n120), .B(n121), .Y(n116) );
  OAI22X1 U216 ( .A(\regs_matrix[3][1] ), .B(n349), .C(\regs_matrix[1][1] ), 
        .D(n352), .Y(n121) );
  OAI22X1 U217 ( .A(\regs_matrix[5][1] ), .B(n354), .C(\regs_matrix[7][1] ), 
        .D(n22), .Y(n120) );
  MUX2X1 U218 ( .B(n122), .A(n123), .S(N13), .Y(r1_data[2]) );
  NAND2X1 U219 ( .A(n124), .B(n125), .Y(n123) );
  NOR2X1 U220 ( .A(n126), .B(n127), .Y(n125) );
  OAI22X1 U221 ( .A(\regs_matrix[8][2] ), .B(n333), .C(\regs_matrix[10][2] ), 
        .D(n339), .Y(n127) );
  OAI22X1 U222 ( .A(\regs_matrix[12][2] ), .B(n343), .C(\regs_matrix[14][2] ), 
        .D(n348), .Y(n126) );
  NOR2X1 U223 ( .A(n128), .B(n129), .Y(n124) );
  OAI22X1 U224 ( .A(\regs_matrix[11][2] ), .B(n349), .C(\regs_matrix[9][2] ), 
        .D(n352), .Y(n129) );
  OAI22X1 U225 ( .A(\regs_matrix[13][2] ), .B(n355), .C(\regs_matrix[15][2] ), 
        .D(n31), .Y(n128) );
  NAND2X1 U226 ( .A(n130), .B(n131), .Y(n122) );
  NOR2X1 U227 ( .A(n132), .B(n133), .Y(n131) );
  OAI22X1 U228 ( .A(outreg_data[2]), .B(n334), .C(\regs_matrix[2][2] ), .D(
        n339), .Y(n133) );
  OAI22X1 U229 ( .A(\regs_matrix[4][2] ), .B(n343), .C(\regs_matrix[6][2] ), 
        .D(n348), .Y(n132) );
  NOR2X1 U230 ( .A(n134), .B(n135), .Y(n130) );
  OAI22X1 U231 ( .A(\regs_matrix[3][2] ), .B(n349), .C(\regs_matrix[1][2] ), 
        .D(n352), .Y(n135) );
  OAI22X1 U232 ( .A(\regs_matrix[5][2] ), .B(n359), .C(\regs_matrix[7][2] ), 
        .D(n32), .Y(n134) );
  MUX2X1 U233 ( .B(n136), .A(n137), .S(N13), .Y(r1_data[3]) );
  NAND2X1 U234 ( .A(n138), .B(n139), .Y(n137) );
  NOR2X1 U235 ( .A(n140), .B(n141), .Y(n139) );
  OAI22X1 U236 ( .A(\regs_matrix[8][3] ), .B(n334), .C(\regs_matrix[10][3] ), 
        .D(n339), .Y(n141) );
  OAI22X1 U237 ( .A(\regs_matrix[12][3] ), .B(n344), .C(\regs_matrix[14][3] ), 
        .D(n348), .Y(n140) );
  NOR2X1 U238 ( .A(n142), .B(n143), .Y(n138) );
  OAI22X1 U239 ( .A(\regs_matrix[11][3] ), .B(n349), .C(\regs_matrix[9][3] ), 
        .D(n352), .Y(n143) );
  OAI22X1 U240 ( .A(\regs_matrix[13][3] ), .B(n355), .C(\regs_matrix[15][3] ), 
        .D(n21), .Y(n142) );
  NAND2X1 U241 ( .A(n144), .B(n145), .Y(n136) );
  NOR2X1 U242 ( .A(n146), .B(n147), .Y(n145) );
  OAI22X1 U243 ( .A(outreg_data[3]), .B(n368), .C(\regs_matrix[2][3] ), .D(
        n339), .Y(n147) );
  OAI22X1 U244 ( .A(\regs_matrix[4][3] ), .B(n344), .C(\regs_matrix[6][3] ), 
        .D(n348), .Y(n146) );
  NOR2X1 U245 ( .A(n148), .B(n149), .Y(n144) );
  OAI22X1 U246 ( .A(\regs_matrix[3][3] ), .B(n349), .C(\regs_matrix[1][3] ), 
        .D(n352), .Y(n149) );
  OAI22X1 U247 ( .A(\regs_matrix[5][3] ), .B(n359), .C(\regs_matrix[7][3] ), 
        .D(n18), .Y(n148) );
  MUX2X1 U248 ( .B(n150), .A(n151), .S(N13), .Y(r1_data[4]) );
  NAND2X1 U249 ( .A(n152), .B(n153), .Y(n151) );
  NOR2X1 U250 ( .A(n154), .B(n155), .Y(n153) );
  OAI22X1 U251 ( .A(\regs_matrix[8][4] ), .B(n334), .C(\regs_matrix[10][4] ), 
        .D(n340), .Y(n155) );
  OAI22X1 U252 ( .A(\regs_matrix[12][4] ), .B(n343), .C(\regs_matrix[14][4] ), 
        .D(n348), .Y(n154) );
  NOR2X1 U253 ( .A(n156), .B(n157), .Y(n152) );
  OAI22X1 U254 ( .A(\regs_matrix[11][4] ), .B(n349), .C(\regs_matrix[9][4] ), 
        .D(n352), .Y(n157) );
  OAI22X1 U255 ( .A(\regs_matrix[13][4] ), .B(n354), .C(\regs_matrix[15][4] ), 
        .D(n30), .Y(n156) );
  NAND2X1 U256 ( .A(n158), .B(n159), .Y(n150) );
  NOR2X1 U257 ( .A(n160), .B(n161), .Y(n159) );
  OAI22X1 U258 ( .A(outreg_data[4]), .B(n364), .C(\regs_matrix[2][4] ), .D(
        n340), .Y(n161) );
  OAI22X1 U259 ( .A(\regs_matrix[4][4] ), .B(n343), .C(\regs_matrix[6][4] ), 
        .D(n348), .Y(n160) );
  NOR2X1 U260 ( .A(n162), .B(n163), .Y(n158) );
  OAI22X1 U261 ( .A(\regs_matrix[3][4] ), .B(n349), .C(\regs_matrix[1][4] ), 
        .D(n352), .Y(n163) );
  OAI22X1 U262 ( .A(\regs_matrix[5][4] ), .B(n359), .C(\regs_matrix[7][4] ), 
        .D(n29), .Y(n162) );
  MUX2X1 U263 ( .B(n164), .A(n165), .S(N13), .Y(r1_data[5]) );
  NAND2X1 U264 ( .A(n167), .B(n166), .Y(n165) );
  NOR2X1 U265 ( .A(n168), .B(n169), .Y(n167) );
  OAI22X1 U266 ( .A(\regs_matrix[8][5] ), .B(n364), .C(\regs_matrix[10][5] ), 
        .D(n340), .Y(n169) );
  OAI22X1 U267 ( .A(\regs_matrix[12][5] ), .B(n344), .C(\regs_matrix[14][5] ), 
        .D(n348), .Y(n168) );
  NOR2X1 U268 ( .A(n170), .B(n171), .Y(n166) );
  OAI22X1 U269 ( .A(\regs_matrix[11][5] ), .B(n349), .C(\regs_matrix[9][5] ), 
        .D(n352), .Y(n171) );
  OAI22X1 U270 ( .A(\regs_matrix[13][5] ), .B(n355), .C(\regs_matrix[15][5] ), 
        .D(n40), .Y(n170) );
  NAND2X1 U271 ( .A(n173), .B(n172), .Y(n164) );
  NOR2X1 U272 ( .A(n175), .B(n174), .Y(n173) );
  OAI22X1 U273 ( .A(outreg_data[5]), .B(n380), .C(\regs_matrix[2][5] ), .D(
        n340), .Y(n175) );
  OAI22X1 U274 ( .A(\regs_matrix[4][5] ), .B(n344), .C(\regs_matrix[6][5] ), 
        .D(n348), .Y(n174) );
  NOR2X1 U275 ( .A(n176), .B(n177), .Y(n172) );
  OAI22X1 U276 ( .A(\regs_matrix[3][5] ), .B(n349), .C(\regs_matrix[1][5] ), 
        .D(n352), .Y(n177) );
  OAI22X1 U277 ( .A(\regs_matrix[5][5] ), .B(n359), .C(\regs_matrix[7][5] ), 
        .D(n38), .Y(n176) );
  MUX2X1 U278 ( .B(n178), .A(n179), .S(N13), .Y(r1_data[6]) );
  NAND2X1 U279 ( .A(n180), .B(n181), .Y(n179) );
  NOR2X1 U280 ( .A(n182), .B(n183), .Y(n181) );
  OAI22X1 U281 ( .A(\regs_matrix[8][6] ), .B(n333), .C(\regs_matrix[10][6] ), 
        .D(n340), .Y(n183) );
  OAI22X1 U282 ( .A(\regs_matrix[12][6] ), .B(n343), .C(\regs_matrix[14][6] ), 
        .D(n347), .Y(n182) );
  NOR2X1 U283 ( .A(n184), .B(n185), .Y(n180) );
  OAI22X1 U284 ( .A(\regs_matrix[11][6] ), .B(n349), .C(\regs_matrix[9][6] ), 
        .D(n351), .Y(n185) );
  OAI22X1 U285 ( .A(\regs_matrix[13][6] ), .B(n354), .C(\regs_matrix[15][6] ), 
        .D(n28), .Y(n184) );
  NAND2X1 U286 ( .A(n186), .B(n187), .Y(n178) );
  NOR2X1 U287 ( .A(n188), .B(n189), .Y(n187) );
  OAI22X1 U288 ( .A(outreg_data[6]), .B(n333), .C(\regs_matrix[2][6] ), .D(
        n340), .Y(n189) );
  OAI22X1 U289 ( .A(\regs_matrix[4][6] ), .B(n343), .C(\regs_matrix[6][6] ), 
        .D(n347), .Y(n188) );
  NOR2X1 U290 ( .A(n190), .B(n191), .Y(n186) );
  OAI22X1 U291 ( .A(\regs_matrix[3][6] ), .B(n349), .C(\regs_matrix[1][6] ), 
        .D(n351), .Y(n191) );
  OAI22X1 U292 ( .A(\regs_matrix[5][6] ), .B(n359), .C(\regs_matrix[7][6] ), 
        .D(n50), .Y(n190) );
  MUX2X1 U293 ( .B(n192), .A(n193), .S(N13), .Y(r1_data[7]) );
  NAND2X1 U294 ( .A(n194), .B(n195), .Y(n193) );
  NOR2X1 U295 ( .A(n196), .B(n197), .Y(n195) );
  OAI22X1 U296 ( .A(\regs_matrix[8][7] ), .B(n364), .C(\regs_matrix[10][7] ), 
        .D(n340), .Y(n197) );
  OAI22X1 U297 ( .A(\regs_matrix[12][7] ), .B(n344), .C(\regs_matrix[14][7] ), 
        .D(n347), .Y(n196) );
  NOR2X1 U298 ( .A(n198), .B(n199), .Y(n194) );
  OAI22X1 U299 ( .A(\regs_matrix[11][7] ), .B(n349), .C(\regs_matrix[9][7] ), 
        .D(n351), .Y(n199) );
  OAI22X1 U300 ( .A(\regs_matrix[13][7] ), .B(n361), .C(\regs_matrix[15][7] ), 
        .D(n45), .Y(n198) );
  NAND2X1 U301 ( .A(n200), .B(n201), .Y(n192) );
  NOR2X1 U302 ( .A(n202), .B(n203), .Y(n201) );
  OAI22X1 U303 ( .A(outreg_data[7]), .B(n368), .C(\regs_matrix[2][7] ), .D(
        n340), .Y(n203) );
  OAI22X1 U304 ( .A(\regs_matrix[4][7] ), .B(n374), .C(\regs_matrix[6][7] ), 
        .D(n347), .Y(n202) );
  NOR2X1 U305 ( .A(n204), .B(n205), .Y(n200) );
  OAI22X1 U306 ( .A(\regs_matrix[3][7] ), .B(n349), .C(\regs_matrix[1][7] ), 
        .D(n351), .Y(n205) );
  OAI22X1 U307 ( .A(\regs_matrix[5][7] ), .B(n355), .C(\regs_matrix[7][7] ), 
        .D(n41), .Y(n204) );
  MUX2X1 U308 ( .B(n206), .A(n207), .S(N13), .Y(r1_data[8]) );
  NAND2X1 U309 ( .A(n208), .B(n209), .Y(n207) );
  NOR2X1 U310 ( .A(n210), .B(n211), .Y(n209) );
  OAI22X1 U311 ( .A(\regs_matrix[8][8] ), .B(n368), .C(\regs_matrix[10][8] ), 
        .D(n340), .Y(n211) );
  OAI22X1 U312 ( .A(\regs_matrix[12][8] ), .B(n366), .C(\regs_matrix[14][8] ), 
        .D(n347), .Y(n210) );
  NOR2X1 U313 ( .A(n212), .B(n213), .Y(n208) );
  OAI22X1 U314 ( .A(\regs_matrix[11][8] ), .B(n349), .C(\regs_matrix[9][8] ), 
        .D(n351), .Y(n213) );
  OAI22X1 U315 ( .A(\regs_matrix[13][8] ), .B(n354), .C(\regs_matrix[15][8] ), 
        .D(n33), .Y(n212) );
  NAND2X1 U316 ( .A(n214), .B(n215), .Y(n206) );
  NOR2X1 U317 ( .A(n216), .B(n217), .Y(n215) );
  OAI22X1 U318 ( .A(outreg_data[8]), .B(n333), .C(\regs_matrix[2][8] ), .D(
        n340), .Y(n217) );
  OAI22X1 U319 ( .A(\regs_matrix[4][8] ), .B(n343), .C(\regs_matrix[6][8] ), 
        .D(n347), .Y(n216) );
  NOR2X1 U320 ( .A(n218), .B(n219), .Y(n214) );
  OAI22X1 U321 ( .A(\regs_matrix[3][8] ), .B(n349), .C(\regs_matrix[1][8] ), 
        .D(n351), .Y(n219) );
  OAI22X1 U322 ( .A(\regs_matrix[5][8] ), .B(n361), .C(\regs_matrix[7][8] ), 
        .D(n34), .Y(n218) );
  MUX2X1 U323 ( .B(n220), .A(n221), .S(N13), .Y(r1_data[9]) );
  NAND2X1 U324 ( .A(n222), .B(n223), .Y(n221) );
  NOR2X1 U325 ( .A(n224), .B(n225), .Y(n223) );
  OAI22X1 U326 ( .A(\regs_matrix[8][9] ), .B(n334), .C(\regs_matrix[10][9] ), 
        .D(n340), .Y(n225) );
  OAI22X1 U327 ( .A(\regs_matrix[12][9] ), .B(n344), .C(\regs_matrix[14][9] ), 
        .D(n347), .Y(n224) );
  NOR2X1 U328 ( .A(n226), .B(n227), .Y(n222) );
  OAI22X1 U329 ( .A(\regs_matrix[11][9] ), .B(n349), .C(\regs_matrix[9][9] ), 
        .D(n351), .Y(n227) );
  OAI22X1 U330 ( .A(\regs_matrix[13][9] ), .B(n354), .C(\regs_matrix[15][9] ), 
        .D(n20), .Y(n226) );
  NAND2X1 U331 ( .A(n228), .B(n229), .Y(n220) );
  NOR2X1 U332 ( .A(n230), .B(n231), .Y(n229) );
  OAI22X1 U333 ( .A(outreg_data[9]), .B(n380), .C(\regs_matrix[2][9] ), .D(
        n340), .Y(n231) );
  OAI22X1 U334 ( .A(\regs_matrix[4][9] ), .B(n374), .C(\regs_matrix[6][9] ), 
        .D(n347), .Y(n230) );
  NOR2X1 U335 ( .A(n232), .B(n233), .Y(n228) );
  OAI22X1 U336 ( .A(\regs_matrix[3][9] ), .B(n349), .C(\regs_matrix[1][9] ), 
        .D(n351), .Y(n233) );
  OAI22X1 U337 ( .A(\regs_matrix[5][9] ), .B(n354), .C(\regs_matrix[7][9] ), 
        .D(n17), .Y(n232) );
  MUX2X1 U338 ( .B(n234), .A(n235), .S(N13), .Y(r1_data[10]) );
  NAND2X1 U339 ( .A(n236), .B(n237), .Y(n235) );
  NOR2X1 U340 ( .A(n238), .B(n239), .Y(n237) );
  OAI22X1 U341 ( .A(\regs_matrix[8][10] ), .B(n380), .C(\regs_matrix[10][10] ), 
        .D(n341), .Y(n239) );
  OAI22X1 U342 ( .A(\regs_matrix[12][10] ), .B(n343), .C(\regs_matrix[14][10] ), .D(n347), .Y(n238) );
  NOR2X1 U343 ( .A(n240), .B(n241), .Y(n236) );
  OAI22X1 U344 ( .A(\regs_matrix[11][10] ), .B(n349), .C(\regs_matrix[9][10] ), 
        .D(n351), .Y(n241) );
  OAI22X1 U345 ( .A(\regs_matrix[13][10] ), .B(n354), .C(\regs_matrix[15][10] ), .D(n19), .Y(n240) );
  NAND2X1 U346 ( .A(n242), .B(n243), .Y(n234) );
  NOR2X1 U347 ( .A(n244), .B(n245), .Y(n243) );
  OAI22X1 U348 ( .A(outreg_data[10]), .B(n334), .C(\regs_matrix[2][10] ), .D(
        n341), .Y(n245) );
  OAI22X1 U349 ( .A(\regs_matrix[4][10] ), .B(n343), .C(\regs_matrix[6][10] ), 
        .D(n347), .Y(n244) );
  NOR2X1 U350 ( .A(n246), .B(n247), .Y(n242) );
  OAI22X1 U351 ( .A(\regs_matrix[3][10] ), .B(n369), .C(\regs_matrix[1][10] ), 
        .D(n351), .Y(n247) );
  OAI22X1 U352 ( .A(\regs_matrix[5][10] ), .B(n359), .C(\regs_matrix[7][10] ), 
        .D(n46), .Y(n246) );
  MUX2X1 U353 ( .B(n248), .A(n249), .S(N13), .Y(n84) );
  NAND2X1 U354 ( .A(n250), .B(n251), .Y(n249) );
  NOR2X1 U355 ( .A(n252), .B(n253), .Y(n251) );
  OAI22X1 U356 ( .A(\regs_matrix[8][11] ), .B(n333), .C(\regs_matrix[10][11] ), 
        .D(n341), .Y(n253) );
  OAI22X1 U357 ( .A(\regs_matrix[12][11] ), .B(n360), .C(\regs_matrix[14][11] ), .D(n347), .Y(n252) );
  NOR2X1 U358 ( .A(n254), .B(n255), .Y(n250) );
  OAI22X1 U359 ( .A(\regs_matrix[11][11] ), .B(n369), .C(\regs_matrix[9][11] ), 
        .D(n351), .Y(n255) );
  OAI22X1 U360 ( .A(\regs_matrix[13][11] ), .B(n359), .C(\regs_matrix[15][11] ), .D(n43), .Y(n254) );
  NAND2X1 U361 ( .A(n256), .B(n257), .Y(n248) );
  NOR2X1 U362 ( .A(n258), .B(n259), .Y(n257) );
  OAI22X1 U363 ( .A(n333), .B(outreg_data[11]), .C(\regs_matrix[2][11] ), .D(
        n341), .Y(n259) );
  OAI22X1 U364 ( .A(\regs_matrix[4][11] ), .B(n344), .C(\regs_matrix[6][11] ), 
        .D(n346), .Y(n258) );
  NOR2X1 U365 ( .A(n260), .B(n261), .Y(n256) );
  OAI22X1 U366 ( .A(\regs_matrix[3][11] ), .B(n369), .C(\regs_matrix[1][11] ), 
        .D(n351), .Y(n261) );
  OAI22X1 U367 ( .A(\regs_matrix[5][11] ), .B(n355), .C(\regs_matrix[7][11] ), 
        .D(n42), .Y(n260) );
  MUX2X1 U368 ( .B(n262), .A(n263), .S(N13), .Y(r1_data[12]) );
  NAND2X1 U369 ( .A(n264), .B(n265), .Y(n263) );
  NOR2X1 U370 ( .A(n266), .B(n267), .Y(n265) );
  OAI22X1 U371 ( .A(\regs_matrix[8][12] ), .B(n333), .C(\regs_matrix[10][12] ), 
        .D(n341), .Y(n267) );
  OAI22X1 U372 ( .A(\regs_matrix[12][12] ), .B(n360), .C(\regs_matrix[14][12] ), .D(n346), .Y(n266) );
  NOR2X1 U373 ( .A(n268), .B(n269), .Y(n264) );
  OAI22X1 U374 ( .A(\regs_matrix[11][12] ), .B(n369), .C(\regs_matrix[9][12] ), 
        .D(n370), .Y(n269) );
  OAI22X1 U375 ( .A(\regs_matrix[13][12] ), .B(n354), .C(\regs_matrix[15][12] ), .D(n26), .Y(n268) );
  NAND2X1 U376 ( .A(n270), .B(n271), .Y(n262) );
  NOR2X1 U377 ( .A(n272), .B(n273), .Y(n271) );
  OAI22X1 U378 ( .A(outreg_data[12]), .B(n380), .C(\regs_matrix[2][12] ), .D(
        n341), .Y(n273) );
  OAI22X1 U379 ( .A(\regs_matrix[4][12] ), .B(n343), .C(\regs_matrix[6][12] ), 
        .D(n346), .Y(n272) );
  NOR2X1 U380 ( .A(n274), .B(n275), .Y(n270) );
  OAI22X1 U381 ( .A(\regs_matrix[3][12] ), .B(n369), .C(\regs_matrix[1][12] ), 
        .D(n370), .Y(n275) );
  OAI22X1 U382 ( .A(\regs_matrix[5][12] ), .B(n354), .C(\regs_matrix[7][12] ), 
        .D(n24), .Y(n274) );
  MUX2X1 U383 ( .B(n276), .A(n277), .S(N13), .Y(n85) );
  NAND2X1 U384 ( .A(n279), .B(n278), .Y(n277) );
  NOR2X1 U385 ( .A(n280), .B(n281), .Y(n279) );
  OAI22X1 U386 ( .A(\regs_matrix[8][13] ), .B(n334), .C(\regs_matrix[10][13] ), 
        .D(n341), .Y(n281) );
  OAI22X1 U387 ( .A(\regs_matrix[12][13] ), .B(n360), .C(\regs_matrix[14][13] ), .D(n346), .Y(n280) );
  NOR2X1 U388 ( .A(n282), .B(n283), .Y(n278) );
  OAI22X1 U389 ( .A(\regs_matrix[11][13] ), .B(n350), .C(\regs_matrix[9][13] ), 
        .D(n352), .Y(n283) );
  OAI22X1 U390 ( .A(\regs_matrix[13][13] ), .B(n361), .C(\regs_matrix[15][13] ), .D(n44), .Y(n282) );
  NAND2X1 U391 ( .A(n285), .B(n284), .Y(n276) );
  NOR2X1 U392 ( .A(n287), .B(n286), .Y(n285) );
  OAI22X1 U393 ( .A(outreg_data[13]), .B(n380), .C(\regs_matrix[2][13] ), .D(
        n341), .Y(n287) );
  OAI22X1 U394 ( .A(\regs_matrix[4][13] ), .B(n360), .C(\regs_matrix[6][13] ), 
        .D(n346), .Y(n286) );
  NOR2X1 U395 ( .A(n288), .B(n289), .Y(n284) );
  OAI22X1 U396 ( .A(\regs_matrix[3][13] ), .B(n350), .C(\regs_matrix[1][13] ), 
        .D(n352), .Y(n289) );
  OAI22X1 U397 ( .A(\regs_matrix[5][13] ), .B(n361), .C(\regs_matrix[7][13] ), 
        .D(n16), .Y(n288) );
  NOR2X1 U398 ( .A(n292), .B(n293), .Y(n291) );
  OAI22X1 U399 ( .A(\regs_matrix[8][14] ), .B(n333), .C(\regs_matrix[10][14] ), 
        .D(n341), .Y(n293) );
  OAI22X1 U400 ( .A(\regs_matrix[12][14] ), .B(n343), .C(\regs_matrix[14][14] ), .D(n346), .Y(n292) );
  NOR2X1 U401 ( .A(n294), .B(n295), .Y(n290) );
  OAI22X1 U402 ( .A(\regs_matrix[11][14] ), .B(n369), .C(\regs_matrix[9][14] ), 
        .D(n370), .Y(n295) );
  OAI22X1 U403 ( .A(\regs_matrix[13][14] ), .B(n354), .C(\regs_matrix[15][14] ), .D(n49), .Y(n294) );
  NOR2X1 U404 ( .A(n298), .B(n299), .Y(n297) );
  OAI22X1 U405 ( .A(outreg_data[14]), .B(n333), .C(\regs_matrix[2][14] ), .D(
        n341), .Y(n299) );
  OAI22X1 U406 ( .A(\regs_matrix[4][14] ), .B(n366), .C(\regs_matrix[6][14] ), 
        .D(n346), .Y(n298) );
  NOR2X1 U407 ( .A(n300), .B(n301), .Y(n296) );
  OAI22X1 U408 ( .A(\regs_matrix[3][14] ), .B(n369), .C(\regs_matrix[1][14] ), 
        .D(n370), .Y(n301) );
  OAI22X1 U409 ( .A(\regs_matrix[5][14] ), .B(n355), .C(\regs_matrix[7][14] ), 
        .D(n51), .Y(n300) );
  NOR2X1 U410 ( .A(n304), .B(n305), .Y(n303) );
  OAI22X1 U411 ( .A(\regs_matrix[8][15] ), .B(n380), .C(\regs_matrix[10][15] ), 
        .D(n341), .Y(n305) );
  OAI22X1 U412 ( .A(\regs_matrix[12][15] ), .B(n344), .C(\regs_matrix[14][15] ), .D(n346), .Y(n304) );
  NOR2X1 U413 ( .A(n306), .B(n307), .Y(n302) );
  OAI22X1 U414 ( .A(\regs_matrix[11][15] ), .B(n369), .C(\regs_matrix[9][15] ), 
        .D(n370), .Y(n307) );
  OAI22X1 U415 ( .A(\regs_matrix[13][15] ), .B(n361), .C(\regs_matrix[15][15] ), .D(n15), .Y(n306) );
  NOR2X1 U416 ( .A(n310), .B(n311), .Y(n309) );
  OAI22X1 U417 ( .A(outreg_data[15]), .B(n380), .C(\regs_matrix[2][15] ), .D(
        n341), .Y(n311) );
  OAI22X1 U418 ( .A(\regs_matrix[4][15] ), .B(n344), .C(\regs_matrix[6][15] ), 
        .D(n346), .Y(n310) );
  NOR2X1 U419 ( .A(n312), .B(n313), .Y(n308) );
  OAI22X1 U420 ( .A(\regs_matrix[3][15] ), .B(n369), .C(\regs_matrix[1][15] ), 
        .D(n370), .Y(n313) );
  OAI22X1 U421 ( .A(\regs_matrix[5][15] ), .B(n359), .C(\regs_matrix[7][15] ), 
        .D(n39), .Y(n312) );
  NOR2X1 U422 ( .A(n314), .B(n315), .Y(n79) );
  OAI21X1 U423 ( .A(\regs_matrix[6][16] ), .B(n346), .C(n316), .Y(n315) );
  AOI22X1 U424 ( .A(n338), .B(n317), .C(n332), .D(n318), .Y(n316) );
  INVX2 U425 ( .A(outreg_data[16]), .Y(n318) );
  INVX2 U426 ( .A(\regs_matrix[2][16] ), .Y(n317) );
  OAI21X1 U427 ( .A(\regs_matrix[4][16] ), .B(n343), .C(n356), .Y(n314) );
  NOR2X1 U428 ( .A(n319), .B(n320), .Y(n80) );
  OAI22X1 U429 ( .A(\regs_matrix[3][16] ), .B(n369), .C(\regs_matrix[1][16] ), 
        .D(n370), .Y(n320) );
  OAI22X1 U430 ( .A(\regs_matrix[5][16] ), .B(n358), .C(\regs_matrix[7][16] ), 
        .D(n53), .Y(n319) );
  NOR2X1 U431 ( .A(n321), .B(n322), .Y(n81) );
  OAI21X1 U432 ( .A(\regs_matrix[12][16] ), .B(n366), .C(n323), .Y(n322) );
  AOI22X1 U433 ( .A(n338), .B(n324), .C(n357), .D(n625), .Y(n323) );
  NAND3X1 U434 ( .A(n325), .B(n326), .C(n327), .Y(n92) );
  INVX2 U435 ( .A(\regs_matrix[10][16] ), .Y(n324) );
  NAND3X1 U436 ( .A(n326), .B(N11), .C(n327), .Y(n93) );
  NAND3X1 U437 ( .A(n325), .B(N12), .C(n327), .Y(n94) );
  OAI22X1 U438 ( .A(\regs_matrix[9][16] ), .B(n370), .C(\regs_matrix[14][16] ), 
        .D(n348), .Y(n321) );
  NAND3X1 U439 ( .A(N12), .B(N11), .C(n327), .Y(n95) );
  NAND3X1 U440 ( .A(N10), .B(n326), .C(n325), .Y(n99) );
  NOR2X1 U441 ( .A(n328), .B(n329), .Y(n82) );
  OAI21X1 U442 ( .A(\regs_matrix[11][16] ), .B(n369), .C(N13), .Y(n329) );
  NAND2X1 U443 ( .A(n330), .B(n326), .Y(n98) );
  INVX2 U444 ( .A(N12), .Y(n326) );
  OAI22X1 U445 ( .A(\regs_matrix[15][16] ), .B(n52), .C(\regs_matrix[13][16] ), 
        .D(n355), .Y(n328) );
  NAND3X1 U446 ( .A(N12), .B(N10), .C(n325), .Y(n100) );
  NAND2X1 U447 ( .A(N12), .B(n330), .Y(n101) );
  INVX2 U448 ( .A(n331), .Y(n330) );
  NAND2X1 U449 ( .A(N11), .B(N10), .Y(n331) );
  INVX8 U450 ( .A(n337), .Y(n340) );
  INVX8 U451 ( .A(n365), .Y(n349) );
  INVX2 U452 ( .A(n92), .Y(n332) );
  INVX4 U453 ( .A(n353), .Y(n355) );
  INVX4 U454 ( .A(n342), .Y(n343) );
  INVX4 U455 ( .A(n342), .Y(n344) );
  INVX2 U456 ( .A(n93), .Y(n335) );
  INVX2 U457 ( .A(n92), .Y(n357) );
  INVX4 U458 ( .A(n362), .Y(n352) );
  INVX4 U459 ( .A(n363), .Y(n351) );
  BUFX2 U460 ( .A(n361), .Y(n358) );
  INVX4 U461 ( .A(n345), .Y(n346) );
  INVX4 U462 ( .A(n345), .Y(n347) );
  INVX4 U463 ( .A(n345), .Y(n348) );
  INVX4 U464 ( .A(n353), .Y(n359) );
  INVX2 U465 ( .A(n94), .Y(n342) );
  BUFX4 U466 ( .A(n94), .Y(n360) );
  BUFX2 U467 ( .A(n100), .Y(n361) );
  INVX1 U468 ( .A(n332), .Y(n364) );
  INVX2 U469 ( .A(n99), .Y(n363) );
  INVX1 U470 ( .A(n367), .Y(n366) );
  INVX1 U471 ( .A(n332), .Y(n368) );
  INVX4 U472 ( .A(n365), .Y(n369) );
  INVX2 U473 ( .A(n363), .Y(n370) );
  INVX2 U474 ( .A(N13), .Y(n356) );
  AND2X2 U475 ( .A(n296), .B(n297), .Y(n372) );
  MUX2X1 U476 ( .B(n372), .A(n371), .S(N13), .Y(n373) );
  AND2X2 U477 ( .A(n308), .B(n309), .Y(n375) );
  AND2X2 U478 ( .A(n302), .B(n303), .Y(n376) );
  MUX2X1 U479 ( .B(n376), .A(n375), .S(n356), .Y(n377) );
  INVX8 U480 ( .A(n379), .Y(r1_data[11]) );
  INVX4 U481 ( .A(n84), .Y(n379) );
  INVX4 U482 ( .A(N11), .Y(n325) );
  INVX4 U483 ( .A(n98), .Y(n365) );
  NAND3X1 U484 ( .A(n325), .B(n326), .C(n327), .Y(n380) );
  INVX1 U485 ( .A(n365), .Y(n350) );
  INVX4 U486 ( .A(n377), .Y(r1_data[15]) );
  INVX2 U487 ( .A(n99), .Y(n362) );
  AOI22X1 U488 ( .A(n384), .B(n383), .C(n382), .D(n381), .Y(n385) );
  INVX2 U489 ( .A(n385), .Y(r2_data[16]) );
  MUX2X1 U490 ( .B(n386), .A(n387), .S(N17), .Y(r2_data[0]) );
  NAND2X1 U491 ( .A(n388), .B(n389), .Y(n387) );
  NOR2X1 U492 ( .A(n390), .B(n391), .Y(n389) );
  OAI22X1 U493 ( .A(\regs_matrix[8][0] ), .B(n670), .C(\regs_matrix[10][0] ), 
        .D(n675), .Y(n391) );
  OAI22X1 U494 ( .A(\regs_matrix[12][0] ), .B(n637), .C(\regs_matrix[14][0] ), 
        .D(n692), .Y(n390) );
  NOR2X1 U495 ( .A(n396), .B(n397), .Y(n388) );
  OAI22X1 U496 ( .A(\regs_matrix[11][0] ), .B(n59), .C(\regs_matrix[9][0] ), 
        .D(n646), .Y(n397) );
  OAI22X1 U497 ( .A(\regs_matrix[13][0] ), .B(n648), .C(\regs_matrix[15][0] ), 
        .D(n65), .Y(n396) );
  NAND2X1 U498 ( .A(n401), .B(n402), .Y(n386) );
  NOR2X1 U499 ( .A(n403), .B(n404), .Y(n402) );
  OAI22X1 U500 ( .A(outreg_data[0]), .B(n671), .C(\regs_matrix[2][0] ), .D(
        n675), .Y(n404) );
  OAI22X1 U501 ( .A(\regs_matrix[4][0] ), .B(n637), .C(\regs_matrix[6][0] ), 
        .D(n693), .Y(n403) );
  NOR2X1 U502 ( .A(n405), .B(n406), .Y(n401) );
  OAI22X1 U503 ( .A(\regs_matrix[3][0] ), .B(n59), .C(\regs_matrix[1][0] ), 
        .D(n673), .Y(n406) );
  OAI22X1 U504 ( .A(\regs_matrix[5][0] ), .B(n648), .C(\regs_matrix[7][0] ), 
        .D(n65), .Y(n405) );
  NAND2X1 U505 ( .A(n409), .B(n410), .Y(n408) );
  NOR2X1 U506 ( .A(n411), .B(n412), .Y(n410) );
  OAI22X1 U507 ( .A(\regs_matrix[8][1] ), .B(n672), .C(\regs_matrix[10][1] ), 
        .D(n675), .Y(n412) );
  OAI22X1 U508 ( .A(\regs_matrix[12][1] ), .B(n637), .C(\regs_matrix[14][1] ), 
        .D(n691), .Y(n411) );
  NOR2X1 U509 ( .A(n413), .B(n414), .Y(n409) );
  OAI22X1 U510 ( .A(\regs_matrix[11][1] ), .B(n60), .C(\regs_matrix[9][1] ), 
        .D(n646), .Y(n414) );
  OAI22X1 U511 ( .A(\regs_matrix[13][1] ), .B(n648), .C(\regs_matrix[15][1] ), 
        .D(n65), .Y(n413) );
  NAND2X1 U512 ( .A(n415), .B(n416), .Y(n407) );
  NOR2X1 U513 ( .A(n417), .B(n418), .Y(n416) );
  OAI22X1 U514 ( .A(outreg_data[1]), .B(n663), .C(\regs_matrix[2][1] ), .D(
        n675), .Y(n418) );
  OAI22X1 U515 ( .A(\regs_matrix[4][1] ), .B(n637), .C(\regs_matrix[6][1] ), 
        .D(n690), .Y(n417) );
  NOR2X1 U516 ( .A(n419), .B(n420), .Y(n415) );
  OAI22X1 U517 ( .A(\regs_matrix[3][1] ), .B(n61), .C(\regs_matrix[1][1] ), 
        .D(n646), .Y(n420) );
  OAI22X1 U518 ( .A(\regs_matrix[5][1] ), .B(n648), .C(\regs_matrix[7][1] ), 
        .D(n65), .Y(n419) );
  MUX2X1 U519 ( .B(n421), .A(n422), .S(N17), .Y(r2_data[2]) );
  NAND2X1 U520 ( .A(n423), .B(n424), .Y(n422) );
  NOR2X1 U521 ( .A(n425), .B(n426), .Y(n424) );
  OAI22X1 U522 ( .A(\regs_matrix[8][2] ), .B(n672), .C(\regs_matrix[10][2] ), 
        .D(n675), .Y(n426) );
  OAI22X1 U523 ( .A(\regs_matrix[12][2] ), .B(n637), .C(\regs_matrix[14][2] ), 
        .D(n706), .Y(n425) );
  NOR2X1 U524 ( .A(n427), .B(n428), .Y(n423) );
  OAI22X1 U525 ( .A(\regs_matrix[11][2] ), .B(n61), .C(\regs_matrix[9][2] ), 
        .D(n646), .Y(n428) );
  OAI22X1 U526 ( .A(\regs_matrix[13][2] ), .B(n648), .C(\regs_matrix[15][2] ), 
        .D(n66), .Y(n427) );
  NAND2X1 U527 ( .A(n429), .B(n430), .Y(n421) );
  NOR2X1 U528 ( .A(n431), .B(n432), .Y(n430) );
  OAI22X1 U529 ( .A(outreg_data[2]), .B(n661), .C(\regs_matrix[2][2] ), .D(
        n675), .Y(n432) );
  OAI22X1 U530 ( .A(\regs_matrix[4][2] ), .B(n637), .C(\regs_matrix[6][2] ), 
        .D(n707), .Y(n431) );
  NOR2X1 U531 ( .A(n433), .B(n434), .Y(n429) );
  OAI22X1 U532 ( .A(\regs_matrix[3][2] ), .B(n60), .C(\regs_matrix[1][2] ), 
        .D(n646), .Y(n434) );
  OAI22X1 U533 ( .A(\regs_matrix[5][2] ), .B(n648), .C(\regs_matrix[7][2] ), 
        .D(n66), .Y(n433) );
  MUX2X1 U534 ( .B(n435), .A(n436), .S(n652), .Y(r2_data[3]) );
  NAND2X1 U535 ( .A(n437), .B(n438), .Y(n436) );
  NOR2X1 U536 ( .A(n439), .B(n440), .Y(n438) );
  OAI22X1 U537 ( .A(\regs_matrix[8][3] ), .B(n660), .C(\regs_matrix[10][3] ), 
        .D(n675), .Y(n440) );
  OAI22X1 U538 ( .A(\regs_matrix[12][3] ), .B(n637), .C(\regs_matrix[14][3] ), 
        .D(n705), .Y(n439) );
  NOR2X1 U539 ( .A(n441), .B(n442), .Y(n437) );
  OAI22X1 U540 ( .A(\regs_matrix[11][3] ), .B(n61), .C(\regs_matrix[9][3] ), 
        .D(n646), .Y(n442) );
  OAI22X1 U541 ( .A(\regs_matrix[13][3] ), .B(n648), .C(\regs_matrix[15][3] ), 
        .D(n66), .Y(n441) );
  NAND2X1 U542 ( .A(n443), .B(n444), .Y(n435) );
  NOR2X1 U543 ( .A(n445), .B(n446), .Y(n444) );
  OAI22X1 U544 ( .A(outreg_data[3]), .B(n662), .C(\regs_matrix[2][3] ), .D(
        n675), .Y(n446) );
  OAI22X1 U545 ( .A(\regs_matrix[4][3] ), .B(n637), .C(\regs_matrix[6][3] ), 
        .D(n712), .Y(n445) );
  NOR2X1 U546 ( .A(n447), .B(n448), .Y(n443) );
  OAI22X1 U547 ( .A(\regs_matrix[3][3] ), .B(n60), .C(\regs_matrix[1][3] ), 
        .D(n646), .Y(n448) );
  OAI22X1 U548 ( .A(\regs_matrix[5][3] ), .B(n648), .C(\regs_matrix[7][3] ), 
        .D(n66), .Y(n447) );
  MUX2X1 U549 ( .B(n449), .A(n450), .S(N17), .Y(r2_data[4]) );
  NAND2X1 U550 ( .A(n451), .B(n452), .Y(n450) );
  NOR2X1 U551 ( .A(n453), .B(n454), .Y(n452) );
  OAI22X1 U552 ( .A(\regs_matrix[8][4] ), .B(n668), .C(\regs_matrix[10][4] ), 
        .D(n635), .Y(n454) );
  OAI22X1 U553 ( .A(\regs_matrix[12][4] ), .B(n637), .C(\regs_matrix[14][4] ), 
        .D(n682), .Y(n453) );
  NOR2X1 U554 ( .A(n455), .B(n456), .Y(n451) );
  OAI22X1 U555 ( .A(\regs_matrix[11][4] ), .B(n60), .C(\regs_matrix[9][4] ), 
        .D(n646), .Y(n456) );
  OAI22X1 U556 ( .A(\regs_matrix[13][4] ), .B(n64), .C(\regs_matrix[15][4] ), 
        .D(n66), .Y(n455) );
  NAND2X1 U557 ( .A(n457), .B(n458), .Y(n449) );
  NOR2X1 U558 ( .A(n459), .B(n460), .Y(n458) );
  OAI22X1 U559 ( .A(outreg_data[4]), .B(n669), .C(\regs_matrix[2][4] ), .D(
        n635), .Y(n460) );
  OAI22X1 U560 ( .A(\regs_matrix[4][4] ), .B(n637), .C(\regs_matrix[6][4] ), 
        .D(n685), .Y(n459) );
  NOR2X1 U561 ( .A(n461), .B(n462), .Y(n457) );
  OAI22X1 U562 ( .A(\regs_matrix[3][4] ), .B(n61), .C(\regs_matrix[1][4] ), 
        .D(n646), .Y(n462) );
  OAI22X1 U563 ( .A(\regs_matrix[5][4] ), .B(n63), .C(\regs_matrix[7][4] ), 
        .D(n66), .Y(n461) );
  MUX2X1 U564 ( .B(n463), .A(n464), .S(n652), .Y(r2_data[5]) );
  NAND2X1 U565 ( .A(n465), .B(n466), .Y(n464) );
  NOR2X1 U566 ( .A(n467), .B(n468), .Y(n466) );
  OAI22X1 U567 ( .A(\regs_matrix[8][5] ), .B(n672), .C(\regs_matrix[10][5] ), 
        .D(n635), .Y(n468) );
  OAI22X1 U568 ( .A(\regs_matrix[12][5] ), .B(n637), .C(\regs_matrix[14][5] ), 
        .D(n681), .Y(n467) );
  NOR2X1 U569 ( .A(n469), .B(n470), .Y(n465) );
  OAI22X1 U570 ( .A(\regs_matrix[11][5] ), .B(n61), .C(\regs_matrix[9][5] ), 
        .D(n656), .Y(n470) );
  OAI22X1 U571 ( .A(\regs_matrix[13][5] ), .B(n62), .C(\regs_matrix[15][5] ), 
        .D(n66), .Y(n469) );
  NAND2X1 U572 ( .A(n471), .B(n472), .Y(n463) );
  NOR2X1 U573 ( .A(n473), .B(n474), .Y(n472) );
  OAI22X1 U574 ( .A(outreg_data[5]), .B(n663), .C(\regs_matrix[2][5] ), .D(
        n635), .Y(n474) );
  OAI22X1 U575 ( .A(\regs_matrix[4][5] ), .B(n637), .C(\regs_matrix[6][5] ), 
        .D(n684), .Y(n473) );
  NOR2X1 U576 ( .A(n475), .B(n476), .Y(n471) );
  OAI22X1 U577 ( .A(\regs_matrix[3][5] ), .B(n60), .C(\regs_matrix[1][5] ), 
        .D(n656), .Y(n476) );
  OAI22X1 U578 ( .A(\regs_matrix[5][5] ), .B(n62), .C(\regs_matrix[7][5] ), 
        .D(n66), .Y(n475) );
  MUX2X1 U579 ( .B(n477), .A(n478), .S(N17), .Y(r2_data[6]) );
  NAND2X1 U580 ( .A(n479), .B(n480), .Y(n478) );
  NOR2X1 U581 ( .A(n481), .B(n482), .Y(n480) );
  OAI22X1 U582 ( .A(\regs_matrix[8][6] ), .B(n666), .C(\regs_matrix[10][6] ), 
        .D(n635), .Y(n482) );
  OAI22X1 U583 ( .A(\regs_matrix[12][6] ), .B(n637), .C(\regs_matrix[14][6] ), 
        .D(n708), .Y(n481) );
  NOR2X1 U584 ( .A(n483), .B(n484), .Y(n479) );
  OAI22X1 U585 ( .A(\regs_matrix[11][6] ), .B(n60), .C(\regs_matrix[9][6] ), 
        .D(n645), .Y(n484) );
  OAI22X1 U586 ( .A(\regs_matrix[13][6] ), .B(n64), .C(\regs_matrix[15][6] ), 
        .D(n650), .Y(n483) );
  NAND2X1 U587 ( .A(n485), .B(n486), .Y(n477) );
  NOR2X1 U588 ( .A(n487), .B(n488), .Y(n486) );
  OAI22X1 U589 ( .A(outreg_data[6]), .B(n667), .C(\regs_matrix[2][6] ), .D(
        n635), .Y(n488) );
  OAI22X1 U590 ( .A(\regs_matrix[4][6] ), .B(n637), .C(\regs_matrix[6][6] ), 
        .D(n711), .Y(n487) );
  NOR2X1 U591 ( .A(n489), .B(n490), .Y(n485) );
  OAI22X1 U592 ( .A(\regs_matrix[3][6] ), .B(n60), .C(\regs_matrix[1][6] ), 
        .D(n645), .Y(n490) );
  OAI22X1 U593 ( .A(\regs_matrix[5][6] ), .B(n64), .C(\regs_matrix[7][6] ), 
        .D(n650), .Y(n489) );
  MUX2X1 U594 ( .B(n491), .A(n492), .S(n652), .Y(r2_data[7]) );
  NAND2X1 U595 ( .A(n493), .B(n494), .Y(n492) );
  NOR2X1 U596 ( .A(n495), .B(n496), .Y(n494) );
  OAI22X1 U597 ( .A(\regs_matrix[8][7] ), .B(n671), .C(\regs_matrix[10][7] ), 
        .D(n635), .Y(n496) );
  OAI22X1 U598 ( .A(\regs_matrix[12][7] ), .B(n637), .C(\regs_matrix[14][7] ), 
        .D(n680), .Y(n495) );
  NOR2X1 U599 ( .A(n497), .B(n498), .Y(n493) );
  OAI22X1 U600 ( .A(\regs_matrix[11][7] ), .B(n61), .C(\regs_matrix[9][7] ), 
        .D(n645), .Y(n498) );
  OAI22X1 U601 ( .A(\regs_matrix[13][7] ), .B(n63), .C(\regs_matrix[15][7] ), 
        .D(n650), .Y(n497) );
  NAND2X1 U602 ( .A(n499), .B(n500), .Y(n491) );
  NOR2X1 U603 ( .A(n501), .B(n502), .Y(n500) );
  OAI22X1 U604 ( .A(outreg_data[7]), .B(n658), .C(\regs_matrix[2][7] ), .D(
        n635), .Y(n502) );
  OAI22X1 U605 ( .A(\regs_matrix[4][7] ), .B(n637), .C(\regs_matrix[6][7] ), 
        .D(n683), .Y(n501) );
  NOR2X1 U606 ( .A(n503), .B(n504), .Y(n499) );
  OAI22X1 U607 ( .A(\regs_matrix[3][7] ), .B(n61), .C(\regs_matrix[1][7] ), 
        .D(n645), .Y(n504) );
  OAI22X1 U608 ( .A(\regs_matrix[5][7] ), .B(n63), .C(\regs_matrix[7][7] ), 
        .D(n650), .Y(n503) );
  MUX2X1 U609 ( .B(n505), .A(n506), .S(N17), .Y(r2_data[8]) );
  NAND2X1 U610 ( .A(n507), .B(n508), .Y(n506) );
  NOR2X1 U611 ( .A(n509), .B(n510), .Y(n508) );
  OAI22X1 U612 ( .A(\regs_matrix[8][8] ), .B(n669), .C(\regs_matrix[10][8] ), 
        .D(n635), .Y(n510) );
  OAI22X1 U613 ( .A(\regs_matrix[12][8] ), .B(n637), .C(\regs_matrix[14][8] ), 
        .D(n678), .Y(n509) );
  NOR2X1 U614 ( .A(n511), .B(n512), .Y(n507) );
  OAI22X1 U615 ( .A(\regs_matrix[11][8] ), .B(n61), .C(\regs_matrix[9][8] ), 
        .D(n645), .Y(n512) );
  OAI22X1 U616 ( .A(\regs_matrix[13][8] ), .B(n64), .C(\regs_matrix[15][8] ), 
        .D(n650), .Y(n511) );
  NAND2X1 U617 ( .A(n513), .B(n514), .Y(n505) );
  NOR2X1 U618 ( .A(n515), .B(n516), .Y(n514) );
  OAI22X1 U619 ( .A(outreg_data[8]), .B(n662), .C(\regs_matrix[2][8] ), .D(
        n635), .Y(n516) );
  OAI22X1 U620 ( .A(\regs_matrix[4][8] ), .B(n637), .C(\regs_matrix[6][8] ), 
        .D(n679), .Y(n515) );
  NOR2X1 U621 ( .A(n517), .B(n518), .Y(n513) );
  OAI22X1 U622 ( .A(\regs_matrix[3][8] ), .B(n60), .C(\regs_matrix[1][8] ), 
        .D(n645), .Y(n518) );
  OAI22X1 U623 ( .A(\regs_matrix[5][8] ), .B(n64), .C(\regs_matrix[7][8] ), 
        .D(n650), .Y(n517) );
  MUX2X1 U624 ( .B(n519), .A(n520), .S(n652), .Y(r2_data[9]) );
  NAND2X1 U625 ( .A(n521), .B(n522), .Y(n520) );
  NOR2X1 U626 ( .A(n523), .B(n524), .Y(n522) );
  OAI22X1 U627 ( .A(\regs_matrix[8][9] ), .B(n667), .C(\regs_matrix[10][9] ), 
        .D(n635), .Y(n524) );
  OAI22X1 U628 ( .A(\regs_matrix[12][9] ), .B(n637), .C(\regs_matrix[14][9] ), 
        .D(n710), .Y(n523) );
  NOR2X1 U629 ( .A(n525), .B(n526), .Y(n521) );
  OAI22X1 U630 ( .A(\regs_matrix[11][9] ), .B(n61), .C(\regs_matrix[9][9] ), 
        .D(n645), .Y(n526) );
  OAI22X1 U631 ( .A(\regs_matrix[13][9] ), .B(n63), .C(\regs_matrix[15][9] ), 
        .D(n650), .Y(n525) );
  NAND2X1 U632 ( .A(n527), .B(n528), .Y(n519) );
  NOR2X1 U633 ( .A(n529), .B(n530), .Y(n528) );
  OAI22X1 U634 ( .A(outreg_data[9]), .B(n670), .C(\regs_matrix[2][9] ), .D(
        n635), .Y(n530) );
  OAI22X1 U635 ( .A(\regs_matrix[4][9] ), .B(n637), .C(\regs_matrix[6][9] ), 
        .D(n677), .Y(n529) );
  NOR2X1 U636 ( .A(n531), .B(n532), .Y(n527) );
  OAI22X1 U637 ( .A(\regs_matrix[3][9] ), .B(n60), .C(\regs_matrix[1][9] ), 
        .D(n645), .Y(n532) );
  OAI22X1 U638 ( .A(\regs_matrix[5][9] ), .B(n64), .C(\regs_matrix[7][9] ), 
        .D(n650), .Y(n531) );
  MUX2X1 U639 ( .B(n533), .A(n534), .S(N17), .Y(r2_data[10]) );
  NAND2X1 U640 ( .A(n535), .B(n536), .Y(n534) );
  NOR2X1 U641 ( .A(n537), .B(n538), .Y(n536) );
  OAI22X1 U642 ( .A(\regs_matrix[8][10] ), .B(n666), .C(\regs_matrix[10][10] ), 
        .D(n635), .Y(n538) );
  OAI22X1 U643 ( .A(\regs_matrix[12][10] ), .B(n637), .C(\regs_matrix[14][10] ), .D(n709), .Y(n537) );
  NOR2X1 U644 ( .A(n539), .B(n540), .Y(n535) );
  OAI22X1 U645 ( .A(\regs_matrix[11][10] ), .B(n60), .C(\regs_matrix[9][10] ), 
        .D(n645), .Y(n540) );
  OAI22X1 U646 ( .A(\regs_matrix[13][10] ), .B(n648), .C(\regs_matrix[15][10] ), .D(n650), .Y(n539) );
  NAND2X1 U647 ( .A(n541), .B(n542), .Y(n533) );
  NOR2X1 U648 ( .A(n543), .B(n544), .Y(n542) );
  OAI22X1 U649 ( .A(outreg_data[10]), .B(n668), .C(\regs_matrix[2][10] ), .D(
        n635), .Y(n544) );
  OAI22X1 U650 ( .A(\regs_matrix[4][10] ), .B(n58), .C(\regs_matrix[6][10] ), 
        .D(n676), .Y(n543) );
  NOR2X1 U651 ( .A(n545), .B(n546), .Y(n541) );
  OAI22X1 U652 ( .A(\regs_matrix[3][10] ), .B(n642), .C(\regs_matrix[1][10] ), 
        .D(n645), .Y(n546) );
  OAI22X1 U653 ( .A(\regs_matrix[5][10] ), .B(n63), .C(\regs_matrix[7][10] ), 
        .D(n650), .Y(n545) );
  MUX2X1 U654 ( .B(n547), .A(n548), .S(n652), .Y(r2_data[11]) );
  NAND2X1 U655 ( .A(n549), .B(n550), .Y(n548) );
  NOR2X1 U656 ( .A(n551), .B(n552), .Y(n550) );
  OAI22X1 U657 ( .A(\regs_matrix[8][11] ), .B(n658), .C(\regs_matrix[10][11] ), 
        .D(n675), .Y(n552) );
  OAI22X1 U658 ( .A(\regs_matrix[12][11] ), .B(n58), .C(\regs_matrix[14][11] ), 
        .D(n700), .Y(n551) );
  NOR2X1 U659 ( .A(n553), .B(n554), .Y(n549) );
  OAI22X1 U660 ( .A(\regs_matrix[11][11] ), .B(n642), .C(\regs_matrix[9][11] ), 
        .D(n645), .Y(n554) );
  OAI22X1 U661 ( .A(\regs_matrix[13][11] ), .B(n64), .C(\regs_matrix[15][11] ), 
        .D(n650), .Y(n553) );
  NAND2X1 U662 ( .A(n555), .B(n556), .Y(n547) );
  NOR2X1 U663 ( .A(n557), .B(n558), .Y(n556) );
  OAI22X1 U664 ( .A(outreg_data[11]), .B(n659), .C(\regs_matrix[2][11] ), .D(
        n635), .Y(n558) );
  OAI22X1 U665 ( .A(\regs_matrix[4][11] ), .B(n58), .C(\regs_matrix[6][11] ), 
        .D(n701), .Y(n557) );
  NOR2X1 U666 ( .A(n559), .B(n560), .Y(n555) );
  OAI22X1 U667 ( .A(\regs_matrix[3][11] ), .B(n642), .C(\regs_matrix[1][11] ), 
        .D(n645), .Y(n560) );
  OAI22X1 U668 ( .A(\regs_matrix[5][11] ), .B(n63), .C(\regs_matrix[7][11] ), 
        .D(n650), .Y(n559) );
  MUX2X1 U669 ( .B(n561), .A(n562), .S(N17), .Y(r2_data[12]) );
  NAND2X1 U670 ( .A(n563), .B(n564), .Y(n562) );
  NOR2X1 U671 ( .A(n565), .B(n566), .Y(n564) );
  OAI22X1 U672 ( .A(\regs_matrix[8][12] ), .B(n665), .C(\regs_matrix[10][12] ), 
        .D(n635), .Y(n566) );
  OAI22X1 U673 ( .A(\regs_matrix[12][12] ), .B(n58), .C(\regs_matrix[14][12] ), 
        .D(n687), .Y(n565) );
  NOR2X1 U674 ( .A(n567), .B(n568), .Y(n563) );
  OAI22X1 U675 ( .A(\regs_matrix[11][12] ), .B(n642), .C(\regs_matrix[9][12] ), 
        .D(n644), .Y(n568) );
  OAI22X1 U676 ( .A(\regs_matrix[13][12] ), .B(n62), .C(\regs_matrix[15][12] ), 
        .D(n66), .Y(n567) );
  NAND2X1 U677 ( .A(n569), .B(n570), .Y(n561) );
  NOR2X1 U678 ( .A(n571), .B(n572), .Y(n570) );
  OAI22X1 U679 ( .A(outreg_data[12]), .B(n657), .C(\regs_matrix[2][12] ), .D(
        n635), .Y(n572) );
  OAI22X1 U680 ( .A(\regs_matrix[4][12] ), .B(n58), .C(\regs_matrix[6][12] ), 
        .D(n689), .Y(n571) );
  NOR2X1 U681 ( .A(n573), .B(n574), .Y(n569) );
  OAI22X1 U682 ( .A(\regs_matrix[3][12] ), .B(n642), .C(\regs_matrix[1][12] ), 
        .D(n644), .Y(n574) );
  OAI22X1 U683 ( .A(\regs_matrix[5][12] ), .B(n62), .C(\regs_matrix[7][12] ), 
        .D(n66), .Y(n573) );
  MUX2X1 U684 ( .B(n575), .A(n576), .S(n652), .Y(r2_data[13]) );
  NAND2X1 U685 ( .A(n577), .B(n578), .Y(n576) );
  NOR2X1 U686 ( .A(n579), .B(n580), .Y(n578) );
  OAI22X1 U687 ( .A(\regs_matrix[8][13] ), .B(n659), .C(\regs_matrix[10][13] ), 
        .D(n635), .Y(n580) );
  OAI22X1 U688 ( .A(\regs_matrix[12][13] ), .B(n58), .C(\regs_matrix[14][13] ), 
        .D(n702), .Y(n579) );
  NOR2X1 U689 ( .A(n581), .B(n582), .Y(n577) );
  OAI22X1 U690 ( .A(\regs_matrix[11][13] ), .B(n642), .C(\regs_matrix[9][13] ), 
        .D(n644), .Y(n582) );
  OAI22X1 U691 ( .A(\regs_matrix[13][13] ), .B(n64), .C(\regs_matrix[15][13] ), 
        .D(n66), .Y(n581) );
  NAND2X1 U692 ( .A(n583), .B(n584), .Y(n575) );
  NOR2X1 U693 ( .A(n585), .B(n586), .Y(n584) );
  OAI22X1 U694 ( .A(outreg_data[13]), .B(n665), .C(\regs_matrix[2][13] ), .D(
        n635), .Y(n586) );
  OAI22X1 U695 ( .A(\regs_matrix[4][13] ), .B(n58), .C(\regs_matrix[6][13] ), 
        .D(n704), .Y(n585) );
  NOR2X1 U696 ( .A(n587), .B(n588), .Y(n583) );
  OAI22X1 U697 ( .A(\regs_matrix[3][13] ), .B(n642), .C(\regs_matrix[1][13] ), 
        .D(n644), .Y(n588) );
  OAI22X1 U698 ( .A(\regs_matrix[5][13] ), .B(n63), .C(\regs_matrix[7][13] ), 
        .D(n66), .Y(n587) );
  MUX2X1 U699 ( .B(n589), .A(n590), .S(N17), .Y(r2_data[14]) );
  NAND2X1 U700 ( .A(n591), .B(n592), .Y(n590) );
  NOR2X1 U701 ( .A(n593), .B(n594), .Y(n592) );
  OAI22X1 U702 ( .A(\regs_matrix[8][14] ), .B(n664), .C(\regs_matrix[10][14] ), 
        .D(n635), .Y(n594) );
  OAI22X1 U703 ( .A(\regs_matrix[12][14] ), .B(n58), .C(\regs_matrix[14][14] ), 
        .D(n686), .Y(n593) );
  NOR2X1 U704 ( .A(n595), .B(n596), .Y(n591) );
  OAI22X1 U705 ( .A(\regs_matrix[11][14] ), .B(n642), .C(\regs_matrix[9][14] ), 
        .D(n644), .Y(n596) );
  OAI22X1 U706 ( .A(\regs_matrix[13][14] ), .B(n62), .C(\regs_matrix[15][14] ), 
        .D(n66), .Y(n595) );
  NAND2X1 U707 ( .A(n597), .B(n598), .Y(n589) );
  NOR2X1 U708 ( .A(n599), .B(n600), .Y(n598) );
  OAI22X1 U709 ( .A(outreg_data[14]), .B(n668), .C(\regs_matrix[2][14] ), .D(
        n635), .Y(n600) );
  OAI22X1 U710 ( .A(\regs_matrix[4][14] ), .B(n58), .C(\regs_matrix[6][14] ), 
        .D(n688), .Y(n599) );
  NOR2X1 U711 ( .A(n601), .B(n602), .Y(n597) );
  OAI22X1 U712 ( .A(\regs_matrix[3][14] ), .B(n642), .C(\regs_matrix[1][14] ), 
        .D(n644), .Y(n602) );
  OAI22X1 U713 ( .A(\regs_matrix[5][14] ), .B(n62), .C(\regs_matrix[7][14] ), 
        .D(n66), .Y(n601) );
  MUX2X1 U714 ( .B(n603), .A(n604), .S(n652), .Y(r2_data[15]) );
  NAND2X1 U715 ( .A(n605), .B(n606), .Y(n604) );
  NOR2X1 U716 ( .A(n607), .B(n608), .Y(n606) );
  OAI22X1 U717 ( .A(\regs_matrix[8][15] ), .B(n669), .C(\regs_matrix[10][15] ), 
        .D(n635), .Y(n608) );
  OAI22X1 U718 ( .A(\regs_matrix[12][15] ), .B(n58), .C(\regs_matrix[14][15] ), 
        .D(n703), .Y(n607) );
  NOR2X1 U719 ( .A(n609), .B(n610), .Y(n605) );
  OAI22X1 U720 ( .A(\regs_matrix[11][15] ), .B(n642), .C(\regs_matrix[9][15] ), 
        .D(n644), .Y(n610) );
  OAI22X1 U721 ( .A(\regs_matrix[13][15] ), .B(n64), .C(\regs_matrix[15][15] ), 
        .D(n66), .Y(n609) );
  NAND2X1 U722 ( .A(n611), .B(n612), .Y(n603) );
  NOR2X1 U723 ( .A(n613), .B(n614), .Y(n612) );
  OAI22X1 U724 ( .A(outreg_data[15]), .B(n664), .C(\regs_matrix[2][15] ), .D(
        n635), .Y(n614) );
  OAI22X1 U725 ( .A(\regs_matrix[4][15] ), .B(n58), .C(\regs_matrix[6][15] ), 
        .D(n703), .Y(n613) );
  NOR2X1 U726 ( .A(n615), .B(n616), .Y(n611) );
  OAI22X1 U727 ( .A(\regs_matrix[3][15] ), .B(n642), .C(\regs_matrix[1][15] ), 
        .D(n644), .Y(n616) );
  OAI22X1 U728 ( .A(\regs_matrix[5][15] ), .B(n63), .C(\regs_matrix[7][15] ), 
        .D(n66), .Y(n615) );
  NOR2X1 U729 ( .A(n617), .B(n618), .Y(n381) );
  OAI21X1 U730 ( .A(\regs_matrix[6][16] ), .B(n682), .C(n619), .Y(n618) );
  AOI22X1 U731 ( .A(n634), .B(n317), .C(n631), .D(n318), .Y(n619) );
  OAI21X1 U732 ( .A(\regs_matrix[4][16] ), .B(n58), .C(n653), .Y(n617) );
  NOR2X1 U733 ( .A(n620), .B(n621), .Y(n382) );
  OAI22X1 U734 ( .A(\regs_matrix[3][16] ), .B(n642), .C(\regs_matrix[1][16] ), 
        .D(n656), .Y(n621) );
  OAI22X1 U735 ( .A(\regs_matrix[5][16] ), .B(n64), .C(\regs_matrix[7][16] ), 
        .D(n66), .Y(n620) );
  NOR2X1 U736 ( .A(n622), .B(n623), .Y(n383) );
  OAI21X1 U737 ( .A(\regs_matrix[12][16] ), .B(n58), .C(n624), .Y(n623) );
  AOI22X1 U738 ( .A(n634), .B(n324), .C(n631), .D(n625), .Y(n624) );
  INVX2 U739 ( .A(\regs_matrix[8][16] ), .Y(n625) );
  NAND3X1 U740 ( .A(n626), .B(n654), .C(n627), .Y(n392) );
  NAND3X1 U741 ( .A(N15), .B(n654), .C(n627), .Y(n393) );
  NAND3X1 U742 ( .A(N16), .B(n626), .C(n627), .Y(n394) );
  OAI22X1 U743 ( .A(\regs_matrix[9][16] ), .B(n644), .C(\regs_matrix[14][16] ), 
        .D(n685), .Y(n622) );
  NAND3X1 U744 ( .A(N16), .B(N15), .C(n627), .Y(n395) );
  INVX2 U745 ( .A(N14), .Y(n627) );
  NAND3X1 U746 ( .A(n655), .B(n654), .C(n626), .Y(n399) );
  NOR2X1 U747 ( .A(n628), .B(n629), .Y(n384) );
  OAI21X1 U748 ( .A(\regs_matrix[11][16] ), .B(n642), .C(N17), .Y(n629) );
  NAND2X1 U749 ( .A(n78), .B(n654), .Y(n398) );
  OAI22X1 U750 ( .A(\regs_matrix[15][16] ), .B(n66), .C(\regs_matrix[13][16] ), 
        .D(n63), .Y(n628) );
  NAND3X1 U751 ( .A(N16), .B(n655), .C(n626), .Y(n400) );
  INVX8 U752 ( .A(n634), .Y(n635) );
  INVX1 U753 ( .A(N15), .Y(n626) );
  INVX4 U754 ( .A(n399), .Y(n643) );
  BUFX2 U755 ( .A(N14), .Y(n655) );
  INVX1 U756 ( .A(n643), .Y(n656) );
  BUFX2 U757 ( .A(n630), .Y(n631) );
  BUFX2 U758 ( .A(n630), .Y(n632) );
  INVX1 U759 ( .A(n631), .Y(n657) );
  INVX1 U760 ( .A(n631), .Y(n658) );
  INVX1 U761 ( .A(n631), .Y(n659) );
  INVX1 U762 ( .A(n631), .Y(n660) );
  INVX1 U763 ( .A(n633), .Y(n661) );
  INVX1 U764 ( .A(n633), .Y(n662) );
  INVX2 U765 ( .A(n632), .Y(n663) );
  INVX1 U766 ( .A(n632), .Y(n664) );
  INVX1 U767 ( .A(n632), .Y(n665) );
  INVX1 U768 ( .A(n632), .Y(n666) );
  INVX1 U769 ( .A(n632), .Y(n667) );
  INVX1 U770 ( .A(n630), .Y(n668) );
  INVX1 U771 ( .A(n630), .Y(n669) );
  INVX1 U772 ( .A(n630), .Y(n670) );
  INVX1 U773 ( .A(n630), .Y(n671) );
  INVX1 U774 ( .A(n630), .Y(n672) );
  INVX2 U775 ( .A(n643), .Y(n644) );
  INVX1 U776 ( .A(n643), .Y(n673) );
  BUFX2 U777 ( .A(n674), .Y(n634) );
  INVX2 U778 ( .A(n653), .Y(n652) );
  MUX2X1 U779 ( .B(n408), .A(n407), .S(n653), .Y(r2_data[1]) );
  INVX2 U780 ( .A(n393), .Y(n674) );
  INVX2 U781 ( .A(n717), .Y(n639) );
  INVX1 U782 ( .A(n694), .Y(n676) );
  INVX1 U783 ( .A(n694), .Y(n677) );
  INVX1 U784 ( .A(n694), .Y(n678) );
  INVX1 U785 ( .A(n695), .Y(n679) );
  INVX1 U786 ( .A(n695), .Y(n680) );
  INVX1 U787 ( .A(n695), .Y(n681) );
  INVX1 U788 ( .A(n696), .Y(n682) );
  INVX1 U789 ( .A(n696), .Y(n683) );
  INVX1 U790 ( .A(n696), .Y(n684) );
  INVX1 U791 ( .A(n697), .Y(n685) );
  INVX1 U792 ( .A(n697), .Y(n686) );
  INVX1 U793 ( .A(n697), .Y(n687) );
  INVX1 U794 ( .A(n698), .Y(n688) );
  INVX1 U795 ( .A(n698), .Y(n689) );
  INVX1 U796 ( .A(n698), .Y(n690) );
  INVX1 U797 ( .A(n699), .Y(n691) );
  INVX1 U798 ( .A(n699), .Y(n692) );
  INVX1 U799 ( .A(n699), .Y(n693) );
  INVX1 U800 ( .A(n717), .Y(n694) );
  INVX1 U801 ( .A(n717), .Y(n695) );
  INVX1 U802 ( .A(n717), .Y(n696) );
  INVX1 U803 ( .A(n717), .Y(n697) );
  INVX1 U804 ( .A(n717), .Y(n698) );
  BUFX2 U805 ( .A(n712), .Y(n700) );
  BUFX2 U806 ( .A(n712), .Y(n701) );
  BUFX2 U807 ( .A(n713), .Y(n702) );
  BUFX2 U808 ( .A(n713), .Y(n703) );
  BUFX2 U809 ( .A(n713), .Y(n704) );
  BUFX2 U810 ( .A(n714), .Y(n705) );
  BUFX2 U811 ( .A(n715), .Y(n706) );
  BUFX2 U812 ( .A(n715), .Y(n707) );
  BUFX2 U813 ( .A(n715), .Y(n708) );
  BUFX2 U814 ( .A(n716), .Y(n709) );
  BUFX2 U815 ( .A(n716), .Y(n710) );
  BUFX2 U816 ( .A(n716), .Y(n711) );
  INVX2 U817 ( .A(n639), .Y(n713) );
  INVX2 U818 ( .A(n639), .Y(n715) );
  INVX2 U819 ( .A(n639), .Y(n716) );
  INVX2 U820 ( .A(n67), .Y(n650) );
  INVX2 U821 ( .A(n395), .Y(n718) );
  INVX2 U822 ( .A(w_en), .Y(n771) );
  INVX2 U823 ( .A(w_sel[3]), .Y(n772) );
  INVX2 U824 ( .A(w_sel[1]), .Y(n773) );
  INVX2 U825 ( .A(w_sel[2]), .Y(n774) );
endmodule


module datapath ( clk, n_reset, op, src1, src2, dest, ext_data1, ext_data2, 
        outreg_data, overflow );
  input [2:0] op;
  input [3:0] src1;
  input [3:0] src2;
  input [3:0] dest;
  input [15:0] ext_data1;
  input [15:0] ext_data2;
  output [16:0] outreg_data;
  input clk, n_reset;
  output overflow;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36;
  wire   [16:0] src1_data;
  wire   [16:0] src2_data;
  wire   [16:0] alu_result;
  wire   [16:0] dest_data;
  tri   [2:0] op;
  tri   w_en;
  tri   [1:0] w_data_sel;
  tri   [1:0] alu_op;

  datapath_decode DEC ( .op(op), .w_en(w_en), .w_data_sel(w_data_sel), 
        .alu_op(alu_op) );
  alu CORE ( .src1_data(src1_data), .src2_data(src2_data), .alu_op(alu_op), 
        .result(alu_result), .overflow(overflow) );
  register_file RF ( .clk(clk), .n_reset(n_reset), .w_en(w_en), .r1_sel(src1), 
        .r2_sel(src2), .w_sel(dest), .w_data(dest_data), .r1_data(src1_data), 
        .r2_data(src2_data), .outreg_data(outreg_data) );
  AND2X2 U2 ( .A(n36), .B(n3), .Y(n1) );
  AND2X2 U3 ( .A(w_data_sel[0]), .B(n36), .Y(n2) );
  INVX2 U4 ( .A(w_data_sel[1]), .Y(n36) );
  AND2X2 U5 ( .A(alu_result[16]), .B(w_data_sel[1]), .Y(dest_data[16]) );
  INVX2 U6 ( .A(alu_result[15]), .Y(n5) );
  INVX2 U7 ( .A(w_data_sel[0]), .Y(n3) );
  AOI22X1 U8 ( .A(ext_data2[15]), .B(n2), .C(ext_data1[15]), .D(n1), .Y(n4) );
  OAI21X1 U9 ( .A(n36), .B(n5), .C(n4), .Y(dest_data[15]) );
  INVX2 U10 ( .A(alu_result[14]), .Y(n7) );
  AOI22X1 U11 ( .A(ext_data2[14]), .B(n2), .C(ext_data1[14]), .D(n1), .Y(n6)
         );
  OAI21X1 U12 ( .A(n36), .B(n7), .C(n6), .Y(dest_data[14]) );
  INVX2 U13 ( .A(alu_result[13]), .Y(n9) );
  AOI22X1 U14 ( .A(ext_data2[13]), .B(n2), .C(ext_data1[13]), .D(n1), .Y(n8)
         );
  OAI21X1 U15 ( .A(n36), .B(n9), .C(n8), .Y(dest_data[13]) );
  INVX2 U16 ( .A(alu_result[12]), .Y(n11) );
  AOI22X1 U17 ( .A(ext_data2[12]), .B(n2), .C(ext_data1[12]), .D(n1), .Y(n10)
         );
  OAI21X1 U18 ( .A(n36), .B(n11), .C(n10), .Y(dest_data[12]) );
  INVX2 U19 ( .A(alu_result[11]), .Y(n13) );
  AOI22X1 U20 ( .A(ext_data2[11]), .B(n2), .C(ext_data1[11]), .D(n1), .Y(n12)
         );
  OAI21X1 U21 ( .A(n36), .B(n13), .C(n12), .Y(dest_data[11]) );
  INVX2 U22 ( .A(alu_result[10]), .Y(n15) );
  AOI22X1 U23 ( .A(ext_data2[10]), .B(n2), .C(ext_data1[10]), .D(n1), .Y(n14)
         );
  OAI21X1 U24 ( .A(n36), .B(n15), .C(n14), .Y(dest_data[10]) );
  INVX2 U25 ( .A(alu_result[9]), .Y(n17) );
  AOI22X1 U26 ( .A(ext_data2[9]), .B(n2), .C(ext_data1[9]), .D(n1), .Y(n16) );
  OAI21X1 U27 ( .A(n36), .B(n17), .C(n16), .Y(dest_data[9]) );
  INVX2 U28 ( .A(alu_result[8]), .Y(n19) );
  AOI22X1 U29 ( .A(ext_data2[8]), .B(n2), .C(ext_data1[8]), .D(n1), .Y(n18) );
  OAI21X1 U30 ( .A(n36), .B(n19), .C(n18), .Y(dest_data[8]) );
  INVX2 U31 ( .A(alu_result[7]), .Y(n21) );
  AOI22X1 U32 ( .A(ext_data2[7]), .B(n2), .C(ext_data1[7]), .D(n1), .Y(n20) );
  OAI21X1 U33 ( .A(n36), .B(n21), .C(n20), .Y(dest_data[7]) );
  INVX2 U34 ( .A(alu_result[6]), .Y(n23) );
  AOI22X1 U35 ( .A(ext_data2[6]), .B(n2), .C(ext_data1[6]), .D(n1), .Y(n22) );
  OAI21X1 U36 ( .A(n36), .B(n23), .C(n22), .Y(dest_data[6]) );
  INVX2 U37 ( .A(alu_result[5]), .Y(n25) );
  AOI22X1 U38 ( .A(ext_data2[5]), .B(n2), .C(ext_data1[5]), .D(n1), .Y(n24) );
  OAI21X1 U39 ( .A(n36), .B(n25), .C(n24), .Y(dest_data[5]) );
  INVX2 U40 ( .A(alu_result[4]), .Y(n27) );
  AOI22X1 U41 ( .A(ext_data2[4]), .B(n2), .C(ext_data1[4]), .D(n1), .Y(n26) );
  OAI21X1 U42 ( .A(n36), .B(n27), .C(n26), .Y(dest_data[4]) );
  INVX2 U43 ( .A(alu_result[3]), .Y(n29) );
  AOI22X1 U44 ( .A(ext_data2[3]), .B(n2), .C(ext_data1[3]), .D(n1), .Y(n28) );
  OAI21X1 U45 ( .A(n36), .B(n29), .C(n28), .Y(dest_data[3]) );
  INVX2 U46 ( .A(alu_result[2]), .Y(n31) );
  AOI22X1 U47 ( .A(ext_data2[2]), .B(n2), .C(ext_data1[2]), .D(n1), .Y(n30) );
  OAI21X1 U48 ( .A(n36), .B(n31), .C(n30), .Y(dest_data[2]) );
  INVX2 U49 ( .A(alu_result[1]), .Y(n33) );
  AOI22X1 U50 ( .A(ext_data2[1]), .B(n2), .C(ext_data1[1]), .D(n1), .Y(n32) );
  OAI21X1 U51 ( .A(n36), .B(n33), .C(n32), .Y(dest_data[1]) );
  INVX2 U52 ( .A(alu_result[0]), .Y(n35) );
  AOI22X1 U53 ( .A(ext_data2[0]), .B(n2), .C(ext_data1[0]), .D(n1), .Y(n34) );
  OAI21X1 U54 ( .A(n36), .B(n35), .C(n34), .Y(dest_data[0]) );
endmodule


module magnitude ( in, out );
  input [16:0] in;
  output [15:0] out;
  wire   N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16,
         N17, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, \sub_add_17_b0/carry[15] , \sub_add_17_b0/carry[14] ,
         \sub_add_17_b0/carry[13] , \sub_add_17_b0/carry[12] ,
         \sub_add_17_b0/carry[11] , \sub_add_17_b0/carry[10] ,
         \sub_add_17_b0/carry[9] , \sub_add_17_b0/carry[8] ,
         \sub_add_17_b0/carry[7] , \sub_add_17_b0/carry[6] ,
         \sub_add_17_b0/carry[5] , \sub_add_17_b0/carry[4] ,
         \sub_add_17_b0/carry[3] , \sub_add_17_b0/carry[2] , n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18;
  assign N2 = in[0];

  AOI22X1 U22 ( .A(in[16]), .B(N11), .C(in[9]), .D(n1), .Y(n22) );
  AOI22X1 U23 ( .A(N10), .B(n2), .C(in[8]), .D(n1), .Y(n23) );
  AOI22X1 U24 ( .A(N9), .B(n2), .C(in[7]), .D(n1), .Y(n24) );
  AOI22X1 U25 ( .A(N8), .B(n2), .C(in[6]), .D(n1), .Y(n25) );
  AOI22X1 U26 ( .A(N7), .B(n2), .C(in[5]), .D(n1), .Y(n26) );
  AOI22X1 U27 ( .A(N6), .B(n2), .C(in[4]), .D(n1), .Y(n27) );
  AOI22X1 U28 ( .A(N5), .B(n2), .C(in[3]), .D(n1), .Y(n28) );
  AOI22X1 U29 ( .A(N4), .B(n2), .C(in[2]), .D(n1), .Y(n29) );
  AOI22X1 U30 ( .A(N3), .B(n2), .C(in[1]), .D(n1), .Y(n30) );
  AOI22X1 U31 ( .A(N17), .B(in[16]), .C(in[15]), .D(n1), .Y(n31) );
  AOI22X1 U32 ( .A(N16), .B(in[16]), .C(in[14]), .D(n1), .Y(n32) );
  AOI22X1 U33 ( .A(N15), .B(in[16]), .C(in[13]), .D(n1), .Y(n33) );
  AOI22X1 U34 ( .A(N14), .B(in[16]), .C(in[12]), .D(n1), .Y(n34) );
  AOI22X1 U35 ( .A(N13), .B(in[16]), .C(in[11]), .D(n1), .Y(n35) );
  AOI22X1 U36 ( .A(N12), .B(in[16]), .C(in[10]), .D(n1), .Y(n36) );
  AOI22X1 U37 ( .A(N2), .B(n2), .C(N2), .D(n1), .Y(n37) );
  INVX2 U2 ( .A(n1), .Y(n2) );
  INVX2 U3 ( .A(in[16]), .Y(n1) );
  XOR2X1 U4 ( .A(n18), .B(\sub_add_17_b0/carry[15] ), .Y(N17) );
  AND2X1 U5 ( .A(n17), .B(\sub_add_17_b0/carry[14] ), .Y(
        \sub_add_17_b0/carry[15] ) );
  XOR2X1 U6 ( .A(\sub_add_17_b0/carry[14] ), .B(n17), .Y(N16) );
  AND2X1 U7 ( .A(n16), .B(\sub_add_17_b0/carry[13] ), .Y(
        \sub_add_17_b0/carry[14] ) );
  XOR2X1 U8 ( .A(\sub_add_17_b0/carry[13] ), .B(n16), .Y(N15) );
  AND2X1 U9 ( .A(n15), .B(\sub_add_17_b0/carry[12] ), .Y(
        \sub_add_17_b0/carry[13] ) );
  XOR2X1 U10 ( .A(\sub_add_17_b0/carry[12] ), .B(n15), .Y(N14) );
  AND2X1 U11 ( .A(n14), .B(\sub_add_17_b0/carry[11] ), .Y(
        \sub_add_17_b0/carry[12] ) );
  XOR2X1 U12 ( .A(\sub_add_17_b0/carry[11] ), .B(n14), .Y(N13) );
  AND2X1 U13 ( .A(n13), .B(\sub_add_17_b0/carry[10] ), .Y(
        \sub_add_17_b0/carry[11] ) );
  XOR2X1 U14 ( .A(\sub_add_17_b0/carry[10] ), .B(n13), .Y(N12) );
  AND2X1 U15 ( .A(n12), .B(\sub_add_17_b0/carry[9] ), .Y(
        \sub_add_17_b0/carry[10] ) );
  XOR2X1 U16 ( .A(\sub_add_17_b0/carry[9] ), .B(n12), .Y(N11) );
  AND2X1 U17 ( .A(n11), .B(\sub_add_17_b0/carry[8] ), .Y(
        \sub_add_17_b0/carry[9] ) );
  XOR2X1 U18 ( .A(\sub_add_17_b0/carry[8] ), .B(n11), .Y(N10) );
  AND2X1 U19 ( .A(n10), .B(\sub_add_17_b0/carry[7] ), .Y(
        \sub_add_17_b0/carry[8] ) );
  XOR2X1 U20 ( .A(\sub_add_17_b0/carry[7] ), .B(n10), .Y(N9) );
  AND2X1 U21 ( .A(n9), .B(\sub_add_17_b0/carry[6] ), .Y(
        \sub_add_17_b0/carry[7] ) );
  XOR2X1 U38 ( .A(\sub_add_17_b0/carry[6] ), .B(n9), .Y(N8) );
  AND2X1 U39 ( .A(n8), .B(\sub_add_17_b0/carry[5] ), .Y(
        \sub_add_17_b0/carry[6] ) );
  XOR2X1 U40 ( .A(\sub_add_17_b0/carry[5] ), .B(n8), .Y(N7) );
  AND2X1 U41 ( .A(n7), .B(\sub_add_17_b0/carry[4] ), .Y(
        \sub_add_17_b0/carry[5] ) );
  XOR2X1 U42 ( .A(\sub_add_17_b0/carry[4] ), .B(n7), .Y(N6) );
  AND2X1 U43 ( .A(n6), .B(\sub_add_17_b0/carry[3] ), .Y(
        \sub_add_17_b0/carry[4] ) );
  XOR2X1 U44 ( .A(\sub_add_17_b0/carry[3] ), .B(n6), .Y(N5) );
  AND2X1 U45 ( .A(n5), .B(\sub_add_17_b0/carry[2] ), .Y(
        \sub_add_17_b0/carry[3] ) );
  XOR2X1 U46 ( .A(\sub_add_17_b0/carry[2] ), .B(n5), .Y(N4) );
  AND2X1 U47 ( .A(n4), .B(n3), .Y(\sub_add_17_b0/carry[2] ) );
  XOR2X1 U48 ( .A(n3), .B(n4), .Y(N3) );
  INVX2 U49 ( .A(N2), .Y(n3) );
  INVX2 U50 ( .A(in[1]), .Y(n4) );
  INVX2 U51 ( .A(in[2]), .Y(n5) );
  INVX2 U52 ( .A(in[3]), .Y(n6) );
  INVX2 U53 ( .A(in[4]), .Y(n7) );
  INVX2 U54 ( .A(in[5]), .Y(n8) );
  INVX2 U55 ( .A(in[6]), .Y(n9) );
  INVX2 U56 ( .A(in[7]), .Y(n10) );
  INVX2 U57 ( .A(in[8]), .Y(n11) );
  INVX2 U58 ( .A(in[9]), .Y(n12) );
  INVX2 U59 ( .A(in[10]), .Y(n13) );
  INVX2 U60 ( .A(in[11]), .Y(n14) );
  INVX2 U61 ( .A(in[12]), .Y(n15) );
  INVX2 U62 ( .A(in[13]), .Y(n16) );
  INVX2 U63 ( .A(in[14]), .Y(n17) );
  INVX2 U64 ( .A(in[15]), .Y(n18) );
  INVX2 U65 ( .A(n31), .Y(out[15]) );
  INVX2 U66 ( .A(n32), .Y(out[14]) );
  INVX2 U67 ( .A(n33), .Y(out[13]) );
  INVX2 U68 ( .A(n34), .Y(out[12]) );
  INVX2 U69 ( .A(n35), .Y(out[11]) );
  INVX2 U70 ( .A(n36), .Y(out[10]) );
  INVX2 U71 ( .A(n22), .Y(out[9]) );
  INVX2 U72 ( .A(n23), .Y(out[8]) );
  INVX2 U73 ( .A(n24), .Y(out[7]) );
  INVX2 U74 ( .A(n25), .Y(out[6]) );
  INVX2 U75 ( .A(n26), .Y(out[5]) );
  INVX2 U76 ( .A(n27), .Y(out[4]) );
  INVX2 U77 ( .A(n28), .Y(out[3]) );
  INVX2 U78 ( .A(n29), .Y(out[2]) );
  INVX2 U79 ( .A(n30), .Y(out[1]) );
  INVX2 U80 ( .A(n37), .Y(out[0]) );
endmodule


module fir_filter ( clk, n_reset, sample_data, fir_coefficient, load_coeff, 
        data_ready, one_k_samples, processed, modwait, fir_out, err );
  input [15:0] sample_data;
  input [15:0] fir_coefficient;
  output [15:0] fir_out;
  input clk, n_reset, load_coeff, data_ready;
  output one_k_samples, processed, modwait, err;
  wire   overflow, cnt_up, clear;
  wire   [3:0] src1;
  wire   [3:0] src2;
  wire   [3:0] dest;
  wire   [16:0] outreg_data;
  tri   [2:0] op;

  controller B1 ( .clk(clk), .n_rst(n_reset), .dr(data_ready), .lc(load_coeff), 
        .overflow(overflow), .cnt_up(cnt_up), .clear(clear), .modwait(modwait), 
        .op(op), .src1(src1), .src2(src2), .dest(dest), .err(err), .processed(
        processed) );
  counter C1 ( .clk(clk), .n_rst(n_reset), .cnt_up(cnt_up), .clear(clear), 
        .one_k_samples(one_k_samples) );
  datapath D1 ( .clk(clk), .n_reset(n_reset), .op(op), .src1(src1), .src2(src2), .dest(dest), .ext_data1(sample_data), .ext_data2(fir_coefficient), 
        .outreg_data(outreg_data), .overflow(overflow) );
  magnitude E1 ( .in(outreg_data), .out(fir_out) );
endmodule


module ahb_lite_fir_filter ( clk, n_rst, hsel, haddr, hsize, htrans, hwrite, 
        hwdata, hrdata, hresp );
  input [3:0] haddr;
  input [1:0] htrans;
  input [15:0] hwdata;
  output [15:0] hrdata;
  input clk, n_rst, hsel, hsize, hwrite;
  output hresp;
  wire   modwait, err, data_ready, new_coefficient_set, clear_new_coefficient,
         processed, load_coeff;
  wire   [15:0] fir_out;
  wire   [15:0] sample_data;
  wire   [15:0] fir_coefficient;
  wire   [1:0] coefficient_num;

  ahb_lite_slave AHB ( .clk(clk), .n_rst(n_rst), .sample_data(sample_data), 
        .data_ready(data_ready), .new_coefficient_set(new_coefficient_set), 
        .clear_new_coefficient(clear_new_coefficient), .processed(processed), 
        .coefficient_num(coefficient_num), .fir_coefficient(fir_coefficient), 
        .modwait(modwait), .fir_out(fir_out), .err(err), .hsel(hsel), .haddr(
        haddr), .hsize(hsize), .htrans(htrans), .hwrite(hwrite), .hwdata(
        hwdata), .hrdata(hrdata), .hresp(hresp) );
  coefficient_loader CFL ( .clk(clk), .n_reset(n_rst), .new_coefficient_set(
        new_coefficient_set), .modwait(modwait), .load_coeff(load_coeff), 
        .coefficient_num(coefficient_num), .clear_new_coefficient(
        clear_new_coefficient) );
  fir_filter FF ( .clk(clk), .n_reset(n_rst), .sample_data(sample_data), 
        .fir_coefficient(fir_coefficient), .load_coeff(load_coeff), 
        .data_ready(data_ready), .processed(processed), .modwait(modwait), 
        .fir_out(fir_out), .err(err) );
endmodule

