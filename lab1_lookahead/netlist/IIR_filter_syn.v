/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP4
// Date      : Sun Nov 21 21:02:46 2021
/////////////////////////////////////////////////////////////


module IIR_filter ( CLK, RST_n, DIN, VIN, b0, b1, b2, a1, DOUT, VOUT );
  input [11:0] DIN;
  input [11:0] b0;
  input [11:0] b1;
  input [11:0] b2;
  input [11:0] a1;
  output [11:0] DOUT;
  input CLK, RST_n, VIN;
  output VOUT;
  wire   q1, q2, q3, n7, n8, n9, regX0_n3, regX0_n1, regX0_n21, regX0_n20,
         regX0_n19, regX0_n18, regX0_n17, regX0_n16, regX0_n15, regX0_n14,
         regX0_n13, regX0_n12, regX0_n11, regX0_n10, regX0_n9, regX0_n8,
         regX0_n7, regX0_n6, regX0_n5, regX0_n4, regX0_n2, regU_n1, regU_n24,
         regU_n23, regU_n22, regU_n21, regU_n20, regU_n19, regU_n18, regU_n17,
         regU_n15, regU_n9, regU_n11, rega1_n19, rega1_n18, rega1_n17,
         rega1_n16, rega1_n14, rega1_n10, rega1_n9, rega1_n8, rega1_n7,
         rega1_n6, rega1_n5, rega1_n4, rega1_n3, rega1_n2, rega1_n1, regb0_n31,
         regb0_n30, regb0_n29, regb0_n28, regb0_n27, regb0_n26, regb0_n25,
         regb0_n24, regb0_n23, regb0_n22, regb0_n21, regb0_n10, regb0_n8,
         regb0_n7, regb0_n6, regb0_n5, regb0_n3, regb0_n2, regb0_n1, regb1_n13,
         regb1_n12, regb1_n10, regb1_n9, regb1_n8, regb1_n7, regb1_n6,
         regb1_n5, regb1_n4, regb1_n3, regb1_n2, regb1_n1, regU2_n43,
         regU2_n42, regU2_n41, regU2_n40, regU2_n39, regU2_n38, regU2_n37,
         regU2_n36, regU2_n35, regU2_n34, regU2_n33, regU2_n32, regU2_n31,
         regU2_n30, regU2_n29, regU2_n28, regU2_n27, regU2_n26, regU2_n25,
         regU2_n1, regU2_n46, regU2_n45, regU2_n44, regb2_n14, regb2_n13,
         regb2_n12, regb2_n11, regb2_n10, regb2_n9, regb2_n8, regsum_n40,
         regsum_n39, regsum_n38, regsum_n37, regsum_n36, regsum_n35,
         regsum_n34, regsum_n33, regsum_n32, regsum_n31, regsum_n30,
         regsum_n29, regsum_n28, regsum_n27, regsum_n26, regsum_n25,
         regsum_n24, regsum_n23, regsum_n22, regsum_n7, regY_n15, regY_n14,
         regY_n13, regY_n12, regY_n11, regY_n10, regY_n8, regY_n7, regY_n6,
         regY_n5, add_90_n2, mult_85_n266, mult_85_n265, mult_85_n264,
         mult_85_n263, mult_85_n262, mult_85_n261, mult_85_n260, mult_85_n259,
         mult_85_n258, mult_85_n257, mult_85_n256, mult_85_n255, mult_85_n254,
         mult_85_n253, mult_85_n252, mult_85_n251, mult_85_n250, mult_85_n249,
         mult_85_n248, mult_85_n247, mult_85_n246, mult_85_n245, mult_85_n244,
         mult_85_n243, mult_85_n242, mult_85_n241, mult_85_n240, mult_85_n220,
         mult_85_n208, mult_85_n207, mult_85_n206, mult_85_n205, mult_85_n203,
         mult_85_n202, mult_85_n201, mult_85_n200, mult_85_n199, mult_85_n198,
         mult_85_n196, mult_85_n195, mult_85_n194, mult_85_n184, mult_85_n183,
         mult_85_n182, mult_85_n181, mult_85_n180, mult_85_n179, mult_85_n178,
         mult_85_n177, mult_85_n176, mult_85_n175, mult_85_n174, mult_85_n173,
         mult_85_n172, mult_85_n171, mult_85_n170, mult_85_n169, mult_85_n168,
         mult_85_n167, mult_85_n166, mult_85_n165, mult_85_n164, mult_85_n163,
         mult_85_n162, mult_85_n161, mult_85_n160, mult_85_n159, mult_85_n158,
         mult_85_n157, mult_85_n155, mult_85_n154, mult_85_n153, mult_85_n152,
         mult_85_n151, mult_85_n150, mult_85_n149, mult_85_n148, mult_85_n147,
         mult_85_n146, mult_85_n145, mult_85_n144, mult_85_n143, mult_85_n142,
         mult_85_n141, mult_85_n140, mult_85_n139, mult_85_n138, mult_85_n137,
         mult_85_n136, mult_85_n135, mult_85_n134, mult_85_n133, mult_85_n132,
         mult_85_n131, mult_85_n130, mult_85_n129, mult_85_n128, mult_85_n127,
         mult_85_n126, mult_85_n125, mult_85_n123, mult_85_n122, mult_85_n121,
         mult_85_n120, mult_85_n119, mult_85_n118, mult_85_n117, mult_85_n116,
         mult_85_n115, mult_85_n114, mult_85_n112, mult_85_n110, mult_85_n109,
         mult_85_n107, mult_85_n106, mult_85_n104, mult_85_n103, mult_85_n102,
         mult_85_n101, mult_85_n100, mult_85_n99, mult_85_n98, mult_85_n97,
         mult_85_n96, mult_85_n95, mult_85_n94, mult_85_n93, mult_85_n92,
         mult_85_n91, mult_85_n90, mult_85_n89, mult_85_n88, mult_85_n87,
         mult_85_n86, mult_85_n85, mult_85_n84, mult_85_n83, mult_85_n82,
         mult_85_n81, mult_85_n80, mult_85_n79, mult_85_n78, mult_85_n77,
         mult_85_n76, mult_85_n75, mult_85_n74, mult_85_n73, mult_85_n72,
         mult_85_n71, mult_85_n70, mult_85_n69, mult_85_n68, mult_85_n67,
         mult_85_n66, mult_85_n63, mult_85_n62, mult_85_n61, mult_85_n51,
         mult_85_n50, mult_85_n49, mult_85_n48, mult_85_n43, mult_85_n42,
         mult_85_n41, mult_85_n40, mult_85_n39, mult_85_n38, mult_85_n37,
         mult_85_n36, mult_85_n35, mult_85_n34, mult_85_n33, mult_85_n32,
         mult_85_n31, mult_85_n30, mult_85_n29, mult_85_n28, mult_85_n27,
         mult_85_n26, mult_85_n25, mult_85_n24, mult_85_n23, mult_85_n22,
         mult_85_n21, mult_85_n20, mult_85_n19, mult_85_n18, mult_85_n17,
         mult_85_n15, mult_85_n13, mult_85_n12, mult_85_n11, mult_85_n10,
         mult_85_n4, mult_85_n3, mult_85_n2, mult_85_n1, add_60_n89,
         add_60_n87, add_60_n86, add_60_n57, add_60_n56, add_60_n54,
         add_60_n53, add_60_n52, add_60_n51, add_60_n49, add_60_n48,
         add_60_n46, add_60_n45, add_60_n44, add_60_n43, add_60_n40,
         add_60_n38, add_60_n37, add_60_n36, add_60_n35, add_60_n34,
         add_60_n33, add_60_n31, add_60_n30, add_60_n29, add_60_n28,
         add_60_n27, add_60_n26, add_60_n23, add_60_n22, add_60_n21,
         add_60_n20, add_60_n19, add_60_n17, add_60_n15, add_60_n14,
         add_60_n13, add_60_n12, add_60_n11, add_60_n10, add_60_n9, add_60_n8,
         add_60_n6, add_60_n5, add_60_n4, add_60_n3, add_60_n2, add_96_n87,
         add_96_n57, add_96_n56, add_96_n54, add_96_n53, add_96_n52,
         add_96_n51, add_96_n50, add_96_n49, add_96_n48, add_96_n46,
         add_96_n45, add_96_n43, add_96_n42, add_96_n41, add_96_n39,
         add_96_n38, add_96_n37, add_96_n34, add_96_n33, add_96_n32,
         add_96_n31, add_96_n30, add_96_n29, add_96_n26, add_96_n25,
         add_96_n24, add_96_n23, add_96_n22, add_96_n21, add_96_n20,
         add_96_n19, add_96_n18, add_96_n17, add_96_n16, add_96_n15,
         add_96_n14, add_96_n13, add_96_n12, add_96_n11, add_96_n10, add_96_n7,
         add_96_n6, add_96_n5, add_96_n4, add_96_n3, add_96_n2, add_96_n1,
         mult_78_n266, mult_78_n265, mult_78_n264, mult_78_n263, mult_78_n262,
         mult_78_n261, mult_78_n260, mult_78_n259, mult_78_n258, mult_78_n257,
         mult_78_n256, mult_78_n255, mult_78_n254, mult_78_n253, mult_78_n252,
         mult_78_n251, mult_78_n250, mult_78_n249, mult_78_n248, mult_78_n247,
         mult_78_n246, mult_78_n245, mult_78_n244, mult_78_n243, mult_78_n242,
         mult_78_n222, mult_78_n210, mult_78_n209, mult_78_n208, mult_78_n207,
         mult_78_n205, mult_78_n204, mult_78_n203, mult_78_n202, mult_78_n201,
         mult_78_n200, mult_78_n198, mult_78_n197, mult_78_n196, mult_78_n186,
         mult_78_n185, mult_78_n184, mult_78_n183, mult_78_n182, mult_78_n181,
         mult_78_n180, mult_78_n179, mult_78_n178, mult_78_n177, mult_78_n176,
         mult_78_n175, mult_78_n174, mult_78_n173, mult_78_n172, mult_78_n171,
         mult_78_n170, mult_78_n169, mult_78_n168, mult_78_n167, mult_78_n166,
         mult_78_n165, mult_78_n164, mult_78_n163, mult_78_n162, mult_78_n161,
         mult_78_n160, mult_78_n159, mult_78_n157, mult_78_n156, mult_78_n155,
         mult_78_n154, mult_78_n153, mult_78_n152, mult_78_n151, mult_78_n150,
         mult_78_n149, mult_78_n148, mult_78_n147, mult_78_n146, mult_78_n145,
         mult_78_n144, mult_78_n143, mult_78_n142, mult_78_n141, mult_78_n140,
         mult_78_n139, mult_78_n138, mult_78_n137, mult_78_n136, mult_78_n135,
         mult_78_n134, mult_78_n133, mult_78_n132, mult_78_n131, mult_78_n130,
         mult_78_n129, mult_78_n128, mult_78_n127, mult_78_n126, mult_78_n125,
         mult_78_n124, mult_78_n123, mult_78_n122, mult_78_n121, mult_78_n120,
         mult_78_n119, mult_78_n118, mult_78_n117, mult_78_n115, mult_78_n113,
         mult_78_n112, mult_78_n110, mult_78_n109, mult_78_n107, mult_78_n106,
         mult_78_n104, mult_78_n103, mult_78_n102, mult_78_n101, mult_78_n100,
         mult_78_n99, mult_78_n98, mult_78_n97, mult_78_n96, mult_78_n95,
         mult_78_n94, mult_78_n93, mult_78_n92, mult_78_n91, mult_78_n90,
         mult_78_n89, mult_78_n88, mult_78_n87, mult_78_n86, mult_78_n85,
         mult_78_n84, mult_78_n83, mult_78_n82, mult_78_n81, mult_78_n80,
         mult_78_n79, mult_78_n78, mult_78_n77, mult_78_n76, mult_78_n75,
         mult_78_n74, mult_78_n73, mult_78_n72, mult_78_n71, mult_78_n70,
         mult_78_n69, mult_78_n68, mult_78_n66, mult_78_n65, mult_78_n64,
         mult_78_n63, mult_78_n61, mult_78_n59, mult_78_n58, mult_78_n57,
         mult_78_n56, mult_78_n51, mult_78_n50, mult_78_n49, mult_78_n48,
         mult_78_n43, mult_78_n42, mult_78_n41, mult_78_n40, mult_78_n39,
         mult_78_n38, mult_78_n37, mult_78_n36, mult_78_n35, mult_78_n34,
         mult_78_n33, mult_78_n32, mult_78_n29, mult_78_n27, mult_78_n26,
         mult_78_n25, mult_78_n24, mult_78_n22, mult_78_n20, mult_78_n19,
         mult_78_n18, mult_78_n17, mult_78_n16, mult_78_n15, mult_78_n13,
         mult_78_n11, mult_78_n10, mult_78_n6, mult_78_n4, mult_78_n3,
         mult_78_n2, mult_78_n1, mult_73_n260, mult_73_n259, mult_73_n258,
         mult_73_n257, mult_73_n256, mult_73_n255, mult_73_n254, mult_73_n253,
         mult_73_n252, mult_73_n251, mult_73_n250, mult_73_n249, mult_73_n248,
         mult_73_n247, mult_73_n246, mult_73_n245, mult_73_n244, mult_73_n243,
         mult_73_n242, mult_73_n222, mult_73_n210, mult_73_n209, mult_73_n208,
         mult_73_n207, mult_73_n205, mult_73_n204, mult_73_n203, mult_73_n202,
         mult_73_n201, mult_73_n200, mult_73_n198, mult_73_n197, mult_73_n196,
         mult_73_n186, mult_73_n185, mult_73_n184, mult_73_n183, mult_73_n182,
         mult_73_n181, mult_73_n180, mult_73_n179, mult_73_n178, mult_73_n177,
         mult_73_n176, mult_73_n175, mult_73_n174, mult_73_n173, mult_73_n172,
         mult_73_n171, mult_73_n170, mult_73_n169, mult_73_n168, mult_73_n167,
         mult_73_n166, mult_73_n165, mult_73_n164, mult_73_n163, mult_73_n162,
         mult_73_n161, mult_73_n160, mult_73_n159, mult_73_n157, mult_73_n156,
         mult_73_n155, mult_73_n154, mult_73_n153, mult_73_n152, mult_73_n151,
         mult_73_n150, mult_73_n149, mult_73_n148, mult_73_n147, mult_73_n146,
         mult_73_n145, mult_73_n144, mult_73_n143, mult_73_n142, mult_73_n141,
         mult_73_n140, mult_73_n139, mult_73_n138, mult_73_n137, mult_73_n136,
         mult_73_n135, mult_73_n134, mult_73_n133, mult_73_n132, mult_73_n131,
         mult_73_n130, mult_73_n129, mult_73_n128, mult_73_n127, mult_73_n126,
         mult_73_n125, mult_73_n124, mult_73_n123, mult_73_n122, mult_73_n121,
         mult_73_n120, mult_73_n119, mult_73_n118, mult_73_n117, mult_73_n115,
         mult_73_n113, mult_73_n112, mult_73_n110, mult_73_n109, mult_73_n107,
         mult_73_n106, mult_73_n105, mult_73_n104, mult_73_n103, mult_73_n102,
         mult_73_n101, mult_73_n100, mult_73_n99, mult_73_n98, mult_73_n97,
         mult_73_n96, mult_73_n95, mult_73_n94, mult_73_n93, mult_73_n92,
         mult_73_n91, mult_73_n90, mult_73_n89, mult_73_n88, mult_73_n87,
         mult_73_n86, mult_73_n85, mult_73_n84, mult_73_n83, mult_73_n82,
         mult_73_n81, mult_73_n80, mult_73_n79, mult_73_n78, mult_73_n77,
         mult_73_n76, mult_73_n75, mult_73_n74, mult_73_n73, mult_73_n72,
         mult_73_n71, mult_73_n70, mult_73_n69, mult_73_n68, mult_73_n66,
         mult_73_n65, mult_73_n64, mult_73_n63, mult_73_n61, mult_73_n59,
         mult_73_n58, mult_73_n57, mult_73_n56, mult_73_n51, mult_73_n50,
         mult_73_n49, mult_73_n48, mult_73_n43, mult_73_n42, mult_73_n41,
         mult_73_n40, mult_73_n39, mult_73_n38, mult_73_n37, mult_73_n36,
         mult_73_n35, mult_73_n34, mult_73_n33, mult_73_n32, mult_73_n29,
         mult_73_n27, mult_73_n26, mult_73_n25, mult_73_n24, mult_73_n22,
         mult_73_n20, mult_73_n19, mult_73_n18, mult_73_n17, mult_73_n16,
         mult_73_n15, mult_73_n13, mult_73_n11, mult_73_n10, mult_73_n6,
         mult_73_n4, mult_73_n3, mult_73_n2, mult_73_n1, mult_68_n270,
         mult_68_n269, mult_68_n268, mult_68_n267, mult_68_n266, mult_68_n265,
         mult_68_n264, mult_68_n263, mult_68_n262, mult_68_n261, mult_68_n260,
         mult_68_n259, mult_68_n258, mult_68_n257, mult_68_n256, mult_68_n255,
         mult_68_n254, mult_68_n253, mult_68_n252, mult_68_n251, mult_68_n250,
         mult_68_n249, mult_68_n248, mult_68_n247, mult_68_n246, mult_68_n245,
         mult_68_n244, mult_68_n243, mult_68_n242, mult_68_n222, mult_68_n210,
         mult_68_n209, mult_68_n208, mult_68_n207, mult_68_n205, mult_68_n204,
         mult_68_n203, mult_68_n202, mult_68_n201, mult_68_n200, mult_68_n198,
         mult_68_n197, mult_68_n196, mult_68_n186, mult_68_n185, mult_68_n184,
         mult_68_n183, mult_68_n182, mult_68_n181, mult_68_n180, mult_68_n179,
         mult_68_n178, mult_68_n177, mult_68_n176, mult_68_n175, mult_68_n174,
         mult_68_n173, mult_68_n172, mult_68_n171, mult_68_n170, mult_68_n169,
         mult_68_n168, mult_68_n167, mult_68_n166, mult_68_n165, mult_68_n164,
         mult_68_n163, mult_68_n162, mult_68_n161, mult_68_n160, mult_68_n159,
         mult_68_n157, mult_68_n156, mult_68_n155, mult_68_n154, mult_68_n153,
         mult_68_n152, mult_68_n151, mult_68_n150, mult_68_n149, mult_68_n148,
         mult_68_n147, mult_68_n146, mult_68_n145, mult_68_n144, mult_68_n143,
         mult_68_n142, mult_68_n141, mult_68_n140, mult_68_n139, mult_68_n138,
         mult_68_n137, mult_68_n136, mult_68_n135, mult_68_n134, mult_68_n133,
         mult_68_n132, mult_68_n131, mult_68_n130, mult_68_n129, mult_68_n128,
         mult_68_n126, mult_68_n125, mult_68_n124, mult_68_n123, mult_68_n122,
         mult_68_n120, mult_68_n119, mult_68_n118, mult_68_n117, mult_68_n115,
         mult_68_n113, mult_68_n112, mult_68_n110, mult_68_n109, mult_68_n107,
         mult_68_n106, mult_68_n104, mult_68_n103, mult_68_n102, mult_68_n101,
         mult_68_n100, mult_68_n99, mult_68_n98, mult_68_n97, mult_68_n96,
         mult_68_n95, mult_68_n94, mult_68_n93, mult_68_n92, mult_68_n91,
         mult_68_n90, mult_68_n89, mult_68_n88, mult_68_n87, mult_68_n86,
         mult_68_n85, mult_68_n84, mult_68_n83, mult_68_n82, mult_68_n81,
         mult_68_n80, mult_68_n79, mult_68_n78, mult_68_n77, mult_68_n76,
         mult_68_n75, mult_68_n74, mult_68_n73, mult_68_n72, mult_68_n71,
         mult_68_n70, mult_68_n69, mult_68_n68, mult_68_n67, mult_68_n66,
         mult_68_n65, mult_68_n63, mult_68_n61, mult_68_n59, mult_68_n58,
         mult_68_n57, mult_68_n56, mult_68_n51, mult_68_n50, mult_68_n49,
         mult_68_n48, mult_68_n43, mult_68_n42, mult_68_n41, mult_68_n40,
         mult_68_n39, mult_68_n38, mult_68_n37, mult_68_n36, mult_68_n35,
         mult_68_n34, mult_68_n33, mult_68_n32, mult_68_n29, mult_68_n27,
         mult_68_n26, mult_68_n25, mult_68_n24, mult_68_n22, mult_68_n20,
         mult_68_n19, mult_68_n18, mult_68_n17, mult_68_n16, mult_68_n15,
         mult_68_n13, mult_68_n11, mult_68_n10, mult_68_n6, mult_68_n4,
         mult_68_n3, mult_68_n2, mult_68_n1;
  wire   [6:0] din_del;
  wire   [7:0] u;
  wire   [7:0] u_del_vec;
  wire   [12:6] mula1;
  wire   [6:0] t_mula1_del_vec;
  wire   [12:6] mulb0;
  wire   [6:0] t_mulb0_del_vec;
  wire   [12:6] mulb1;
  wire   [6:0] t_mulb1_del_vec;
  wire   [7:0] u_del_vec2;
  wire   [12:6] mulb2;
  wire   [6:0] t_mulb2_del_vec;
  wire   [6:0] sum1;
  wire   [6:0] sum1_del_vec;
  wire   [7:0] y;
  wire   [6:2] add_90_carry;
  assign DOUT[0] = 1'b0;
  assign DOUT[1] = 1'b0;
  assign DOUT[2] = 1'b0;
  assign DOUT[3] = 1'b0;

  BUF_X1 U8 ( .A(q2), .Z(n9) );
  BUF_X1 U9 ( .A(q3), .Z(n8) );
  CLKBUF_X1 U10 ( .A(u_del_vec[0]), .Z(n7) );
  MUX2_X1 regX0_U15 ( .A(regX0_n3), .B(DIN[7]), .S(VIN), .Z(regX0_n17) );
  INV_X1 regX0_U14 ( .A(regX0_n10), .ZN(regX0_n3) );
  MUX2_X1 regX0_U13 ( .A(regX0_n1), .B(DIN[5]), .S(VIN), .Z(regX0_n15) );
  INV_X1 regX0_U12 ( .A(regX0_n8), .ZN(regX0_n1) );
  NAND2_X1 regX0_U11 ( .A1(DIN[11]), .A2(VIN), .ZN(regX0_n7) );
  OAI21_X1 regX0_U10 ( .B1(regX0_n14), .B2(VIN), .A(regX0_n7), .ZN(regX0_n21)
         );
  NAND2_X1 regX0_U9 ( .A1(DIN[10]), .A2(VIN), .ZN(regX0_n6) );
  OAI21_X1 regX0_U8 ( .B1(regX0_n13), .B2(VIN), .A(regX0_n6), .ZN(regX0_n20)
         );
  NAND2_X1 regX0_U7 ( .A1(DIN[9]), .A2(VIN), .ZN(regX0_n5) );
  OAI21_X1 regX0_U6 ( .B1(regX0_n12), .B2(VIN), .A(regX0_n5), .ZN(regX0_n19)
         );
  NAND2_X1 regX0_U5 ( .A1(DIN[8]), .A2(VIN), .ZN(regX0_n4) );
  OAI21_X1 regX0_U4 ( .B1(regX0_n11), .B2(VIN), .A(regX0_n4), .ZN(regX0_n18)
         );
  NAND2_X1 regX0_U3 ( .A1(DIN[6]), .A2(VIN), .ZN(regX0_n2) );
  OAI21_X1 regX0_U2 ( .B1(regX0_n9), .B2(VIN), .A(regX0_n2), .ZN(regX0_n16) );
  DFFR_X1 regX0_Q_reg_0_ ( .D(regX0_n15), .CK(CLK), .RN(RST_n), .Q(din_del[0]), 
        .QN(regX0_n8) );
  DFFR_X1 regX0_Q_reg_1_ ( .D(regX0_n16), .CK(CLK), .RN(RST_n), .Q(din_del[1]), 
        .QN(regX0_n9) );
  DFFR_X1 regX0_Q_reg_2_ ( .D(regX0_n17), .CK(CLK), .RN(RST_n), .Q(din_del[2]), 
        .QN(regX0_n10) );
  DFFR_X1 regX0_Q_reg_3_ ( .D(regX0_n18), .CK(CLK), .RN(RST_n), .Q(din_del[3]), 
        .QN(regX0_n11) );
  DFFR_X1 regX0_Q_reg_4_ ( .D(regX0_n19), .CK(CLK), .RN(RST_n), .Q(din_del[4]), 
        .QN(regX0_n12) );
  DFFR_X1 regX0_Q_reg_5_ ( .D(regX0_n20), .CK(CLK), .RN(RST_n), .Q(din_del[5]), 
        .QN(regX0_n13) );
  DFFR_X1 regX0_Q_reg_6_ ( .D(regX0_n21), .CK(CLK), .RN(RST_n), .Q(din_del[6]), 
        .QN(regX0_n14) );
  MUX2_X1 regU_U11 ( .A(u_del_vec[7]), .B(u[7]), .S(q1), .Z(regU_n24) );
  MUX2_X1 regU_U10 ( .A(regU_n1), .B(u[6]), .S(q1), .Z(regU_n23) );
  MUX2_X1 regU_U9 ( .A(u_del_vec[5]), .B(u[5]), .S(q1), .Z(regU_n22) );
  MUX2_X1 regU_U8 ( .A(u_del_vec[4]), .B(u[4]), .S(q1), .Z(regU_n21) );
  MUX2_X1 regU_U7 ( .A(u_del_vec[3]), .B(u[3]), .S(q1), .Z(regU_n20) );
  MUX2_X1 regU_U6 ( .A(u_del_vec[2]), .B(u[2]), .S(q1), .Z(regU_n19) );
  MUX2_X1 regU_U5 ( .A(u_del_vec[1]), .B(u[1]), .S(q1), .Z(regU_n18) );
  MUX2_X1 regU_U4 ( .A(regU_n11), .B(u[0]), .S(q1), .Z(regU_n17) );
  INV_X1 regU_U3 ( .A(regU_n9), .ZN(u_del_vec[0]) );
  INV_X2 regU_U2 ( .A(regU_n15), .ZN(u_del_vec[6]) );
  DFFR_X1 regU_Q_reg_6_ ( .D(regU_n23), .CK(CLK), .RN(RST_n), .Q(regU_n1), 
        .QN(regU_n15) );
  DFFR_X1 regU_Q_reg_0_ ( .D(regU_n17), .CK(CLK), .RN(RST_n), .Q(regU_n11), 
        .QN(regU_n9) );
  DFFR_X1 regU_Q_reg_1_ ( .D(regU_n18), .CK(CLK), .RN(RST_n), .Q(u_del_vec[1])
         );
  DFFR_X1 regU_Q_reg_2_ ( .D(regU_n19), .CK(CLK), .RN(RST_n), .Q(u_del_vec[2])
         );
  DFFR_X1 regU_Q_reg_3_ ( .D(regU_n20), .CK(CLK), .RN(RST_n), .Q(u_del_vec[3])
         );
  DFFR_X1 regU_Q_reg_4_ ( .D(regU_n21), .CK(CLK), .RN(RST_n), .Q(u_del_vec[4])
         );
  DFFR_X1 regU_Q_reg_5_ ( .D(regU_n22), .CK(CLK), .RN(RST_n), .Q(u_del_vec[5])
         );
  DFFR_X1 regU_Q_reg_7_ ( .D(regU_n24), .CK(CLK), .RN(RST_n), .Q(u_del_vec[7])
         );
  NAND2_X1 rega1_U13 ( .A1(mula1[11]), .A2(q1), .ZN(rega1_n5) );
  NAND2_X1 rega1_U12 ( .A1(mula1[10]), .A2(q1), .ZN(rega1_n4) );
  OAI21_X1 rega1_U11 ( .B1(rega1_n19), .B2(q1), .A(rega1_n3), .ZN(rega1_n9) );
  NAND2_X1 rega1_U10 ( .A1(mula1[9]), .A2(q1), .ZN(rega1_n3) );
  MUX2_X1 rega1_U9 ( .A(t_mula1_del_vec[2]), .B(mula1[8]), .S(q1), .Z(
        rega1_n10) );
  MUX2_X1 rega1_U8 ( .A(t_mula1_del_vec[1]), .B(mula1[7]), .S(q1), .Z(
        rega1_n14) );
  MUX2_X1 rega1_U7 ( .A(t_mula1_del_vec[0]), .B(mula1[6]), .S(q1), .Z(
        rega1_n16) );
  MUX2_X1 rega1_U6 ( .A(t_mula1_del_vec[6]), .B(mula1[12]), .S(q1), .Z(
        rega1_n6) );
  NAND2_X1 rega1_U5 ( .A1(rega1_n5), .A2(rega1_n2), .ZN(rega1_n7) );
  OR2_X1 rega1_U4 ( .A1(rega1_n17), .A2(q1), .ZN(rega1_n2) );
  NAND2_X1 rega1_U3 ( .A1(rega1_n4), .A2(rega1_n1), .ZN(rega1_n8) );
  OR2_X1 rega1_U2 ( .A1(rega1_n18), .A2(q1), .ZN(rega1_n1) );
  DFFR_X1 rega1_Q_reg_0_ ( .D(rega1_n16), .CK(CLK), .RN(RST_n), .Q(
        t_mula1_del_vec[0]) );
  DFFR_X1 rega1_Q_reg_1_ ( .D(rega1_n14), .CK(CLK), .RN(RST_n), .Q(
        t_mula1_del_vec[1]) );
  DFFR_X1 rega1_Q_reg_2_ ( .D(rega1_n10), .CK(CLK), .RN(RST_n), .Q(
        t_mula1_del_vec[2]) );
  DFFR_X1 rega1_Q_reg_3_ ( .D(rega1_n9), .CK(CLK), .RN(RST_n), .Q(
        t_mula1_del_vec[3]), .QN(rega1_n19) );
  DFFR_X1 rega1_Q_reg_4_ ( .D(rega1_n8), .CK(CLK), .RN(RST_n), .Q(
        t_mula1_del_vec[4]), .QN(rega1_n18) );
  DFFR_X1 rega1_Q_reg_5_ ( .D(rega1_n7), .CK(CLK), .RN(RST_n), .Q(
        t_mula1_del_vec[5]), .QN(rega1_n17) );
  DFFR_X1 rega1_Q_reg_6_ ( .D(rega1_n6), .CK(CLK), .RN(RST_n), .Q(
        t_mula1_del_vec[6]) );
  NAND2_X1 regb0_U16 ( .A1(mulb0[12]), .A2(n9), .ZN(regb0_n8) );
  NAND2_X1 regb0_U15 ( .A1(mulb0[11]), .A2(n9), .ZN(regb0_n7) );
  NAND2_X1 regb0_U14 ( .A1(mulb0[10]), .A2(n9), .ZN(regb0_n6) );
  OAI21_X1 regb0_U13 ( .B1(regb0_n30), .B2(n9), .A(regb0_n5), .ZN(regb0_n23)
         );
  NAND2_X1 regb0_U12 ( .A1(mulb0[9]), .A2(n9), .ZN(regb0_n5) );
  MUX2_X1 regb0_U11 ( .A(t_mulb0_del_vec[2]), .B(mulb0[8]), .S(n9), .Z(
        regb0_n24) );
  MUX2_X1 regb0_U10 ( .A(t_mulb0_del_vec[1]), .B(mulb0[7]), .S(n9), .Z(
        regb0_n25) );
  INV_X1 regb0_U9 ( .A(regb0_n31), .ZN(t_mulb0_del_vec[1]) );
  MUX2_X1 regb0_U8 ( .A(t_mulb0_del_vec[0]), .B(mulb0[6]), .S(n9), .Z(
        regb0_n26) );
  NAND2_X1 regb0_U7 ( .A1(regb0_n8), .A2(regb0_n3), .ZN(regb0_n10) );
  OR2_X1 regb0_U6 ( .A1(regb0_n27), .A2(n9), .ZN(regb0_n3) );
  NAND2_X1 regb0_U5 ( .A1(regb0_n7), .A2(regb0_n2), .ZN(regb0_n21) );
  OR2_X1 regb0_U4 ( .A1(regb0_n28), .A2(n9), .ZN(regb0_n2) );
  NAND2_X1 regb0_U3 ( .A1(regb0_n6), .A2(regb0_n1), .ZN(regb0_n22) );
  OR2_X1 regb0_U2 ( .A1(regb0_n29), .A2(n9), .ZN(regb0_n1) );
  DFFR_X2 regb0_Q_reg_3_ ( .D(regb0_n23), .CK(CLK), .RN(RST_n), .Q(
        t_mulb0_del_vec[3]), .QN(regb0_n30) );
  DFFR_X1 regb0_Q_reg_6_ ( .D(regb0_n10), .CK(CLK), .RN(RST_n), .Q(
        t_mulb0_del_vec[6]), .QN(regb0_n27) );
  DFFR_X1 regb0_Q_reg_0_ ( .D(regb0_n26), .CK(CLK), .RN(RST_n), .Q(
        t_mulb0_del_vec[0]) );
  DFFR_X1 regb0_Q_reg_1_ ( .D(regb0_n25), .CK(CLK), .RN(RST_n), .QN(regb0_n31)
         );
  DFFR_X1 regb0_Q_reg_2_ ( .D(regb0_n24), .CK(CLK), .RN(RST_n), .Q(
        t_mulb0_del_vec[2]) );
  DFFR_X1 regb0_Q_reg_4_ ( .D(regb0_n22), .CK(CLK), .RN(RST_n), .Q(
        t_mulb0_del_vec[4]), .QN(regb0_n29) );
  DFFR_X1 regb0_Q_reg_5_ ( .D(regb0_n21), .CK(CLK), .RN(RST_n), .Q(
        t_mulb0_del_vec[5]), .QN(regb0_n28) );
  NAND2_X1 regb1_U11 ( .A1(mulb1[11]), .A2(n9), .ZN(regb1_n3) );
  OAI21_X1 regb1_U10 ( .B1(regb1_n13), .B2(n9), .A(regb1_n2), .ZN(regb1_n7) );
  NAND2_X1 regb1_U9 ( .A1(mulb1[9]), .A2(n9), .ZN(regb1_n2) );
  MUX2_X1 regb1_U8 ( .A(t_mulb1_del_vec[2]), .B(mulb1[8]), .S(n9), .Z(regb1_n8) );
  MUX2_X1 regb1_U7 ( .A(t_mulb1_del_vec[1]), .B(mulb1[7]), .S(n9), .Z(regb1_n9) );
  MUX2_X1 regb1_U6 ( .A(t_mulb1_del_vec[0]), .B(mulb1[6]), .S(n9), .Z(
        regb1_n10) );
  NAND2_X1 regb1_U5 ( .A1(regb1_n3), .A2(regb1_n1), .ZN(regb1_n5) );
  OR2_X1 regb1_U4 ( .A1(regb1_n12), .A2(n9), .ZN(regb1_n1) );
  MUX2_X1 regb1_U3 ( .A(t_mulb1_del_vec[6]), .B(mulb1[12]), .S(n9), .Z(
        regb1_n4) );
  MUX2_X1 regb1_U2 ( .A(t_mulb1_del_vec[4]), .B(mulb1[10]), .S(n9), .Z(
        regb1_n6) );
  DFFR_X2 regb1_Q_reg_3_ ( .D(regb1_n7), .CK(CLK), .RN(RST_n), .Q(
        t_mulb1_del_vec[3]), .QN(regb1_n13) );
  DFFR_X1 regb1_Q_reg_0_ ( .D(regb1_n10), .CK(CLK), .RN(RST_n), .Q(
        t_mulb1_del_vec[0]) );
  DFFR_X1 regb1_Q_reg_1_ ( .D(regb1_n9), .CK(CLK), .RN(RST_n), .Q(
        t_mulb1_del_vec[1]) );
  DFFR_X1 regb1_Q_reg_2_ ( .D(regb1_n8), .CK(CLK), .RN(RST_n), .Q(
        t_mulb1_del_vec[2]) );
  DFFR_X1 regb1_Q_reg_4_ ( .D(regb1_n6), .CK(CLK), .RN(RST_n), .Q(
        t_mulb1_del_vec[4]) );
  DFFR_X1 regb1_Q_reg_5_ ( .D(regb1_n5), .CK(CLK), .RN(RST_n), .Q(
        t_mulb1_del_vec[5]), .QN(regb1_n12) );
  DFFR_X1 regb1_Q_reg_6_ ( .D(regb1_n4), .CK(CLK), .RN(RST_n), .Q(
        t_mulb1_del_vec[6]) );
  MUX2_X1 regU2_U17 ( .A(regU2_n44), .B(u_del_vec[6]), .S(regU2_n1), .Z(
        regU2_n26) );
  INV_X1 regU2_U16 ( .A(regU2_n34), .ZN(u_del_vec2[6]) );
  MUX2_X1 regU2_U15 ( .A(regU2_n45), .B(u_del_vec[5]), .S(regU2_n1), .Z(
        regU2_n27) );
  MUX2_X1 regU2_U14 ( .A(regU2_n46), .B(u_del_vec[3]), .S(regU2_n1), .Z(
        regU2_n29) );
  MUX2_X1 regU2_U13 ( .A(u_del_vec2[0]), .B(n7), .S(regU2_n1), .Z(regU2_n32)
         );
  NAND2_X1 regU2_U12 ( .A1(u_del_vec[7]), .A2(regU2_n1), .ZN(regU2_n40) );
  OAI21_X1 regU2_U11 ( .B1(regU2_n33), .B2(regU2_n1), .A(regU2_n40), .ZN(
        regU2_n25) );
  NAND2_X1 regU2_U10 ( .A1(u_del_vec[4]), .A2(regU2_n1), .ZN(regU2_n41) );
  OAI21_X1 regU2_U9 ( .B1(regU2_n36), .B2(regU2_n1), .A(regU2_n41), .ZN(
        regU2_n28) );
  NAND2_X1 regU2_U8 ( .A1(u_del_vec[2]), .A2(regU2_n1), .ZN(regU2_n42) );
  OAI21_X1 regU2_U7 ( .B1(regU2_n38), .B2(regU2_n1), .A(regU2_n42), .ZN(
        regU2_n30) );
  NAND2_X1 regU2_U6 ( .A1(u_del_vec[1]), .A2(regU2_n1), .ZN(regU2_n43) );
  OAI21_X1 regU2_U5 ( .B1(regU2_n39), .B2(regU2_n1), .A(regU2_n43), .ZN(
        regU2_n31) );
  BUF_X1 regU2_U4 ( .A(n9), .Z(regU2_n1) );
  INV_X1 regU2_U3 ( .A(regU2_n37), .ZN(u_del_vec2[3]) );
  INV_X1 regU2_U2 ( .A(regU2_n35), .ZN(u_del_vec2[5]) );
  DFFR_X1 regU2_Q_reg_0_ ( .D(regU2_n32), .CK(CLK), .RN(RST_n), .Q(
        u_del_vec2[0]) );
  DFFR_X1 regU2_Q_reg_1_ ( .D(regU2_n31), .CK(CLK), .RN(RST_n), .Q(
        u_del_vec2[1]), .QN(regU2_n39) );
  DFFR_X1 regU2_Q_reg_2_ ( .D(regU2_n30), .CK(CLK), .RN(RST_n), .Q(
        u_del_vec2[2]), .QN(regU2_n38) );
  DFFR_X1 regU2_Q_reg_3_ ( .D(regU2_n29), .CK(CLK), .RN(RST_n), .Q(regU2_n46), 
        .QN(regU2_n37) );
  DFFR_X1 regU2_Q_reg_4_ ( .D(regU2_n28), .CK(CLK), .RN(RST_n), .Q(
        u_del_vec2[4]), .QN(regU2_n36) );
  DFFR_X1 regU2_Q_reg_5_ ( .D(regU2_n27), .CK(CLK), .RN(RST_n), .Q(regU2_n45), 
        .QN(regU2_n35) );
  DFFR_X1 regU2_Q_reg_6_ ( .D(regU2_n26), .CK(CLK), .RN(RST_n), .Q(regU2_n44), 
        .QN(regU2_n34) );
  DFFR_X1 regU2_Q_reg_7_ ( .D(regU2_n25), .CK(CLK), .RN(RST_n), .Q(
        u_del_vec2[7]), .QN(regU2_n33) );
  MUX2_X1 regb2_U8 ( .A(t_mulb2_del_vec[6]), .B(mulb2[12]), .S(n8), .Z(
        regb2_n8) );
  MUX2_X1 regb2_U7 ( .A(t_mulb2_del_vec[5]), .B(mulb2[11]), .S(n8), .Z(
        regb2_n9) );
  MUX2_X1 regb2_U6 ( .A(t_mulb2_del_vec[4]), .B(mulb2[10]), .S(n8), .Z(
        regb2_n10) );
  MUX2_X1 regb2_U5 ( .A(t_mulb2_del_vec[3]), .B(mulb2[9]), .S(n8), .Z(
        regb2_n11) );
  MUX2_X1 regb2_U4 ( .A(t_mulb2_del_vec[2]), .B(mulb2[8]), .S(n8), .Z(
        regb2_n12) );
  MUX2_X1 regb2_U3 ( .A(t_mulb2_del_vec[1]), .B(mulb2[7]), .S(n8), .Z(
        regb2_n13) );
  MUX2_X1 regb2_U2 ( .A(t_mulb2_del_vec[0]), .B(mulb2[6]), .S(n8), .Z(
        regb2_n14) );
  DFFR_X2 regb2_Q_reg_2_ ( .D(regb2_n12), .CK(CLK), .RN(RST_n), .Q(
        t_mulb2_del_vec[2]) );
  DFFR_X1 regb2_Q_reg_6_ ( .D(regb2_n8), .CK(CLK), .RN(RST_n), .Q(
        t_mulb2_del_vec[6]) );
  DFFR_X1 regb2_Q_reg_4_ ( .D(regb2_n10), .CK(CLK), .RN(RST_n), .Q(
        t_mulb2_del_vec[4]) );
  DFFR_X1 regb2_Q_reg_5_ ( .D(regb2_n9), .CK(CLK), .RN(RST_n), .Q(
        t_mulb2_del_vec[5]) );
  DFFR_X1 regb2_Q_reg_1_ ( .D(regb2_n13), .CK(CLK), .RN(RST_n), .Q(
        t_mulb2_del_vec[1]) );
  DFFR_X1 regb2_Q_reg_3_ ( .D(regb2_n11), .CK(CLK), .RN(RST_n), .Q(
        t_mulb2_del_vec[3]) );
  DFFR_X1 regb2_Q_reg_0_ ( .D(regb2_n14), .CK(CLK), .RN(RST_n), .Q(
        t_mulb2_del_vec[0]) );
  NAND2_X1 regsum_U15 ( .A1(sum1[5]), .A2(regsum_n7), .ZN(regsum_n35) );
  OAI21_X1 regsum_U14 ( .B1(regsum_n29), .B2(regsum_n7), .A(regsum_n35), .ZN(
        regsum_n23) );
  NAND2_X1 regsum_U13 ( .A1(sum1[4]), .A2(regsum_n7), .ZN(regsum_n36) );
  OAI21_X1 regsum_U12 ( .B1(regsum_n30), .B2(regsum_n7), .A(regsum_n36), .ZN(
        regsum_n24) );
  NAND2_X1 regsum_U11 ( .A1(sum1[3]), .A2(regsum_n7), .ZN(regsum_n37) );
  OAI21_X1 regsum_U10 ( .B1(regsum_n31), .B2(regsum_n7), .A(regsum_n37), .ZN(
        regsum_n25) );
  NAND2_X1 regsum_U9 ( .A1(sum1[2]), .A2(regsum_n7), .ZN(regsum_n38) );
  OAI21_X1 regsum_U8 ( .B1(regsum_n32), .B2(regsum_n7), .A(regsum_n38), .ZN(
        regsum_n26) );
  NAND2_X1 regsum_U7 ( .A1(sum1[1]), .A2(regsum_n7), .ZN(regsum_n39) );
  OAI21_X1 regsum_U6 ( .B1(regsum_n33), .B2(regsum_n7), .A(regsum_n39), .ZN(
        regsum_n27) );
  NAND2_X1 regsum_U5 ( .A1(regsum_n7), .A2(sum1[0]), .ZN(regsum_n40) );
  OAI21_X1 regsum_U4 ( .B1(regsum_n34), .B2(regsum_n7), .A(regsum_n40), .ZN(
        regsum_n28) );
  BUF_X1 regsum_U3 ( .A(n8), .Z(regsum_n7) );
  MUX2_X1 regsum_U2 ( .A(sum1_del_vec[6]), .B(sum1[6]), .S(n8), .Z(regsum_n22)
         );
  DFFR_X1 regsum_Q_reg_0_ ( .D(regsum_n28), .CK(CLK), .RN(RST_n), .Q(
        sum1_del_vec[0]), .QN(regsum_n34) );
  DFFR_X1 regsum_Q_reg_1_ ( .D(regsum_n27), .CK(CLK), .RN(RST_n), .Q(
        sum1_del_vec[1]), .QN(regsum_n33) );
  DFFR_X1 regsum_Q_reg_2_ ( .D(regsum_n26), .CK(CLK), .RN(RST_n), .Q(
        sum1_del_vec[2]), .QN(regsum_n32) );
  DFFR_X1 regsum_Q_reg_3_ ( .D(regsum_n25), .CK(CLK), .RN(RST_n), .Q(
        sum1_del_vec[3]), .QN(regsum_n31) );
  DFFR_X1 regsum_Q_reg_4_ ( .D(regsum_n24), .CK(CLK), .RN(RST_n), .Q(
        sum1_del_vec[4]), .QN(regsum_n30) );
  DFFR_X1 regsum_Q_reg_5_ ( .D(regsum_n23), .CK(CLK), .RN(RST_n), .Q(
        sum1_del_vec[5]), .QN(regsum_n29) );
  DFFR_X1 regsum_Q_reg_6_ ( .D(regsum_n22), .CK(CLK), .RN(RST_n), .Q(
        sum1_del_vec[6]) );
  MUX2_X1 regY_U10 ( .A(DOUT[11]), .B(y[7]), .S(n8), .Z(regY_n5) );
  MUX2_X1 regY_U9 ( .A(DOUT[10]), .B(y[6]), .S(n8), .Z(regY_n6) );
  MUX2_X1 regY_U8 ( .A(DOUT[9]), .B(y[5]), .S(n8), .Z(regY_n7) );
  MUX2_X1 regY_U7 ( .A(DOUT[8]), .B(y[4]), .S(n8), .Z(regY_n8) );
  MUX2_X1 regY_U6 ( .A(DOUT[7]), .B(y[3]), .S(n8), .Z(regY_n10) );
  MUX2_X1 regY_U5 ( .A(DOUT[6]), .B(y[2]), .S(n8), .Z(regY_n11) );
  MUX2_X1 regY_U4 ( .A(DOUT[5]), .B(y[1]), .S(n8), .Z(regY_n12) );
  NAND2_X1 regY_U3 ( .A1(n8), .A2(y[0]), .ZN(regY_n15) );
  OAI21_X1 regY_U2 ( .B1(regY_n14), .B2(n8), .A(regY_n15), .ZN(regY_n13) );
  DFFR_X1 regY_Q_reg_0_ ( .D(regY_n13), .CK(CLK), .RN(RST_n), .Q(DOUT[4]), 
        .QN(regY_n14) );
  DFFR_X1 regY_Q_reg_1_ ( .D(regY_n12), .CK(CLK), .RN(RST_n), .Q(DOUT[5]) );
  DFFR_X1 regY_Q_reg_2_ ( .D(regY_n11), .CK(CLK), .RN(RST_n), .Q(DOUT[6]) );
  DFFR_X1 regY_Q_reg_3_ ( .D(regY_n10), .CK(CLK), .RN(RST_n), .Q(DOUT[7]) );
  DFFR_X1 regY_Q_reg_4_ ( .D(regY_n8), .CK(CLK), .RN(RST_n), .Q(DOUT[8]) );
  DFFR_X1 regY_Q_reg_5_ ( .D(regY_n7), .CK(CLK), .RN(RST_n), .Q(DOUT[9]) );
  DFFR_X1 regY_Q_reg_6_ ( .D(regY_n6), .CK(CLK), .RN(RST_n), .Q(DOUT[10]) );
  DFFR_X1 regY_Q_reg_7_ ( .D(regY_n5), .CK(CLK), .RN(RST_n), .Q(DOUT[11]) );
  DFFR_X1 ff1_Q_reg ( .D(VIN), .CK(CLK), .RN(RST_n), .Q(q1) );
  DFFR_X1 ff2_Q_reg ( .D(q1), .CK(CLK), .RN(RST_n), .Q(q2) );
  DFFR_X1 ff3_Q_reg ( .D(n9), .CK(CLK), .RN(RST_n), .Q(q3) );
  DFFR_X1 ff4_Q_reg ( .D(n8), .CK(CLK), .RN(RST_n), .Q(VOUT) );
  AND2_X1 add_90_U2 ( .A1(t_mulb1_del_vec[0]), .A2(t_mulb2_del_vec[0]), .ZN(
        add_90_n2) );
  XOR2_X1 add_90_U1 ( .A(t_mulb1_del_vec[0]), .B(t_mulb2_del_vec[0]), .Z(
        sum1[0]) );
  FA_X1 add_90_U1_1 ( .A(t_mulb2_del_vec[1]), .B(t_mulb1_del_vec[1]), .CI(
        add_90_n2), .CO(add_90_carry[2]), .S(sum1[1]) );
  FA_X1 add_90_U1_2 ( .A(t_mulb2_del_vec[2]), .B(t_mulb1_del_vec[2]), .CI(
        add_90_carry[2]), .CO(add_90_carry[3]), .S(sum1[2]) );
  FA_X1 add_90_U1_3 ( .A(t_mulb2_del_vec[3]), .B(t_mulb1_del_vec[3]), .CI(
        add_90_carry[3]), .CO(add_90_carry[4]), .S(sum1[3]) );
  FA_X1 add_90_U1_4 ( .A(t_mulb2_del_vec[4]), .B(t_mulb1_del_vec[4]), .CI(
        add_90_carry[4]), .CO(add_90_carry[5]), .S(sum1[4]) );
  FA_X1 add_90_U1_5 ( .A(t_mulb2_del_vec[5]), .B(t_mulb1_del_vec[5]), .CI(
        add_90_carry[5]), .CO(add_90_carry[6]), .S(sum1[5]) );
  FA_X1 add_90_U1_6 ( .A(t_mulb2_del_vec[6]), .B(t_mulb1_del_vec[6]), .CI(
        add_90_carry[6]), .S(sum1[6]) );
  OAI21_X1 mult_85_U380 ( .B1(mult_85_n253), .B2(mult_85_n19), .A(mult_85_n20), 
        .ZN(mult_85_n18) );
  OAI21_X1 mult_85_U379 ( .B1(mult_85_n1), .B2(mult_85_n12), .A(mult_85_n13), 
        .ZN(mult_85_n11) );
  OAI21_X1 mult_85_U378 ( .B1(mult_85_n1), .B2(mult_85_n26), .A(mult_85_n27), 
        .ZN(mult_85_n25) );
  XNOR2_X1 mult_85_U377 ( .A(mult_85_n25), .B(mult_85_n4), .ZN(mulb2[10]) );
  OAI21_X1 mult_85_U376 ( .B1(mult_85_n30), .B2(mult_85_n34), .A(mult_85_n31), 
        .ZN(mult_85_n29) );
  XNOR2_X1 mult_85_U375 ( .A(u_del_vec2[5]), .B(b2[8]), .ZN(mult_85_n169) );
  XNOR2_X1 mult_85_U374 ( .A(u_del_vec2[5]), .B(b2[10]), .ZN(mult_85_n160) );
  XNOR2_X1 mult_85_U373 ( .A(u_del_vec2[5]), .B(b2[6]), .ZN(mult_85_n178) );
  OAI22_X1 mult_85_U372 ( .A1(mult_85_n169), .A2(mult_85_n203), .B1(
        mult_85_n199), .B2(mult_85_n170), .ZN(mult_85_n136) );
  XNOR2_X1 mult_85_U371 ( .A(mult_85_n245), .B(b2[11]), .ZN(mult_85_n151) );
  OAI22_X1 mult_85_U370 ( .A1(mult_85_n168), .A2(mult_85_n203), .B1(
        mult_85_n257), .B2(mult_85_n199), .ZN(mult_85_n135) );
  XNOR2_X1 mult_85_U369 ( .A(mult_85_n246), .B(b2[11]), .ZN(mult_85_n153) );
  XNOR2_X1 mult_85_U368 ( .A(u_del_vec2[3]), .B(b2[10]), .ZN(mult_85_n162) );
  XNOR2_X1 mult_85_U367 ( .A(u_del_vec2[3]), .B(b2[8]), .ZN(mult_85_n171) );
  XNOR2_X1 mult_85_U366 ( .A(mult_85_n246), .B(b2[6]), .ZN(mult_85_n180) );
  XNOR2_X1 mult_85_U365 ( .A(mult_85_n11), .B(mult_85_n2), .ZN(mulb2[12]) );
  XNOR2_X1 mult_85_U364 ( .A(u_del_vec2[6]), .B(b2[6]), .ZN(mult_85_n177) );
  XNOR2_X1 mult_85_U363 ( .A(u_del_vec2[6]), .B(b2[8]), .ZN(mult_85_n168) );
  OAI22_X1 mult_85_U362 ( .A1(mult_85_n177), .A2(mult_85_n200), .B1(
        mult_85_n176), .B2(mult_85_n220), .ZN(mult_85_n143) );
  XNOR2_X1 mult_85_U361 ( .A(u_del_vec2[6]), .B(b2[10]), .ZN(mult_85_n159) );
  OAI22_X1 mult_85_U360 ( .A1(mult_85_n177), .A2(mult_85_n220), .B1(
        mult_85_n178), .B2(mult_85_n200), .ZN(mult_85_n144) );
  XNOR2_X1 mult_85_U359 ( .A(u_del_vec2[6]), .B(b2[11]), .ZN(mult_85_n150) );
  NOR2_X1 mult_85_U358 ( .A1(mult_85_n256), .A2(mult_85_n33), .ZN(mult_85_n28)
         );
  INV_X1 mult_85_U357 ( .A(mult_85_n33), .ZN(mult_85_n63) );
  OAI21_X1 mult_85_U356 ( .B1(mult_85_n35), .B2(mult_85_n255), .A(mult_85_n254), .ZN(mult_85_n32) );
  XNOR2_X1 mult_85_U355 ( .A(mult_85_n18), .B(mult_85_n3), .ZN(mulb2[11]) );
  NAND2_X1 mult_85_U354 ( .A1(mult_85_n76), .A2(mult_85_n81), .ZN(mult_85_n27)
         );
  OAI21_X1 mult_85_U353 ( .B1(mult_85_n23), .B2(mult_85_n27), .A(mult_85_n24), 
        .ZN(mult_85_n22) );
  AOI21_X1 mult_85_U352 ( .B1(mult_85_n22), .B2(mult_85_n261), .A(mult_85_n15), 
        .ZN(mult_85_n13) );
  INV_X1 mult_85_U351 ( .A(mult_85_n22), .ZN(mult_85_n20) );
  NOR2_X1 mult_85_U350 ( .A1(mult_85_n97), .A2(mult_85_n100), .ZN(mult_85_n41)
         );
  OAI22_X1 mult_85_U349 ( .A1(mult_85_n171), .A2(mult_85_n199), .B1(
        mult_85_n203), .B2(mult_85_n170), .ZN(mult_85_n137) );
  OAI22_X1 mult_85_U348 ( .A1(mult_85_n171), .A2(mult_85_n203), .B1(
        mult_85_n199), .B2(mult_85_n172), .ZN(mult_85_n138) );
  OAI22_X1 mult_85_U347 ( .A1(mult_85_n160), .A2(mult_85_n202), .B1(
        mult_85_n198), .B2(mult_85_n161), .ZN(mult_85_n127) );
  INV_X1 mult_85_U346 ( .A(mult_85_n26), .ZN(mult_85_n61) );
  OAI22_X1 mult_85_U345 ( .A1(mult_85_n252), .A2(mult_85_n202), .B1(
        mult_85_n198), .B2(mult_85_n163), .ZN(mult_85_n129) );
  OAI22_X1 mult_85_U344 ( .A1(mult_85_n162), .A2(mult_85_n198), .B1(
        mult_85_n202), .B2(mult_85_n161), .ZN(mult_85_n128) );
  OAI22_X1 mult_85_U343 ( .A1(mult_85_n180), .A2(mult_85_n220), .B1(
        mult_85_n200), .B2(mult_85_n181), .ZN(mult_85_n147) );
  NAND2_X1 mult_85_U342 ( .A1(mult_85_n147), .A2(mult_85_n103), .ZN(
        mult_85_n50) );
  NAND2_X1 mult_85_U341 ( .A1(mult_85_n82), .A2(mult_85_n86), .ZN(mult_85_n31)
         );
  INV_X1 mult_85_U340 ( .A(b2[11]), .ZN(mult_85_n205) );
  INV_X1 mult_85_U339 ( .A(b2[8]), .ZN(mult_85_n207) );
  INV_X1 mult_85_U338 ( .A(b2[10]), .ZN(mult_85_n206) );
  INV_X1 mult_85_U337 ( .A(b2[6]), .ZN(mult_85_n208) );
  OR2_X1 mult_85_U336 ( .A1(u_del_vec2[0]), .A2(mult_85_n208), .ZN(
        mult_85_n184) );
  OR2_X1 mult_85_U335 ( .A1(u_del_vec2[0]), .A2(mult_85_n207), .ZN(
        mult_85_n175) );
  OAI22_X1 mult_85_U334 ( .A1(mult_85_n199), .A2(mult_85_n174), .B1(
        mult_85_n203), .B2(mult_85_n173), .ZN(mult_85_n140) );
  OAI22_X1 mult_85_U333 ( .A1(mult_85_n199), .A2(mult_85_n207), .B1(
        mult_85_n175), .B2(mult_85_n203), .ZN(mult_85_n116) );
  OR2_X1 mult_85_U332 ( .A1(u_del_vec2[0]), .A2(mult_85_n206), .ZN(
        mult_85_n166) );
  OAI22_X1 mult_85_U331 ( .A1(mult_85_n198), .A2(mult_85_n165), .B1(
        mult_85_n202), .B2(mult_85_n164), .ZN(mult_85_n131) );
  OAI22_X1 mult_85_U330 ( .A1(mult_85_n198), .A2(mult_85_n206), .B1(
        mult_85_n166), .B2(mult_85_n202), .ZN(mult_85_n115) );
  OR2_X1 mult_85_U329 ( .A1(u_del_vec2[0]), .A2(mult_85_n205), .ZN(
        mult_85_n157) );
  NOR2_X1 mult_85_U328 ( .A1(mult_85_n201), .A2(mult_85_n155), .ZN(
        mult_85_n122) );
  NOR2_X1 mult_85_U327 ( .A1(mult_85_n157), .A2(mult_85_n201), .ZN(
        mult_85_n114) );
  INV_X1 mult_85_U326 ( .A(mult_85_n201), .ZN(mult_85_n104) );
  OAI22_X1 mult_85_U325 ( .A1(mult_85_n198), .A2(mult_85_n164), .B1(
        mult_85_n202), .B2(mult_85_n163), .ZN(mult_85_n130) );
  AND2_X1 mult_85_U324 ( .A1(u_del_vec2[0]), .A2(mult_85_n104), .ZN(
        mult_85_n123) );
  XNOR2_X1 mult_85_U323 ( .A(b2[11]), .B(u_del_vec2[4]), .ZN(mult_85_n152) );
  XNOR2_X1 mult_85_U322 ( .A(b2[11]), .B(u_del_vec2[1]), .ZN(mult_85_n155) );
  INV_X1 mult_85_U321 ( .A(mult_85_n203), .ZN(mult_85_n110) );
  AND2_X1 mult_85_U320 ( .A1(u_del_vec2[0]), .A2(mult_85_n110), .ZN(
        mult_85_n141) );
  XNOR2_X1 mult_85_U319 ( .A(b2[8]), .B(u_del_vec2[4]), .ZN(mult_85_n170) );
  XNOR2_X1 mult_85_U318 ( .A(b2[10]), .B(u_del_vec2[4]), .ZN(mult_85_n161) );
  XOR2_X1 mult_85_U317 ( .A(b2[5]), .B(b2[6]), .Z(mult_85_n196) );
  NAND2_X1 mult_85_U316 ( .A1(mult_85_n196), .A2(mult_85_n220), .ZN(
        mult_85_n200) );
  XNOR2_X1 mult_85_U315 ( .A(b2[8]), .B(u_del_vec2[0]), .ZN(mult_85_n174) );
  XNOR2_X1 mult_85_U314 ( .A(b2[10]), .B(u_del_vec2[0]), .ZN(mult_85_n165) );
  XNOR2_X1 mult_85_U313 ( .A(b2[6]), .B(u_del_vec2[0]), .ZN(mult_85_n183) );
  INV_X1 mult_85_U312 ( .A(b2[5]), .ZN(mult_85_n220) );
  XNOR2_X1 mult_85_U311 ( .A(b2[6]), .B(u_del_vec2[2]), .ZN(mult_85_n181) );
  XNOR2_X1 mult_85_U310 ( .A(b2[10]), .B(u_del_vec2[2]), .ZN(mult_85_n163) );
  XNOR2_X1 mult_85_U309 ( .A(b2[8]), .B(u_del_vec2[2]), .ZN(mult_85_n172) );
  XOR2_X1 mult_85_U308 ( .A(b2[7]), .B(b2[8]), .Z(mult_85_n195) );
  NAND2_X1 mult_85_U307 ( .A1(mult_85_n195), .A2(mult_85_n203), .ZN(
        mult_85_n199) );
  INV_X1 mult_85_U306 ( .A(mult_85_n202), .ZN(mult_85_n107) );
  OAI22_X1 mult_85_U305 ( .A1(mult_85_n199), .A2(mult_85_n173), .B1(
        mult_85_n203), .B2(mult_85_n172), .ZN(mult_85_n139) );
  AND2_X1 mult_85_U304 ( .A1(u_del_vec2[0]), .A2(mult_85_n107), .ZN(
        mult_85_n132) );
  XOR2_X1 mult_85_U303 ( .A(b2[9]), .B(b2[10]), .Z(mult_85_n194) );
  NAND2_X1 mult_85_U302 ( .A1(mult_85_n194), .A2(mult_85_n202), .ZN(
        mult_85_n198) );
  XNOR2_X1 mult_85_U301 ( .A(b2[6]), .B(u_del_vec2[4]), .ZN(mult_85_n179) );
  XNOR2_X1 mult_85_U300 ( .A(b2[6]), .B(u_del_vec2[1]), .ZN(mult_85_n182) );
  XNOR2_X1 mult_85_U299 ( .A(b2[10]), .B(u_del_vec2[1]), .ZN(mult_85_n164) );
  XNOR2_X1 mult_85_U298 ( .A(b2[8]), .B(u_del_vec2[1]), .ZN(mult_85_n173) );
  XNOR2_X1 mult_85_U297 ( .A(b2[11]), .B(u_del_vec2[2]), .ZN(mult_85_n154) );
  NOR2_X1 mult_85_U296 ( .A1(mult_85_n201), .A2(mult_85_n154), .ZN(
        mult_85_n121) );
  XNOR2_X1 mult_85_U295 ( .A(b2[6]), .B(u_del_vec2[7]), .ZN(mult_85_n176) );
  XNOR2_X1 mult_85_U294 ( .A(b2[10]), .B(u_del_vec2[7]), .ZN(mult_85_n158) );
  XNOR2_X1 mult_85_U293 ( .A(b2[8]), .B(u_del_vec2[7]), .ZN(mult_85_n167) );
  XNOR2_X1 mult_85_U292 ( .A(b2[11]), .B(b2[10]), .ZN(mult_85_n201) );
  NAND2_X1 mult_85_U291 ( .A1(mult_85_n261), .A2(mult_85_n17), .ZN(mult_85_n3)
         );
  NAND2_X1 mult_85_U290 ( .A1(mult_85_n262), .A2(mult_85_n10), .ZN(mult_85_n2)
         );
  NOR2_X1 mult_85_U289 ( .A1(mult_85_n153), .A2(mult_85_n201), .ZN(
        mult_85_n120) );
  NOR2_X1 mult_85_U288 ( .A1(mult_85_n150), .A2(mult_85_n201), .ZN(
        mult_85_n118) );
  NAND2_X1 mult_85_U287 ( .A1(mult_85_n240), .A2(mult_85_n24), .ZN(mult_85_n4)
         );
  NOR2_X1 mult_85_U286 ( .A1(mult_85_n151), .A2(mult_85_n201), .ZN(mult_85_n69) );
  OR2_X1 mult_85_U285 ( .A1(mult_85_n142), .A2(mult_85_n121), .ZN(mult_85_n79)
         );
  OAI22_X1 mult_85_U284 ( .A1(mult_85_n176), .A2(mult_85_n200), .B1(
        mult_85_n176), .B2(mult_85_n220), .ZN(mult_85_n112) );
  INV_X1 mult_85_U283 ( .A(mult_85_n112), .ZN(mult_85_n142) );
  AND2_X1 mult_85_U282 ( .A1(mult_85_n148), .A2(mult_85_n141), .ZN(
        mult_85_n266) );
  OR2_X1 mult_85_U281 ( .A1(mult_85_n148), .A2(mult_85_n141), .ZN(mult_85_n265) );
  OAI22_X1 mult_85_U280 ( .A1(mult_85_n200), .A2(mult_85_n208), .B1(
        mult_85_n184), .B2(mult_85_n220), .ZN(mult_85_n117) );
  OAI22_X1 mult_85_U279 ( .A1(mult_85_n200), .A2(mult_85_n183), .B1(
        mult_85_n182), .B2(mult_85_n220), .ZN(mult_85_n149) );
  OAI22_X1 mult_85_U278 ( .A1(mult_85_n167), .A2(mult_85_n199), .B1(
        mult_85_n167), .B2(mult_85_n203), .ZN(mult_85_n109) );
  NOR2_X1 mult_85_U277 ( .A1(mult_85_n201), .A2(mult_85_n152), .ZN(
        mult_85_n119) );
  INV_X1 mult_85_U276 ( .A(mult_85_n109), .ZN(mult_85_n133) );
  OAI22_X1 mult_85_U275 ( .A1(mult_85_n200), .A2(mult_85_n182), .B1(
        mult_85_n181), .B2(mult_85_n220), .ZN(mult_85_n148) );
  AND2_X1 mult_85_U274 ( .A1(mult_85_n101), .A2(mult_85_n146), .ZN(
        mult_85_n264) );
  NAND2_X1 mult_85_U273 ( .A1(mult_85_n97), .A2(mult_85_n100), .ZN(mult_85_n42) );
  AOI21_X1 mult_85_U272 ( .B1(mult_85_n263), .B2(mult_85_n48), .A(mult_85_n264), .ZN(mult_85_n43) );
  OAI21_X1 mult_85_U271 ( .B1(mult_85_n43), .B2(mult_85_n41), .A(mult_85_n42), 
        .ZN(mult_85_n40) );
  INV_X1 mult_85_U270 ( .A(mult_85_n40), .ZN(mult_85_n39) );
  NAND2_X1 mult_85_U269 ( .A1(mult_85_n93), .A2(mult_85_n95), .ZN(mult_85_n38)
         );
  OAI22_X1 mult_85_U268 ( .A1(mult_85_n178), .A2(mult_85_n220), .B1(
        mult_85_n200), .B2(mult_85_n179), .ZN(mult_85_n145) );
  NAND2_X1 mult_85_U267 ( .A1(mult_85_n72), .A2(mult_85_n75), .ZN(mult_85_n24)
         );
  XNOR2_X1 mult_85_U266 ( .A(mult_85_n142), .B(mult_85_n121), .ZN(mult_85_n85)
         );
  OAI22_X1 mult_85_U265 ( .A1(mult_85_n168), .A2(mult_85_n199), .B1(
        mult_85_n203), .B2(mult_85_n167), .ZN(mult_85_n134) );
  INV_X1 mult_85_U264 ( .A(mult_85_n79), .ZN(mult_85_n80) );
  NOR2_X1 mult_85_U263 ( .A1(mult_85_n93), .A2(mult_85_n95), .ZN(mult_85_n37)
         );
  OAI22_X1 mult_85_U262 ( .A1(mult_85_n159), .A2(mult_85_n202), .B1(
        mult_85_n247), .B2(mult_85_n198), .ZN(mult_85_n126) );
  NOR2_X1 mult_85_U261 ( .A1(mult_85_n147), .A2(mult_85_n103), .ZN(mult_85_n49) );
  AOI21_X1 mult_85_U260 ( .B1(mult_85_n265), .B2(mult_85_n241), .A(
        mult_85_n266), .ZN(mult_85_n51) );
  OAI21_X1 mult_85_U259 ( .B1(mult_85_n49), .B2(mult_85_n51), .A(mult_85_n50), 
        .ZN(mult_85_n48) );
  OAI22_X1 mult_85_U258 ( .A1(mult_85_n159), .A2(mult_85_n198), .B1(
        mult_85_n202), .B2(mult_85_n158), .ZN(mult_85_n125) );
  INV_X1 mult_85_U257 ( .A(mult_85_n69), .ZN(mult_85_n70) );
  OAI22_X1 mult_85_U256 ( .A1(mult_85_n180), .A2(mult_85_n200), .B1(
        mult_85_n179), .B2(mult_85_n220), .ZN(mult_85_n146) );
  OAI22_X1 mult_85_U255 ( .A1(mult_85_n158), .A2(mult_85_n198), .B1(
        mult_85_n158), .B2(mult_85_n202), .ZN(mult_85_n106) );
  NAND2_X1 mult_85_U254 ( .A1(mult_85_n68), .A2(mult_85_n71), .ZN(mult_85_n17)
         );
  NAND2_X1 mult_85_U253 ( .A1(mult_85_n67), .A2(mult_85_n66), .ZN(mult_85_n10)
         );
  OR2_X1 mult_85_U252 ( .A1(mult_85_n67), .A2(mult_85_n66), .ZN(mult_85_n262)
         );
  NAND2_X1 mult_85_U251 ( .A1(mult_85_n87), .A2(mult_85_n92), .ZN(mult_85_n34)
         );
  OR2_X2 mult_85_U250 ( .A1(mult_85_n68), .A2(mult_85_n71), .ZN(mult_85_n261)
         );
  OAI21_X1 mult_85_U249 ( .B1(mult_85_n37), .B2(mult_85_n39), .A(mult_85_n38), 
        .ZN(mult_85_n36) );
  NOR2_X1 mult_85_U248 ( .A1(mult_85_n26), .A2(mult_85_n23), .ZN(mult_85_n21)
         );
  INV_X1 mult_85_U247 ( .A(mult_85_n21), .ZN(mult_85_n19) );
  NAND2_X1 mult_85_U246 ( .A1(mult_85_n21), .A2(mult_85_n261), .ZN(mult_85_n12) );
  INV_X1 mult_85_U245 ( .A(mult_85_n256), .ZN(mult_85_n62) );
  INV_X1 mult_85_U244 ( .A(mult_85_n36), .ZN(mult_85_n35) );
  INV_X1 mult_85_U243 ( .A(mult_85_n17), .ZN(mult_85_n15) );
  AND2_X1 mult_85_U242 ( .A1(mult_85_n63), .A2(mult_85_n254), .ZN(mult_85_n260) );
  XNOR2_X1 mult_85_U241 ( .A(mult_85_n35), .B(mult_85_n260), .ZN(mulb2[7]) );
  AND2_X1 mult_85_U240 ( .A1(mult_85_n62), .A2(mult_85_n31), .ZN(mult_85_n259)
         );
  XOR2_X1 mult_85_U239 ( .A(mult_85_n32), .B(mult_85_n259), .Z(mulb2[8]) );
  OR2_X1 mult_85_U238 ( .A1(mult_85_n101), .A2(mult_85_n146), .ZN(mult_85_n263) );
  XOR2_X1 mult_85_U237 ( .A(mult_85_n69), .B(mult_85_n118), .Z(mult_85_n258)
         );
  XNOR2_X1 mult_85_U236 ( .A(mult_85_n106), .B(mult_85_n258), .ZN(mult_85_n66)
         );
  XNOR2_X1 mult_85_U235 ( .A(mult_85_n245), .B(b2[8]), .ZN(mult_85_n257) );
  NOR2_X1 mult_85_U234 ( .A1(mult_85_n82), .A2(mult_85_n86), .ZN(mult_85_n30)
         );
  NOR2_X1 mult_85_U233 ( .A1(mult_85_n82), .A2(mult_85_n86), .ZN(mult_85_n256)
         );
  NOR2_X1 mult_85_U232 ( .A1(mult_85_n87), .A2(mult_85_n92), .ZN(mult_85_n33)
         );
  INV_X1 mult_85_U231 ( .A(mult_85_n63), .ZN(mult_85_n255) );
  CLKBUF_X1 mult_85_U230 ( .A(mult_85_n34), .Z(mult_85_n254) );
  AOI21_X1 mult_85_U229 ( .B1(mult_85_n28), .B2(mult_85_n36), .A(mult_85_n29), 
        .ZN(mult_85_n1) );
  AOI21_X1 mult_85_U228 ( .B1(mult_85_n28), .B2(mult_85_n36), .A(mult_85_n29), 
        .ZN(mult_85_n253) );
  XNOR2_X1 mult_85_U227 ( .A(mult_85_n246), .B(b2[10]), .ZN(mult_85_n252) );
  NAND3_X1 mult_85_U226 ( .A1(mult_85_n249), .A2(mult_85_n250), .A3(
        mult_85_n251), .ZN(mult_85_n86) );
  NAND2_X1 mult_85_U225 ( .A1(mult_85_n129), .A2(mult_85_n94), .ZN(
        mult_85_n251) );
  NAND2_X1 mult_85_U224 ( .A1(mult_85_n89), .A2(mult_85_n94), .ZN(mult_85_n250) );
  NAND2_X1 mult_85_U223 ( .A1(mult_85_n89), .A2(mult_85_n129), .ZN(
        mult_85_n249) );
  XOR2_X1 mult_85_U222 ( .A(mult_85_n89), .B(mult_85_n248), .Z(mult_85_n87) );
  XOR2_X1 mult_85_U221 ( .A(mult_85_n129), .B(mult_85_n94), .Z(mult_85_n248)
         );
  XNOR2_X1 mult_85_U220 ( .A(mult_85_n245), .B(b2[10]), .ZN(mult_85_n247) );
  CLKBUF_X1 mult_85_U219 ( .A(u_del_vec2[3]), .Z(mult_85_n246) );
  CLKBUF_X1 mult_85_U218 ( .A(u_del_vec2[5]), .Z(mult_85_n245) );
  OR2_X1 mult_85_U217 ( .A1(mult_85_n93), .A2(mult_85_n95), .ZN(mult_85_n244)
         );
  AND2_X1 mult_85_U216 ( .A1(mult_85_n61), .A2(mult_85_n27), .ZN(mult_85_n243)
         );
  XNOR2_X1 mult_85_U215 ( .A(mult_85_n253), .B(mult_85_n243), .ZN(mulb2[9]) );
  AND2_X1 mult_85_U214 ( .A1(mult_85_n38), .A2(mult_85_n244), .ZN(mult_85_n242) );
  XNOR2_X1 mult_85_U213 ( .A(mult_85_n242), .B(mult_85_n39), .ZN(mulb2[6]) );
  AND2_X1 mult_85_U212 ( .A1(mult_85_n149), .A2(mult_85_n117), .ZN(
        mult_85_n241) );
  NOR2_X1 mult_85_U211 ( .A1(mult_85_n76), .A2(mult_85_n81), .ZN(mult_85_n26)
         );
  XNOR2_X1 mult_85_U210 ( .A(b2[9]), .B(b2[8]), .ZN(mult_85_n202) );
  XNOR2_X1 mult_85_U209 ( .A(b2[7]), .B(b2[6]), .ZN(mult_85_n203) );
  NOR2_X1 mult_85_U208 ( .A1(mult_85_n72), .A2(mult_85_n75), .ZN(mult_85_n23)
         );
  OR2_X1 mult_85_U207 ( .A1(mult_85_n72), .A2(mult_85_n75), .ZN(mult_85_n240)
         );
  HA_X1 mult_85_U93 ( .A(mult_85_n140), .B(mult_85_n116), .CO(mult_85_n102), 
        .S(mult_85_n103) );
  FA_X1 mult_85_U92 ( .A(mult_85_n139), .B(mult_85_n132), .CI(mult_85_n102), 
        .CO(mult_85_n100), .S(mult_85_n101) );
  HA_X1 mult_85_U91 ( .A(mult_85_n131), .B(mult_85_n115), .CO(mult_85_n98), 
        .S(mult_85_n99) );
  FA_X1 mult_85_U90 ( .A(mult_85_n138), .B(mult_85_n99), .CI(mult_85_n145), 
        .CO(mult_85_n96), .S(mult_85_n97) );
  FA_X1 mult_85_U89 ( .A(mult_85_n130), .B(mult_85_n123), .CI(mult_85_n98), 
        .CO(mult_85_n94), .S(mult_85_n95) );
  FA_X1 mult_85_U88 ( .A(mult_85_n144), .B(mult_85_n137), .CI(mult_85_n96), 
        .CO(mult_85_n92), .S(mult_85_n93) );
  HA_X1 mult_85_U87 ( .A(mult_85_n122), .B(mult_85_n114), .CO(mult_85_n90), 
        .S(mult_85_n91) );
  FA_X1 mult_85_U86 ( .A(mult_85_n136), .B(mult_85_n91), .CI(mult_85_n143), 
        .CO(mult_85_n88), .S(mult_85_n89) );
  FA_X1 mult_85_U82 ( .A(mult_85_n85), .B(mult_85_n90), .CI(mult_85_n128), 
        .CO(mult_85_n83), .S(mult_85_n84) );
  FA_X1 mult_85_U81 ( .A(mult_85_n135), .B(mult_85_n88), .CI(mult_85_n84), 
        .CO(mult_85_n81), .S(mult_85_n82) );
  FA_X1 mult_85_U79 ( .A(mult_85_n127), .B(mult_85_n80), .CI(mult_85_n134), 
        .CO(mult_85_n77), .S(mult_85_n78) );
  FA_X1 mult_85_U78 ( .A(mult_85_n83), .B(mult_85_n120), .CI(mult_85_n78), 
        .CO(mult_85_n75), .S(mult_85_n76) );
  FA_X1 mult_85_U77 ( .A(mult_85_n79), .B(mult_85_n133), .CI(mult_85_n119), 
        .CO(mult_85_n73), .S(mult_85_n74) );
  FA_X1 mult_85_U76 ( .A(mult_85_n77), .B(mult_85_n126), .CI(mult_85_n74), 
        .CO(mult_85_n71), .S(mult_85_n72) );
  FA_X1 mult_85_U74 ( .A(mult_85_n70), .B(mult_85_n125), .CI(mult_85_n73), 
        .CO(mult_85_n67), .S(mult_85_n68) );
  NAND2_X1 add_60_U123 ( .A1(din_del[5]), .A2(t_mula1_del_vec[5]), .ZN(
        add_60_n19) );
  NAND2_X1 add_60_U122 ( .A1(din_del[4]), .A2(t_mula1_del_vec[4]), .ZN(
        add_60_n28) );
  NAND2_X1 add_60_U121 ( .A1(din_del[1]), .A2(t_mula1_del_vec[1]), .ZN(
        add_60_n46) );
  NAND2_X1 add_60_U120 ( .A1(din_del[3]), .A2(t_mula1_del_vec[3]), .ZN(
        add_60_n35) );
  INV_X1 add_60_U119 ( .A(din_del[6]), .ZN(add_60_n57) );
  INV_X1 add_60_U118 ( .A(t_mula1_del_vec[6]), .ZN(add_60_n56) );
  NOR2_X1 add_60_U117 ( .A1(din_del[1]), .A2(t_mula1_del_vec[1]), .ZN(
        add_60_n45) );
  NOR2_X1 add_60_U116 ( .A1(din_del[3]), .A2(t_mula1_del_vec[3]), .ZN(
        add_60_n34) );
  OR2_X1 add_60_U115 ( .A1(din_del[5]), .A2(t_mula1_del_vec[5]), .ZN(
        add_60_n89) );
  NOR2_X1 add_60_U114 ( .A1(din_del[4]), .A2(t_mula1_del_vec[4]), .ZN(
        add_60_n27) );
  NAND2_X1 add_60_U113 ( .A1(add_60_n54), .A2(add_60_n46), .ZN(add_60_n6) );
  XOR2_X1 add_60_U112 ( .A(add_60_n48), .B(add_60_n6), .Z(u[1]) );
  NAND2_X1 add_60_U111 ( .A1(add_60_n53), .A2(add_60_n38), .ZN(add_60_n5) );
  XOR2_X1 add_60_U110 ( .A(add_60_n5), .B(add_60_n43), .Z(u[2]) );
  OAI21_X1 add_60_U109 ( .B1(add_60_n11), .B2(add_60_n9), .A(add_60_n10), .ZN(
        add_60_n8) );
  INV_X1 add_60_U108 ( .A(add_60_n8), .ZN(u[7]) );
  NAND2_X1 add_60_U107 ( .A1(add_60_n52), .A2(add_60_n35), .ZN(add_60_n4) );
  XNOR2_X1 add_60_U106 ( .A(add_60_n36), .B(add_60_n4), .ZN(u[3]) );
  INV_X1 add_60_U105 ( .A(add_60_n9), .ZN(add_60_n49) );
  NAND2_X1 add_60_U104 ( .A1(add_60_n89), .A2(add_60_n19), .ZN(add_60_n2) );
  XNOR2_X1 add_60_U103 ( .A(add_60_n20), .B(add_60_n2), .ZN(u[5]) );
  NAND2_X1 add_60_U102 ( .A1(add_60_n51), .A2(add_60_n28), .ZN(add_60_n3) );
  XNOR2_X1 add_60_U101 ( .A(add_60_n29), .B(add_60_n3), .ZN(u[4]) );
  NAND2_X1 add_60_U100 ( .A1(din_del[0]), .A2(t_mula1_del_vec[0]), .ZN(
        add_60_n48) );
  NAND2_X1 add_60_U99 ( .A1(din_del[2]), .A2(t_mula1_del_vec[2]), .ZN(
        add_60_n38) );
  INV_X1 add_60_U98 ( .A(add_60_n45), .ZN(add_60_n54) );
  INV_X1 add_60_U97 ( .A(add_60_n27), .ZN(add_60_n51) );
  NAND2_X1 add_60_U96 ( .A1(add_60_n57), .A2(add_60_n56), .ZN(add_60_n10) );
  NOR2_X1 add_60_U95 ( .A1(add_60_n57), .A2(add_60_n56), .ZN(add_60_n9) );
  INV_X1 add_60_U94 ( .A(add_60_n19), .ZN(add_60_n17) );
  AOI21_X1 add_60_U93 ( .B1(add_60_n26), .B2(add_60_n89), .A(add_60_n17), .ZN(
        add_60_n15) );
  INV_X1 add_60_U92 ( .A(add_60_n34), .ZN(add_60_n52) );
  OAI21_X1 add_60_U91 ( .B1(add_60_n27), .B2(add_60_n35), .A(add_60_n28), .ZN(
        add_60_n26) );
  NOR2_X1 add_60_U90 ( .A1(add_60_n34), .A2(add_60_n27), .ZN(add_60_n23) );
  INV_X1 add_60_U89 ( .A(add_60_n35), .ZN(add_60_n33) );
  NAND2_X1 add_60_U88 ( .A1(add_60_n53), .A2(add_60_n52), .ZN(add_60_n30) );
  AOI21_X1 add_60_U87 ( .B1(add_60_n40), .B2(add_60_n52), .A(add_60_n33), .ZN(
        add_60_n31) );
  OAI21_X1 add_60_U86 ( .B1(add_60_n30), .B2(add_60_n43), .A(add_60_n31), .ZN(
        add_60_n29) );
  OAI21_X1 add_60_U85 ( .B1(add_60_n43), .B2(add_60_n37), .A(add_60_n38), .ZN(
        add_60_n36) );
  INV_X1 add_60_U84 ( .A(add_60_n38), .ZN(add_60_n40) );
  OAI21_X1 add_60_U83 ( .B1(add_60_n48), .B2(add_60_n45), .A(add_60_n46), .ZN(
        add_60_n44) );
  INV_X1 add_60_U82 ( .A(add_60_n37), .ZN(add_60_n53) );
  NAND2_X1 add_60_U81 ( .A1(add_60_n23), .A2(add_60_n89), .ZN(add_60_n14) );
  OAI21_X1 add_60_U80 ( .B1(add_60_n38), .B2(add_60_n14), .A(add_60_n15), .ZN(
        add_60_n13) );
  NOR2_X1 add_60_U79 ( .A1(add_60_n37), .A2(add_60_n14), .ZN(add_60_n12) );
  AOI21_X1 add_60_U78 ( .B1(add_60_n12), .B2(add_60_n44), .A(add_60_n13), .ZN(
        add_60_n11) );
  NAND2_X1 add_60_U77 ( .A1(add_60_n53), .A2(add_60_n23), .ZN(add_60_n21) );
  AOI21_X1 add_60_U76 ( .B1(add_60_n40), .B2(add_60_n23), .A(add_60_n26), .ZN(
        add_60_n22) );
  OAI21_X1 add_60_U75 ( .B1(add_60_n21), .B2(add_60_n43), .A(add_60_n22), .ZN(
        add_60_n20) );
  INV_X1 add_60_U74 ( .A(add_60_n44), .ZN(add_60_n43) );
  AND2_X1 add_60_U73 ( .A1(add_60_n86), .A2(add_60_n48), .ZN(u[0]) );
  AND2_X1 add_60_U72 ( .A1(add_60_n49), .A2(add_60_n10), .ZN(add_60_n87) );
  XNOR2_X1 add_60_U71 ( .A(add_60_n11), .B(add_60_n87), .ZN(u[6]) );
  NOR2_X1 add_60_U70 ( .A1(din_del[2]), .A2(t_mula1_del_vec[2]), .ZN(
        add_60_n37) );
  OR2_X1 add_60_U69 ( .A1(din_del[0]), .A2(t_mula1_del_vec[0]), .ZN(add_60_n86) );
  NOR2_X1 add_96_U124 ( .A1(t_mulb0_del_vec[2]), .A2(sum1_del_vec[2]), .ZN(
        add_96_n42) );
  NAND2_X1 add_96_U123 ( .A1(t_mulb0_del_vec[2]), .A2(sum1_del_vec[2]), .ZN(
        add_96_n43) );
  OR2_X1 add_96_U122 ( .A1(t_mulb0_del_vec[0]), .A2(sum1_del_vec[0]), .ZN(
        add_96_n87) );
  NAND2_X1 add_96_U121 ( .A1(t_mulb0_del_vec[5]), .A2(sum1_del_vec[5]), .ZN(
        add_96_n22) );
  NAND2_X1 add_96_U120 ( .A1(t_mulb0_del_vec[3]), .A2(sum1_del_vec[3]), .ZN(
        add_96_n38) );
  NAND2_X1 add_96_U119 ( .A1(t_mulb0_del_vec[0]), .A2(sum1_del_vec[0]), .ZN(
        add_96_n48) );
  NAND2_X1 add_96_U118 ( .A1(t_mulb0_del_vec[4]), .A2(sum1_del_vec[4]), .ZN(
        add_96_n29) );
  INV_X1 add_96_U117 ( .A(t_mulb0_del_vec[6]), .ZN(add_96_n57) );
  INV_X1 add_96_U116 ( .A(sum1_del_vec[6]), .ZN(add_96_n56) );
  NOR2_X1 add_96_U115 ( .A1(t_mulb0_del_vec[5]), .A2(sum1_del_vec[5]), .ZN(
        add_96_n21) );
  NOR2_X1 add_96_U114 ( .A1(t_mulb0_del_vec[3]), .A2(sum1_del_vec[3]), .ZN(
        add_96_n37) );
  NOR2_X1 add_96_U113 ( .A1(t_mulb0_del_vec[4]), .A2(sum1_del_vec[4]), .ZN(
        add_96_n26) );
  NAND2_X1 add_96_U112 ( .A1(add_96_n53), .A2(add_96_n43), .ZN(add_96_n6) );
  XNOR2_X1 add_96_U111 ( .A(add_96_n1), .B(add_96_n6), .ZN(y[2]) );
  NAND2_X1 add_96_U110 ( .A1(add_96_n54), .A2(add_96_n46), .ZN(add_96_n7) );
  XOR2_X1 add_96_U109 ( .A(add_96_n7), .B(add_96_n48), .Z(y[1]) );
  NOR2_X1 add_96_U108 ( .A1(add_96_n17), .A2(add_96_n12), .ZN(add_96_n10) );
  AOI21_X1 add_96_U107 ( .B1(add_96_n1), .B2(add_96_n10), .A(add_96_n11), .ZN(
        y[7]) );
  NAND2_X1 add_96_U106 ( .A1(add_96_n49), .A2(add_96_n13), .ZN(add_96_n2) );
  XOR2_X1 add_96_U105 ( .A(add_96_n14), .B(add_96_n2), .Z(y[6]) );
  NAND2_X1 add_96_U104 ( .A1(add_96_n50), .A2(add_96_n22), .ZN(add_96_n3) );
  XOR2_X1 add_96_U103 ( .A(add_96_n23), .B(add_96_n3), .Z(y[5]) );
  NAND2_X1 add_96_U102 ( .A1(add_96_n51), .A2(add_96_n29), .ZN(add_96_n4) );
  XOR2_X1 add_96_U101 ( .A(add_96_n30), .B(add_96_n4), .Z(y[4]) );
  NAND2_X1 add_96_U100 ( .A1(add_96_n52), .A2(add_96_n38), .ZN(add_96_n5) );
  XOR2_X1 add_96_U99 ( .A(add_96_n39), .B(add_96_n5), .Z(y[3]) );
  NAND2_X1 add_96_U98 ( .A1(t_mulb0_del_vec[1]), .A2(sum1_del_vec[1]), .ZN(
        add_96_n46) );
  NOR2_X1 add_96_U97 ( .A1(t_mulb0_del_vec[1]), .A2(sum1_del_vec[1]), .ZN(
        add_96_n45) );
  INV_X1 add_96_U96 ( .A(add_96_n21), .ZN(add_96_n50) );
  INV_X1 add_96_U95 ( .A(add_96_n37), .ZN(add_96_n52) );
  INV_X1 add_96_U94 ( .A(add_96_n26), .ZN(add_96_n51) );
  NAND2_X1 add_96_U93 ( .A1(add_96_n57), .A2(add_96_n56), .ZN(add_96_n13) );
  INV_X1 add_96_U92 ( .A(add_96_n42), .ZN(add_96_n53) );
  NOR2_X1 add_96_U91 ( .A1(add_96_n26), .A2(add_96_n21), .ZN(add_96_n19) );
  OAI21_X1 add_96_U90 ( .B1(add_96_n21), .B2(add_96_n29), .A(add_96_n22), .ZN(
        add_96_n20) );
  AOI21_X1 add_96_U89 ( .B1(add_96_n19), .B2(add_96_n32), .A(add_96_n20), .ZN(
        add_96_n18) );
  NOR2_X1 add_96_U88 ( .A1(add_96_n42), .A2(add_96_n37), .ZN(add_96_n31) );
  NOR2_X1 add_96_U87 ( .A1(add_96_n57), .A2(add_96_n56), .ZN(add_96_n12) );
  OAI21_X1 add_96_U86 ( .B1(add_96_n37), .B2(add_96_n43), .A(add_96_n38), .ZN(
        add_96_n32) );
  INV_X1 add_96_U85 ( .A(add_96_n45), .ZN(add_96_n54) );
  INV_X1 add_96_U84 ( .A(add_96_n31), .ZN(add_96_n33) );
  OAI21_X1 add_96_U83 ( .B1(add_96_n34), .B2(add_96_n26), .A(add_96_n29), .ZN(
        add_96_n25) );
  NOR2_X1 add_96_U82 ( .A1(add_96_n33), .A2(add_96_n26), .ZN(add_96_n24) );
  AOI21_X1 add_96_U81 ( .B1(add_96_n1), .B2(add_96_n24), .A(add_96_n25), .ZN(
        add_96_n23) );
  INV_X1 add_96_U80 ( .A(add_96_n43), .ZN(add_96_n41) );
  AOI21_X1 add_96_U79 ( .B1(add_96_n1), .B2(add_96_n53), .A(add_96_n41), .ZN(
        add_96_n39) );
  OAI21_X1 add_96_U78 ( .B1(add_96_n45), .B2(add_96_n48), .A(add_96_n46), .ZN(
        add_96_n1) );
  INV_X1 add_96_U77 ( .A(add_96_n12), .ZN(add_96_n49) );
  NAND2_X1 add_96_U76 ( .A1(add_96_n31), .A2(add_96_n19), .ZN(add_96_n17) );
  INV_X1 add_96_U75 ( .A(add_96_n32), .ZN(add_96_n34) );
  OAI21_X1 add_96_U74 ( .B1(add_96_n18), .B2(add_96_n12), .A(add_96_n13), .ZN(
        add_96_n11) );
  INV_X1 add_96_U73 ( .A(add_96_n17), .ZN(add_96_n15) );
  INV_X1 add_96_U72 ( .A(add_96_n18), .ZN(add_96_n16) );
  AOI21_X1 add_96_U71 ( .B1(add_96_n1), .B2(add_96_n15), .A(add_96_n16), .ZN(
        add_96_n14) );
  AOI21_X1 add_96_U70 ( .B1(add_96_n1), .B2(add_96_n31), .A(add_96_n32), .ZN(
        add_96_n30) );
  AND2_X1 add_96_U69 ( .A1(add_96_n87), .A2(add_96_n48), .ZN(y[0]) );
  OAI21_X1 mult_78_U384 ( .B1(mult_78_n1), .B2(mult_78_n26), .A(mult_78_n27), 
        .ZN(mult_78_n25) );
  OAI21_X1 mult_78_U383 ( .B1(mult_78_n259), .B2(mult_78_n19), .A(mult_78_n20), 
        .ZN(mult_78_n18) );
  OAI21_X1 mult_78_U382 ( .B1(mult_78_n1), .B2(mult_78_n260), .A(mult_78_n13), 
        .ZN(mult_78_n11) );
  XNOR2_X1 mult_78_U381 ( .A(u_del_vec[6]), .B(b1[6]), .ZN(mult_78_n179) );
  XNOR2_X1 mult_78_U380 ( .A(mult_78_n264), .B(b1[10]), .ZN(mult_78_n161) );
  XNOR2_X1 mult_78_U379 ( .A(mult_78_n264), .B(b1[8]), .ZN(mult_78_n170) );
  OAI22_X1 mult_78_U378 ( .A1(mult_78_n179), .A2(mult_78_n202), .B1(
        mult_78_n178), .B2(mult_78_n222), .ZN(mult_78_n145) );
  XNOR2_X1 mult_78_U377 ( .A(mult_78_n264), .B(b1[11]), .ZN(mult_78_n152) );
  OAI22_X1 mult_78_U376 ( .A1(mult_78_n179), .A2(mult_78_n222), .B1(
        mult_78_n202), .B2(mult_78_n180), .ZN(mult_78_n146) );
  XNOR2_X1 mult_78_U375 ( .A(mult_78_n18), .B(mult_78_n3), .ZN(mulb1[11]) );
  XNOR2_X1 mult_78_U374 ( .A(mult_78_n266), .B(b1[8]), .ZN(mult_78_n176) );
  OAI22_X1 mult_78_U373 ( .A1(mult_78_n176), .A2(mult_78_n201), .B1(
        mult_78_n205), .B2(mult_78_n175), .ZN(mult_78_n142) );
  XNOR2_X1 mult_78_U372 ( .A(mult_78_n266), .B(b1[10]), .ZN(mult_78_n167) );
  OR2_X1 mult_78_U371 ( .A1(mult_78_n266), .A2(mult_78_n210), .ZN(mult_78_n186) );
  XNOR2_X1 mult_78_U370 ( .A(mult_78_n266), .B(b1[6]), .ZN(mult_78_n185) );
  OR2_X1 mult_78_U369 ( .A1(mult_78_n266), .A2(mult_78_n209), .ZN(mult_78_n177) );
  OR2_X1 mult_78_U368 ( .A1(mult_78_n266), .A2(mult_78_n208), .ZN(mult_78_n168) );
  AND2_X1 mult_78_U367 ( .A1(mult_78_n266), .A2(mult_78_n110), .ZN(
        mult_78_n134) );
  AND2_X1 mult_78_U366 ( .A1(mult_78_n266), .A2(mult_78_n113), .ZN(
        mult_78_n143) );
  OR2_X1 mult_78_U365 ( .A1(mult_78_n266), .A2(mult_78_n207), .ZN(mult_78_n159) );
  AND2_X1 mult_78_U364 ( .A1(mult_78_n266), .A2(mult_78_n107), .ZN(
        mult_78_n126) );
  XNOR2_X1 mult_78_U363 ( .A(mult_78_n25), .B(mult_78_n4), .ZN(mulb1[10]) );
  XNOR2_X1 mult_78_U362 ( .A(mult_78_n11), .B(mult_78_n2), .ZN(mulb1[12]) );
  AOI21_X1 mult_78_U361 ( .B1(mult_78_n265), .B2(mult_78_n56), .A(mult_78_n253), .ZN(mult_78_n51) );
  OAI21_X1 mult_78_U360 ( .B1(mult_78_n51), .B2(mult_78_n49), .A(mult_78_n50), 
        .ZN(mult_78_n48) );
  AOI21_X1 mult_78_U359 ( .B1(mult_78_n29), .B2(mult_78_n261), .A(mult_78_n22), 
        .ZN(mult_78_n20) );
  NOR2_X1 mult_78_U358 ( .A1(mult_78_n78), .A2(mult_78_n83), .ZN(mult_78_n26)
         );
  NAND2_X1 mult_78_U357 ( .A1(mult_78_n78), .A2(mult_78_n83), .ZN(mult_78_n27)
         );
  OAI21_X1 mult_78_U356 ( .B1(mult_78_n20), .B2(mult_78_n16), .A(mult_78_n17), 
        .ZN(mult_78_n15) );
  CLKBUF_X3 mult_78_U355 ( .A(u_del_vec[0]), .Z(mult_78_n266) );
  NOR2_X1 mult_78_U354 ( .A1(mult_78_n84), .A2(mult_78_n89), .ZN(mult_78_n34)
         );
  OAI21_X1 mult_78_U353 ( .B1(mult_78_n38), .B2(mult_78_n34), .A(mult_78_n35), 
        .ZN(mult_78_n33) );
  NOR2_X1 mult_78_U352 ( .A1(mult_78_n37), .A2(mult_78_n254), .ZN(mult_78_n32)
         );
  INV_X1 mult_78_U351 ( .A(mult_78_n254), .ZN(mult_78_n64) );
  OAI22_X1 mult_78_U350 ( .A1(mult_78_n167), .A2(mult_78_n200), .B1(
        mult_78_n204), .B2(mult_78_n166), .ZN(mult_78_n133) );
  INV_X1 mult_78_U349 ( .A(mult_78_n40), .ZN(mult_78_n39) );
  OAI21_X1 mult_78_U348 ( .B1(mult_78_n39), .B2(mult_78_n256), .A(mult_78_n257), .ZN(mult_78_n36) );
  XNOR2_X1 mult_78_U347 ( .A(mult_78_n36), .B(mult_78_n6), .ZN(mulb1[8]) );
  INV_X1 mult_78_U346 ( .A(mult_78_n26), .ZN(mult_78_n63) );
  NAND2_X1 mult_78_U345 ( .A1(mult_78_n261), .A2(mult_78_n24), .ZN(mult_78_n4)
         );
  NAND2_X1 mult_78_U344 ( .A1(mult_78_n63), .A2(mult_78_n261), .ZN(mult_78_n19) );
  OR2_X1 mult_78_U343 ( .A1(mult_78_n106), .A2(mult_78_n119), .ZN(mult_78_n265) );
  NAND2_X1 mult_78_U342 ( .A1(mult_78_n90), .A2(mult_78_n95), .ZN(mult_78_n38)
         );
  NOR2_X1 mult_78_U341 ( .A1(mult_78_n90), .A2(mult_78_n95), .ZN(mult_78_n37)
         );
  OAI22_X1 mult_78_U340 ( .A1(mult_78_n185), .A2(mult_78_n202), .B1(
        mult_78_n184), .B2(mult_78_n222), .ZN(mult_78_n151) );
  OAI22_X1 mult_78_U339 ( .A1(mult_78_n177), .A2(mult_78_n205), .B1(
        mult_78_n201), .B2(mult_78_n209), .ZN(mult_78_n119) );
  NOR2_X1 mult_78_U338 ( .A1(mult_78_n143), .A2(mult_78_n150), .ZN(mult_78_n57) );
  NAND2_X1 mult_78_U337 ( .A1(mult_78_n143), .A2(mult_78_n150), .ZN(
        mult_78_n58) );
  CLKBUF_X1 mult_78_U336 ( .A(u_del_vec[6]), .Z(mult_78_n264) );
  INV_X1 mult_78_U335 ( .A(mult_78_n37), .ZN(mult_78_n65) );
  NAND2_X1 mult_78_U334 ( .A1(mult_78_n84), .A2(mult_78_n89), .ZN(mult_78_n35)
         );
  OAI22_X1 mult_78_U333 ( .A1(mult_78_n161), .A2(mult_78_n200), .B1(
        mult_78_n204), .B2(mult_78_n160), .ZN(mult_78_n128) );
  OAI22_X1 mult_78_U332 ( .A1(mult_78_n161), .A2(mult_78_n204), .B1(
        mult_78_n200), .B2(mult_78_n162), .ZN(mult_78_n129) );
  INV_X1 mult_78_U331 ( .A(mult_78_n27), .ZN(mult_78_n29) );
  OAI21_X1 mult_78_U330 ( .B1(mult_78_n43), .B2(mult_78_n41), .A(mult_78_n42), 
        .ZN(mult_78_n40) );
  INV_X1 mult_78_U329 ( .A(b1[10]), .ZN(mult_78_n208) );
  INV_X1 mult_78_U328 ( .A(b1[6]), .ZN(mult_78_n210) );
  XOR2_X1 mult_78_U327 ( .A(b1[5]), .B(b1[6]), .Z(mult_78_n198) );
  NAND2_X1 mult_78_U326 ( .A1(mult_78_n198), .A2(mult_78_n222), .ZN(
        mult_78_n202) );
  INV_X1 mult_78_U325 ( .A(b1[5]), .ZN(mult_78_n222) );
  XNOR2_X1 mult_78_U324 ( .A(b1[11]), .B(u_del_vec[5]), .ZN(mult_78_n153) );
  NOR2_X1 mult_78_U323 ( .A1(mult_78_n203), .A2(mult_78_n153), .ZN(mult_78_n71) );
  XOR2_X1 mult_78_U322 ( .A(b1[9]), .B(b1[10]), .Z(mult_78_n196) );
  NAND2_X1 mult_78_U321 ( .A1(mult_78_n196), .A2(mult_78_n204), .ZN(
        mult_78_n200) );
  XOR2_X1 mult_78_U320 ( .A(b1[7]), .B(b1[8]), .Z(mult_78_n197) );
  NAND2_X1 mult_78_U319 ( .A1(mult_78_n197), .A2(mult_78_n205), .ZN(
        mult_78_n201) );
  XNOR2_X1 mult_78_U318 ( .A(b1[11]), .B(u_del_vec[2]), .ZN(mult_78_n156) );
  NOR2_X1 mult_78_U317 ( .A1(mult_78_n203), .A2(mult_78_n156), .ZN(
        mult_78_n124) );
  XNOR2_X1 mult_78_U316 ( .A(b1[11]), .B(u_del_vec[3]), .ZN(mult_78_n155) );
  XNOR2_X1 mult_78_U315 ( .A(b1[10]), .B(u_del_vec[7]), .ZN(mult_78_n160) );
  XNOR2_X1 mult_78_U314 ( .A(b1[6]), .B(u_del_vec[7]), .ZN(mult_78_n178) );
  XNOR2_X1 mult_78_U313 ( .A(b1[11]), .B(u_del_vec[4]), .ZN(mult_78_n154) );
  XNOR2_X1 mult_78_U312 ( .A(b1[6]), .B(u_del_vec[5]), .ZN(mult_78_n180) );
  XNOR2_X1 mult_78_U311 ( .A(b1[10]), .B(u_del_vec[5]), .ZN(mult_78_n162) );
  XNOR2_X1 mult_78_U310 ( .A(b1[6]), .B(u_del_vec[1]), .ZN(mult_78_n184) );
  XNOR2_X1 mult_78_U309 ( .A(b1[10]), .B(u_del_vec[1]), .ZN(mult_78_n166) );
  XNOR2_X1 mult_78_U308 ( .A(b1[8]), .B(u_del_vec[1]), .ZN(mult_78_n175) );
  XNOR2_X1 mult_78_U307 ( .A(b1[8]), .B(u_del_vec[7]), .ZN(mult_78_n169) );
  XNOR2_X1 mult_78_U306 ( .A(b1[6]), .B(u_del_vec[3]), .ZN(mult_78_n182) );
  XNOR2_X1 mult_78_U305 ( .A(b1[8]), .B(u_del_vec[5]), .ZN(mult_78_n171) );
  XNOR2_X1 mult_78_U304 ( .A(b1[8]), .B(u_del_vec[3]), .ZN(mult_78_n173) );
  XNOR2_X1 mult_78_U303 ( .A(b1[10]), .B(u_del_vec[3]), .ZN(mult_78_n164) );
  XNOR2_X1 mult_78_U302 ( .A(b1[6]), .B(u_del_vec[4]), .ZN(mult_78_n181) );
  XNOR2_X1 mult_78_U301 ( .A(b1[6]), .B(u_del_vec[2]), .ZN(mult_78_n183) );
  XNOR2_X1 mult_78_U300 ( .A(b1[8]), .B(u_del_vec[2]), .ZN(mult_78_n174) );
  XNOR2_X1 mult_78_U299 ( .A(b1[10]), .B(u_del_vec[4]), .ZN(mult_78_n163) );
  XNOR2_X1 mult_78_U298 ( .A(b1[10]), .B(u_del_vec[2]), .ZN(mult_78_n165) );
  XNOR2_X1 mult_78_U297 ( .A(b1[8]), .B(u_del_vec[4]), .ZN(mult_78_n172) );
  INV_X1 mult_78_U296 ( .A(b1[8]), .ZN(mult_78_n209) );
  NAND2_X1 mult_78_U295 ( .A1(mult_78_n64), .A2(mult_78_n35), .ZN(mult_78_n6)
         );
  INV_X1 mult_78_U294 ( .A(b1[11]), .ZN(mult_78_n207) );
  NOR2_X1 mult_78_U293 ( .A1(mult_78_n159), .A2(mult_78_n203), .ZN(
        mult_78_n117) );
  NAND2_X1 mult_78_U292 ( .A1(mult_78_n262), .A2(mult_78_n10), .ZN(mult_78_n2)
         );
  OAI22_X1 mult_78_U291 ( .A1(mult_78_n202), .A2(mult_78_n183), .B1(
        mult_78_n182), .B2(mult_78_n222), .ZN(mult_78_n149) );
  XNOR2_X1 mult_78_U290 ( .A(b1[11]), .B(u_del_vec[1]), .ZN(mult_78_n157) );
  NOR2_X1 mult_78_U289 ( .A1(mult_78_n203), .A2(mult_78_n157), .ZN(
        mult_78_n125) );
  OAI22_X1 mult_78_U288 ( .A1(mult_78_n202), .A2(mult_78_n181), .B1(
        mult_78_n180), .B2(mult_78_n222), .ZN(mult_78_n147) );
  OAI22_X1 mult_78_U287 ( .A1(mult_78_n201), .A2(mult_78_n174), .B1(
        mult_78_n205), .B2(mult_78_n173), .ZN(mult_78_n140) );
  OAI22_X1 mult_78_U286 ( .A1(mult_78_n201), .A2(mult_78_n172), .B1(
        mult_78_n205), .B2(mult_78_n171), .ZN(mult_78_n138) );
  OAI22_X1 mult_78_U285 ( .A1(mult_78_n200), .A2(mult_78_n165), .B1(
        mult_78_n204), .B2(mult_78_n164), .ZN(mult_78_n131) );
  OAI22_X1 mult_78_U284 ( .A1(mult_78_n169), .A2(mult_78_n201), .B1(
        mult_78_n169), .B2(mult_78_n205), .ZN(mult_78_n112) );
  NOR2_X1 mult_78_U283 ( .A1(mult_78_n203), .A2(mult_78_n154), .ZN(
        mult_78_n122) );
  INV_X1 mult_78_U282 ( .A(mult_78_n112), .ZN(mult_78_n135) );
  OAI22_X1 mult_78_U281 ( .A1(mult_78_n200), .A2(mult_78_n166), .B1(
        mult_78_n204), .B2(mult_78_n165), .ZN(mult_78_n132) );
  OAI22_X1 mult_78_U280 ( .A1(mult_78_n201), .A2(mult_78_n173), .B1(
        mult_78_n205), .B2(mult_78_n172), .ZN(mult_78_n139) );
  NOR2_X1 mult_78_U279 ( .A1(mult_78_n203), .A2(mult_78_n155), .ZN(
        mult_78_n123) );
  INV_X1 mult_78_U278 ( .A(mult_78_n81), .ZN(mult_78_n82) );
  OR2_X1 mult_78_U277 ( .A1(mult_78_n130), .A2(mult_78_n124), .ZN(mult_78_n87)
         );
  OAI22_X1 mult_78_U276 ( .A1(mult_78_n178), .A2(mult_78_n202), .B1(
        mult_78_n178), .B2(mult_78_n222), .ZN(mult_78_n115) );
  XNOR2_X1 mult_78_U275 ( .A(mult_78_n130), .B(mult_78_n124), .ZN(mult_78_n88)
         );
  INV_X1 mult_78_U274 ( .A(mult_78_n115), .ZN(mult_78_n144) );
  INV_X1 mult_78_U273 ( .A(mult_78_n204), .ZN(mult_78_n110) );
  OAI22_X1 mult_78_U272 ( .A1(mult_78_n202), .A2(mult_78_n184), .B1(
        mult_78_n183), .B2(mult_78_n222), .ZN(mult_78_n150) );
  OAI22_X1 mult_78_U271 ( .A1(mult_78_n160), .A2(mult_78_n200), .B1(
        mult_78_n160), .B2(mult_78_n204), .ZN(mult_78_n109) );
  OAI22_X1 mult_78_U270 ( .A1(mult_78_n200), .A2(mult_78_n163), .B1(
        mult_78_n204), .B2(mult_78_n162), .ZN(mult_78_n81) );
  OAI22_X1 mult_78_U269 ( .A1(mult_78_n200), .A2(mult_78_n164), .B1(
        mult_78_n204), .B2(mult_78_n163), .ZN(mult_78_n130) );
  NAND2_X1 mult_78_U268 ( .A1(mult_78_n104), .A2(mult_78_n242), .ZN(
        mult_78_n50) );
  OAI22_X1 mult_78_U267 ( .A1(mult_78_n186), .A2(mult_78_n222), .B1(
        mult_78_n202), .B2(mult_78_n210), .ZN(mult_78_n120) );
  NAND2_X1 mult_78_U266 ( .A1(mult_78_n120), .A2(mult_78_n151), .ZN(
        mult_78_n59) );
  NOR2_X1 mult_78_U265 ( .A1(mult_78_n104), .A2(mult_78_n242), .ZN(mult_78_n49) );
  INV_X1 mult_78_U264 ( .A(mult_78_n205), .ZN(mult_78_n113) );
  OAI22_X1 mult_78_U263 ( .A1(mult_78_n170), .A2(mult_78_n205), .B1(
        mult_78_n201), .B2(mult_78_n171), .ZN(mult_78_n137) );
  OAI21_X1 mult_78_U262 ( .B1(mult_78_n59), .B2(mult_78_n57), .A(mult_78_n58), 
        .ZN(mult_78_n56) );
  OAI22_X1 mult_78_U261 ( .A1(mult_78_n170), .A2(mult_78_n201), .B1(
        mult_78_n205), .B2(mult_78_n169), .ZN(mult_78_n136) );
  OAI22_X1 mult_78_U260 ( .A1(mult_78_n168), .A2(mult_78_n204), .B1(
        mult_78_n200), .B2(mult_78_n208), .ZN(mult_78_n118) );
  INV_X1 mult_78_U259 ( .A(mult_78_n71), .ZN(mult_78_n72) );
  INV_X1 mult_78_U258 ( .A(mult_78_n203), .ZN(mult_78_n107) );
  OAI22_X1 mult_78_U257 ( .A1(mult_78_n201), .A2(mult_78_n175), .B1(
        mult_78_n205), .B2(mult_78_n174), .ZN(mult_78_n141) );
  OAI22_X1 mult_78_U256 ( .A1(mult_78_n202), .A2(mult_78_n182), .B1(
        mult_78_n181), .B2(mult_78_n222), .ZN(mult_78_n148) );
  XNOR2_X1 mult_78_U255 ( .A(mult_78_n127), .B(mult_78_n121), .ZN(mult_78_n263) );
  NAND2_X1 mult_78_U254 ( .A1(mult_78_n74), .A2(mult_78_n77), .ZN(mult_78_n24)
         );
  OR2_X1 mult_78_U253 ( .A1(mult_78_n69), .A2(mult_78_n68), .ZN(mult_78_n262)
         );
  NAND2_X1 mult_78_U252 ( .A1(mult_78_n70), .A2(mult_78_n73), .ZN(mult_78_n17)
         );
  NAND2_X1 mult_78_U251 ( .A1(mult_78_n96), .A2(mult_78_n99), .ZN(mult_78_n42)
         );
  NAND2_X1 mult_78_U250 ( .A1(mult_78_n69), .A2(mult_78_n68), .ZN(mult_78_n10)
         );
  NOR2_X1 mult_78_U249 ( .A1(mult_78_n96), .A2(mult_78_n99), .ZN(mult_78_n41)
         );
  OR2_X1 mult_78_U248 ( .A1(mult_78_n74), .A2(mult_78_n77), .ZN(mult_78_n261)
         );
  NOR2_X1 mult_78_U247 ( .A1(mult_78_n70), .A2(mult_78_n73), .ZN(mult_78_n16)
         );
  INV_X1 mult_78_U246 ( .A(mult_78_n16), .ZN(mult_78_n61) );
  NAND2_X1 mult_78_U245 ( .A1(mult_78_n61), .A2(mult_78_n17), .ZN(mult_78_n3)
         );
  INV_X1 mult_78_U244 ( .A(mult_78_n41), .ZN(mult_78_n66) );
  OR2_X1 mult_78_U243 ( .A1(mult_78_n19), .A2(mult_78_n16), .ZN(mult_78_n260)
         );
  INV_X1 mult_78_U242 ( .A(mult_78_n24), .ZN(mult_78_n22) );
  AOI21_X1 mult_78_U241 ( .B1(mult_78_n40), .B2(mult_78_n32), .A(mult_78_n33), 
        .ZN(mult_78_n1) );
  AOI21_X1 mult_78_U240 ( .B1(mult_78_n32), .B2(mult_78_n40), .A(mult_78_n33), 
        .ZN(mult_78_n259) );
  XNOR2_X1 mult_78_U239 ( .A(mult_78_n71), .B(mult_78_n263), .ZN(mult_78_n68)
         );
  INV_X1 mult_78_U238 ( .A(mult_78_n15), .ZN(mult_78_n13) );
  AOI21_X1 mult_78_U237 ( .B1(mult_78_n48), .B2(mult_78_n243), .A(mult_78_n245), .ZN(mult_78_n43) );
  AOI21_X1 mult_78_U236 ( .B1(mult_78_n255), .B2(mult_78_n243), .A(
        mult_78_n245), .ZN(mult_78_n258) );
  CLKBUF_X1 mult_78_U235 ( .A(mult_78_n38), .Z(mult_78_n257) );
  INV_X1 mult_78_U234 ( .A(mult_78_n65), .ZN(mult_78_n256) );
  CLKBUF_X1 mult_78_U233 ( .A(mult_78_n48), .Z(mult_78_n255) );
  NOR2_X1 mult_78_U232 ( .A1(mult_78_n84), .A2(mult_78_n89), .ZN(mult_78_n254)
         );
  AND2_X1 mult_78_U231 ( .A1(mult_78_n106), .A2(mult_78_n119), .ZN(
        mult_78_n253) );
  CLKBUF_X1 mult_78_U230 ( .A(mult_78_n142), .Z(mult_78_n252) );
  XOR2_X1 mult_78_U229 ( .A(mult_78_n142), .B(mult_78_n149), .Z(mult_78_n106)
         );
  NAND3_X1 mult_78_U228 ( .A1(mult_78_n249), .A2(mult_78_n250), .A3(
        mult_78_n251), .ZN(mult_78_n89) );
  NAND2_X1 mult_78_U227 ( .A1(mult_78_n117), .A2(mult_78_n97), .ZN(
        mult_78_n251) );
  NAND2_X1 mult_78_U226 ( .A1(mult_78_n92), .A2(mult_78_n97), .ZN(mult_78_n250) );
  NAND2_X1 mult_78_U225 ( .A1(mult_78_n92), .A2(mult_78_n117), .ZN(
        mult_78_n249) );
  XOR2_X1 mult_78_U224 ( .A(mult_78_n92), .B(mult_78_n248), .Z(mult_78_n90) );
  XOR2_X1 mult_78_U223 ( .A(mult_78_n117), .B(mult_78_n97), .Z(mult_78_n248)
         );
  AND2_X1 mult_78_U222 ( .A1(mult_78_n63), .A2(mult_78_n27), .ZN(mult_78_n247)
         );
  XNOR2_X1 mult_78_U221 ( .A(mult_78_n259), .B(mult_78_n247), .ZN(mulb1[9]) );
  AND2_X1 mult_78_U220 ( .A1(mult_78_n65), .A2(mult_78_n38), .ZN(mult_78_n246)
         );
  XNOR2_X1 mult_78_U219 ( .A(mult_78_n39), .B(mult_78_n246), .ZN(mulb1[7]) );
  AND2_X1 mult_78_U218 ( .A1(mult_78_n100), .A2(mult_78_n103), .ZN(
        mult_78_n245) );
  AND2_X1 mult_78_U217 ( .A1(mult_78_n66), .A2(mult_78_n42), .ZN(mult_78_n244)
         );
  XNOR2_X1 mult_78_U216 ( .A(mult_78_n258), .B(mult_78_n244), .ZN(mulb1[6]) );
  OR2_X1 mult_78_U215 ( .A1(mult_78_n100), .A2(mult_78_n103), .ZN(mult_78_n243) );
  AND2_X1 mult_78_U214 ( .A1(mult_78_n252), .A2(mult_78_n149), .ZN(
        mult_78_n242) );
  NOR2_X1 mult_78_U213 ( .A1(mult_78_n152), .A2(mult_78_n203), .ZN(
        mult_78_n121) );
  INV_X1 mult_78_U212 ( .A(mult_78_n109), .ZN(mult_78_n127) );
  XNOR2_X1 mult_78_U211 ( .A(b1[9]), .B(b1[8]), .ZN(mult_78_n204) );
  XNOR2_X1 mult_78_U210 ( .A(b1[11]), .B(b1[10]), .ZN(mult_78_n203) );
  XNOR2_X1 mult_78_U209 ( .A(b1[7]), .B(b1[6]), .ZN(mult_78_n205) );
  FA_X1 mult_78_U94 ( .A(mult_78_n141), .B(mult_78_n148), .CI(mult_78_n134), 
        .CO(mult_78_n103), .S(mult_78_n104) );
  HA_X1 mult_78_U93 ( .A(mult_78_n140), .B(mult_78_n147), .CO(mult_78_n101), 
        .S(mult_78_n102) );
  FA_X1 mult_78_U92 ( .A(mult_78_n118), .B(mult_78_n102), .CI(mult_78_n133), 
        .CO(mult_78_n99), .S(mult_78_n100) );
  FA_X1 mult_78_U91 ( .A(mult_78_n132), .B(mult_78_n139), .CI(mult_78_n101), 
        .CO(mult_78_n97), .S(mult_78_n98) );
  FA_X1 mult_78_U90 ( .A(mult_78_n146), .B(mult_78_n126), .CI(mult_78_n98), 
        .CO(mult_78_n95), .S(mult_78_n96) );
  HA_X1 mult_78_U89 ( .A(mult_78_n131), .B(mult_78_n138), .CO(mult_78_n93), 
        .S(mult_78_n94) );
  FA_X1 mult_78_U88 ( .A(mult_78_n125), .B(mult_78_n94), .CI(mult_78_n145), 
        .CO(mult_78_n91), .S(mult_78_n92) );
  FA_X1 mult_78_U84 ( .A(mult_78_n93), .B(mult_78_n144), .CI(mult_78_n88), 
        .CO(mult_78_n85), .S(mult_78_n86) );
  FA_X1 mult_78_U83 ( .A(mult_78_n91), .B(mult_78_n137), .CI(mult_78_n86), 
        .CO(mult_78_n83), .S(mult_78_n84) );
  FA_X1 mult_78_U81 ( .A(mult_78_n82), .B(mult_78_n123), .CI(mult_78_n87), 
        .CO(mult_78_n79), .S(mult_78_n80) );
  FA_X1 mult_78_U80 ( .A(mult_78_n85), .B(mult_78_n136), .CI(mult_78_n80), 
        .CO(mult_78_n77), .S(mult_78_n78) );
  FA_X1 mult_78_U79 ( .A(mult_78_n122), .B(mult_78_n81), .CI(mult_78_n135), 
        .CO(mult_78_n75), .S(mult_78_n76) );
  FA_X1 mult_78_U78 ( .A(mult_78_n79), .B(mult_78_n129), .CI(mult_78_n76), 
        .CO(mult_78_n73), .S(mult_78_n74) );
  FA_X1 mult_78_U76 ( .A(mult_78_n128), .B(mult_78_n72), .CI(mult_78_n75), 
        .CO(mult_78_n69), .S(mult_78_n70) );
  OAI21_X1 mult_73_U377 ( .B1(mult_73_n1), .B2(mult_73_n26), .A(mult_73_n27), 
        .ZN(mult_73_n25) );
  OAI21_X1 mult_73_U376 ( .B1(mult_73_n1), .B2(mult_73_n19), .A(mult_73_n20), 
        .ZN(mult_73_n18) );
  OAI21_X1 mult_73_U375 ( .B1(mult_73_n258), .B2(mult_73_n244), .A(mult_73_n13), .ZN(mult_73_n11) );
  XNOR2_X1 mult_73_U374 ( .A(u_del_vec[6]), .B(b0[6]), .ZN(mult_73_n179) );
  XNOR2_X1 mult_73_U373 ( .A(mult_73_n253), .B(b0[10]), .ZN(mult_73_n161) );
  XNOR2_X1 mult_73_U372 ( .A(mult_73_n253), .B(b0[8]), .ZN(mult_73_n170) );
  XNOR2_X1 mult_73_U371 ( .A(mult_73_n253), .B(b0[11]), .ZN(mult_73_n152) );
  XNOR2_X1 mult_73_U370 ( .A(mult_73_n260), .B(b0[8]), .ZN(mult_73_n176) );
  XNOR2_X1 mult_73_U369 ( .A(mult_73_n260), .B(b0[10]), .ZN(mult_73_n167) );
  OR2_X1 mult_73_U368 ( .A1(mult_73_n260), .A2(mult_73_n208), .ZN(mult_73_n168) );
  OR2_X1 mult_73_U367 ( .A1(mult_73_n260), .A2(mult_73_n210), .ZN(mult_73_n186) );
  XNOR2_X1 mult_73_U366 ( .A(mult_73_n260), .B(b0[6]), .ZN(mult_73_n185) );
  AND2_X1 mult_73_U365 ( .A1(mult_73_n260), .A2(mult_73_n110), .ZN(
        mult_73_n134) );
  OR2_X1 mult_73_U364 ( .A1(mult_73_n260), .A2(mult_73_n209), .ZN(mult_73_n177) );
  AND2_X1 mult_73_U363 ( .A1(mult_73_n260), .A2(mult_73_n113), .ZN(
        mult_73_n143) );
  OR2_X1 mult_73_U362 ( .A1(mult_73_n260), .A2(mult_73_n207), .ZN(mult_73_n159) );
  AND2_X1 mult_73_U361 ( .A1(mult_73_n260), .A2(mult_73_n107), .ZN(
        mult_73_n126) );
  OAI21_X1 mult_73_U360 ( .B1(mult_73_n20), .B2(mult_73_n16), .A(mult_73_n17), 
        .ZN(mult_73_n15) );
  OAI21_X1 mult_73_U359 ( .B1(mult_73_n34), .B2(mult_73_n38), .A(mult_73_n35), 
        .ZN(mult_73_n33) );
  NOR2_X1 mult_73_U358 ( .A1(mult_73_n78), .A2(mult_73_n83), .ZN(mult_73_n26)
         );
  INV_X1 mult_73_U357 ( .A(mult_73_n26), .ZN(mult_73_n63) );
  XNOR2_X1 mult_73_U356 ( .A(mult_73_n11), .B(mult_73_n2), .ZN(mulb0[12]) );
  OAI21_X1 mult_73_U355 ( .B1(mult_73_n43), .B2(mult_73_n41), .A(mult_73_n42), 
        .ZN(mult_73_n40) );
  OAI22_X1 mult_73_U354 ( .A1(mult_73_n176), .A2(mult_73_n201), .B1(
        mult_73_n205), .B2(mult_73_n175), .ZN(mult_73_n142) );
  NOR2_X1 mult_73_U353 ( .A1(mult_73_n37), .A2(mult_73_n34), .ZN(mult_73_n32)
         );
  INV_X1 mult_73_U352 ( .A(mult_73_n37), .ZN(mult_73_n65) );
  OAI21_X1 mult_73_U351 ( .B1(mult_73_n39), .B2(mult_73_n37), .A(mult_73_n38), 
        .ZN(mult_73_n36) );
  INV_X1 mult_73_U350 ( .A(mult_73_n40), .ZN(mult_73_n39) );
  NAND2_X1 mult_73_U349 ( .A1(mult_73_n63), .A2(mult_73_n254), .ZN(mult_73_n19) );
  OAI22_X1 mult_73_U348 ( .A1(mult_73_n179), .A2(mult_73_n202), .B1(
        mult_73_n178), .B2(mult_73_n222), .ZN(mult_73_n145) );
  OAI22_X1 mult_73_U347 ( .A1(mult_73_n179), .A2(mult_73_n222), .B1(
        mult_73_n202), .B2(mult_73_n180), .ZN(mult_73_n146) );
  OAI21_X1 mult_73_U346 ( .B1(mult_73_n51), .B2(mult_73_n49), .A(mult_73_n50), 
        .ZN(mult_73_n48) );
  AOI21_X1 mult_73_U345 ( .B1(mult_73_n259), .B2(mult_73_n56), .A(mult_73_n251), .ZN(mult_73_n51) );
  NAND2_X1 mult_73_U344 ( .A1(mult_73_n90), .A2(mult_73_n95), .ZN(mult_73_n38)
         );
  OAI22_X1 mult_73_U343 ( .A1(mult_73_n167), .A2(mult_73_n200), .B1(
        mult_73_n204), .B2(mult_73_n166), .ZN(mult_73_n133) );
  XNOR2_X1 mult_73_U342 ( .A(mult_73_n18), .B(mult_73_n3), .ZN(mulb0[11]) );
  XNOR2_X1 mult_73_U341 ( .A(mult_73_n25), .B(mult_73_n4), .ZN(mulb0[10]) );
  INV_X1 mult_73_U340 ( .A(mult_73_n34), .ZN(mult_73_n64) );
  OR2_X1 mult_73_U339 ( .A1(mult_73_n106), .A2(mult_73_n119), .ZN(mult_73_n259) );
  OAI22_X1 mult_73_U338 ( .A1(mult_73_n168), .A2(mult_73_n204), .B1(
        mult_73_n200), .B2(mult_73_n208), .ZN(mult_73_n118) );
  OAI22_X1 mult_73_U337 ( .A1(mult_73_n185), .A2(mult_73_n202), .B1(
        mult_73_n184), .B2(mult_73_n222), .ZN(mult_73_n151) );
  OAI22_X1 mult_73_U336 ( .A1(mult_73_n177), .A2(mult_73_n205), .B1(
        mult_73_n201), .B2(mult_73_n209), .ZN(mult_73_n119) );
  NOR2_X1 mult_73_U335 ( .A1(mult_73_n143), .A2(mult_73_n150), .ZN(mult_73_n57) );
  NAND2_X1 mult_73_U334 ( .A1(mult_73_n143), .A2(mult_73_n150), .ZN(
        mult_73_n58) );
  AOI21_X1 mult_73_U333 ( .B1(mult_73_n40), .B2(mult_73_n32), .A(mult_73_n33), 
        .ZN(mult_73_n1) );
  AOI21_X1 mult_73_U332 ( .B1(mult_73_n40), .B2(mult_73_n32), .A(mult_73_n33), 
        .ZN(mult_73_n258) );
  INV_X1 mult_73_U331 ( .A(mult_73_n15), .ZN(mult_73_n13) );
  CLKBUF_X3 mult_73_U330 ( .A(u_del_vec[0]), .Z(mult_73_n260) );
  INV_X1 mult_73_U329 ( .A(b0[10]), .ZN(mult_73_n208) );
  INV_X1 mult_73_U328 ( .A(b0[6]), .ZN(mult_73_n210) );
  XOR2_X1 mult_73_U327 ( .A(b0[5]), .B(b0[6]), .Z(mult_73_n198) );
  NAND2_X1 mult_73_U326 ( .A1(mult_73_n198), .A2(mult_73_n222), .ZN(
        mult_73_n202) );
  INV_X1 mult_73_U325 ( .A(b0[5]), .ZN(mult_73_n222) );
  XNOR2_X1 mult_73_U324 ( .A(b0[11]), .B(u_del_vec[5]), .ZN(mult_73_n153) );
  NOR2_X1 mult_73_U323 ( .A1(mult_73_n203), .A2(mult_73_n153), .ZN(mult_73_n71) );
  XOR2_X1 mult_73_U322 ( .A(b0[7]), .B(b0[8]), .Z(mult_73_n197) );
  NAND2_X1 mult_73_U321 ( .A1(mult_73_n197), .A2(mult_73_n205), .ZN(
        mult_73_n201) );
  XOR2_X1 mult_73_U320 ( .A(b0[9]), .B(b0[10]), .Z(mult_73_n196) );
  NAND2_X1 mult_73_U319 ( .A1(mult_73_n196), .A2(mult_73_n204), .ZN(
        mult_73_n200) );
  XNOR2_X1 mult_73_U318 ( .A(b0[11]), .B(u_del_vec[2]), .ZN(mult_73_n156) );
  NOR2_X1 mult_73_U317 ( .A1(mult_73_n203), .A2(mult_73_n156), .ZN(
        mult_73_n124) );
  XNOR2_X1 mult_73_U316 ( .A(b0[11]), .B(u_del_vec[3]), .ZN(mult_73_n155) );
  XNOR2_X1 mult_73_U315 ( .A(b0[6]), .B(u_del_vec[7]), .ZN(mult_73_n178) );
  XNOR2_X1 mult_73_U314 ( .A(b0[11]), .B(u_del_vec[4]), .ZN(mult_73_n154) );
  XNOR2_X1 mult_73_U313 ( .A(b0[6]), .B(u_del_vec[5]), .ZN(mult_73_n180) );
  XNOR2_X1 mult_73_U312 ( .A(b0[6]), .B(u_del_vec[1]), .ZN(mult_73_n184) );
  XNOR2_X1 mult_73_U311 ( .A(b0[8]), .B(u_del_vec[1]), .ZN(mult_73_n175) );
  XNOR2_X1 mult_73_U310 ( .A(b0[10]), .B(u_del_vec[1]), .ZN(mult_73_n166) );
  XNOR2_X1 mult_73_U309 ( .A(b0[10]), .B(u_del_vec[7]), .ZN(mult_73_n160) );
  XNOR2_X1 mult_73_U308 ( .A(b0[8]), .B(u_del_vec[7]), .ZN(mult_73_n169) );
  XNOR2_X1 mult_73_U307 ( .A(b0[6]), .B(u_del_vec[3]), .ZN(mult_73_n182) );
  XNOR2_X1 mult_73_U306 ( .A(b0[10]), .B(u_del_vec[5]), .ZN(mult_73_n162) );
  XNOR2_X1 mult_73_U305 ( .A(b0[8]), .B(u_del_vec[5]), .ZN(mult_73_n171) );
  XNOR2_X1 mult_73_U304 ( .A(b0[8]), .B(u_del_vec[3]), .ZN(mult_73_n173) );
  XNOR2_X1 mult_73_U303 ( .A(b0[10]), .B(u_del_vec[3]), .ZN(mult_73_n164) );
  XNOR2_X1 mult_73_U302 ( .A(b0[6]), .B(u_del_vec[4]), .ZN(mult_73_n181) );
  XNOR2_X1 mult_73_U301 ( .A(b0[6]), .B(u_del_vec[2]), .ZN(mult_73_n183) );
  XNOR2_X1 mult_73_U300 ( .A(b0[8]), .B(u_del_vec[2]), .ZN(mult_73_n174) );
  XNOR2_X1 mult_73_U299 ( .A(b0[10]), .B(u_del_vec[4]), .ZN(mult_73_n163) );
  XNOR2_X1 mult_73_U298 ( .A(b0[10]), .B(u_del_vec[2]), .ZN(mult_73_n165) );
  XNOR2_X1 mult_73_U297 ( .A(b0[8]), .B(u_del_vec[4]), .ZN(mult_73_n172) );
  INV_X1 mult_73_U296 ( .A(b0[8]), .ZN(mult_73_n209) );
  AND2_X1 mult_73_U295 ( .A1(mult_73_n65), .A2(mult_73_n38), .ZN(mult_73_n257)
         );
  XNOR2_X1 mult_73_U294 ( .A(mult_73_n39), .B(mult_73_n257), .ZN(mulb0[7]) );
  NAND2_X1 mult_73_U293 ( .A1(mult_73_n64), .A2(mult_73_n35), .ZN(mult_73_n6)
         );
  XNOR2_X1 mult_73_U292 ( .A(mult_73_n36), .B(mult_73_n6), .ZN(mulb0[8]) );
  INV_X1 mult_73_U291 ( .A(b0[11]), .ZN(mult_73_n207) );
  NOR2_X1 mult_73_U290 ( .A1(mult_73_n159), .A2(mult_73_n203), .ZN(
        mult_73_n117) );
  NAND2_X1 mult_73_U289 ( .A1(mult_73_n254), .A2(mult_73_n24), .ZN(mult_73_n4)
         );
  NAND2_X1 mult_73_U288 ( .A1(mult_73_n61), .A2(mult_73_n17), .ZN(mult_73_n3)
         );
  NAND2_X1 mult_73_U287 ( .A1(mult_73_n255), .A2(mult_73_n10), .ZN(mult_73_n2)
         );
  OAI22_X1 mult_73_U286 ( .A1(mult_73_n202), .A2(mult_73_n183), .B1(
        mult_73_n182), .B2(mult_73_n222), .ZN(mult_73_n149) );
  XNOR2_X1 mult_73_U285 ( .A(b0[11]), .B(u_del_vec[1]), .ZN(mult_73_n157) );
  NOR2_X1 mult_73_U284 ( .A1(mult_73_n203), .A2(mult_73_n157), .ZN(
        mult_73_n125) );
  OAI22_X1 mult_73_U283 ( .A1(mult_73_n202), .A2(mult_73_n181), .B1(
        mult_73_n180), .B2(mult_73_n222), .ZN(mult_73_n147) );
  OAI22_X1 mult_73_U282 ( .A1(mult_73_n201), .A2(mult_73_n174), .B1(
        mult_73_n205), .B2(mult_73_n173), .ZN(mult_73_n140) );
  OAI22_X1 mult_73_U281 ( .A1(mult_73_n201), .A2(mult_73_n172), .B1(
        mult_73_n205), .B2(mult_73_n171), .ZN(mult_73_n138) );
  OAI22_X1 mult_73_U280 ( .A1(mult_73_n200), .A2(mult_73_n165), .B1(
        mult_73_n204), .B2(mult_73_n164), .ZN(mult_73_n131) );
  OAI22_X1 mult_73_U279 ( .A1(mult_73_n169), .A2(mult_73_n201), .B1(
        mult_73_n169), .B2(mult_73_n205), .ZN(mult_73_n112) );
  NOR2_X1 mult_73_U278 ( .A1(mult_73_n203), .A2(mult_73_n154), .ZN(
        mult_73_n122) );
  INV_X1 mult_73_U277 ( .A(mult_73_n112), .ZN(mult_73_n135) );
  NOR2_X1 mult_73_U276 ( .A1(mult_73_n203), .A2(mult_73_n155), .ZN(
        mult_73_n123) );
  INV_X1 mult_73_U275 ( .A(mult_73_n81), .ZN(mult_73_n82) );
  OR2_X1 mult_73_U274 ( .A1(mult_73_n130), .A2(mult_73_n124), .ZN(mult_73_n87)
         );
  OAI22_X1 mult_73_U273 ( .A1(mult_73_n200), .A2(mult_73_n166), .B1(
        mult_73_n204), .B2(mult_73_n165), .ZN(mult_73_n132) );
  OAI22_X1 mult_73_U272 ( .A1(mult_73_n201), .A2(mult_73_n173), .B1(
        mult_73_n205), .B2(mult_73_n172), .ZN(mult_73_n139) );
  OAI22_X1 mult_73_U271 ( .A1(mult_73_n178), .A2(mult_73_n202), .B1(
        mult_73_n178), .B2(mult_73_n222), .ZN(mult_73_n115) );
  XNOR2_X1 mult_73_U270 ( .A(mult_73_n130), .B(mult_73_n124), .ZN(mult_73_n88)
         );
  INV_X1 mult_73_U269 ( .A(mult_73_n115), .ZN(mult_73_n144) );
  INV_X1 mult_73_U268 ( .A(mult_73_n204), .ZN(mult_73_n110) );
  OAI22_X1 mult_73_U267 ( .A1(mult_73_n202), .A2(mult_73_n184), .B1(
        mult_73_n183), .B2(mult_73_n222), .ZN(mult_73_n150) );
  OAI22_X1 mult_73_U266 ( .A1(mult_73_n160), .A2(mult_73_n200), .B1(
        mult_73_n160), .B2(mult_73_n204), .ZN(mult_73_n109) );
  OAI22_X1 mult_73_U265 ( .A1(mult_73_n200), .A2(mult_73_n163), .B1(
        mult_73_n204), .B2(mult_73_n162), .ZN(mult_73_n81) );
  OAI22_X1 mult_73_U264 ( .A1(mult_73_n200), .A2(mult_73_n164), .B1(
        mult_73_n204), .B2(mult_73_n163), .ZN(mult_73_n130) );
  NAND2_X1 mult_73_U263 ( .A1(mult_73_n104), .A2(mult_73_n105), .ZN(
        mult_73_n50) );
  OAI22_X1 mult_73_U262 ( .A1(mult_73_n186), .A2(mult_73_n222), .B1(
        mult_73_n202), .B2(mult_73_n210), .ZN(mult_73_n120) );
  NAND2_X1 mult_73_U261 ( .A1(mult_73_n120), .A2(mult_73_n151), .ZN(
        mult_73_n59) );
  NAND2_X1 mult_73_U260 ( .A1(mult_73_n84), .A2(mult_73_n89), .ZN(mult_73_n35)
         );
  NOR2_X1 mult_73_U259 ( .A1(mult_73_n104), .A2(mult_73_n105), .ZN(mult_73_n49) );
  INV_X1 mult_73_U258 ( .A(mult_73_n205), .ZN(mult_73_n113) );
  OAI21_X1 mult_73_U257 ( .B1(mult_73_n59), .B2(mult_73_n57), .A(mult_73_n58), 
        .ZN(mult_73_n56) );
  OAI22_X1 mult_73_U256 ( .A1(mult_73_n170), .A2(mult_73_n205), .B1(
        mult_73_n201), .B2(mult_73_n171), .ZN(mult_73_n137) );
  OAI22_X1 mult_73_U255 ( .A1(mult_73_n170), .A2(mult_73_n201), .B1(
        mult_73_n205), .B2(mult_73_n169), .ZN(mult_73_n136) );
  OAI22_X1 mult_73_U254 ( .A1(mult_73_n161), .A2(mult_73_n200), .B1(
        mult_73_n204), .B2(mult_73_n160), .ZN(mult_73_n128) );
  INV_X1 mult_73_U253 ( .A(mult_73_n71), .ZN(mult_73_n72) );
  INV_X1 mult_73_U252 ( .A(mult_73_n203), .ZN(mult_73_n107) );
  OAI22_X1 mult_73_U251 ( .A1(mult_73_n161), .A2(mult_73_n204), .B1(
        mult_73_n200), .B2(mult_73_n162), .ZN(mult_73_n129) );
  OAI22_X1 mult_73_U250 ( .A1(mult_73_n201), .A2(mult_73_n175), .B1(
        mult_73_n205), .B2(mult_73_n174), .ZN(mult_73_n141) );
  OAI22_X1 mult_73_U249 ( .A1(mult_73_n202), .A2(mult_73_n182), .B1(
        mult_73_n181), .B2(mult_73_n222), .ZN(mult_73_n148) );
  XNOR2_X1 mult_73_U248 ( .A(mult_73_n127), .B(mult_73_n121), .ZN(mult_73_n256) );
  OR2_X1 mult_73_U247 ( .A1(mult_73_n69), .A2(mult_73_n68), .ZN(mult_73_n255)
         );
  NAND2_X1 mult_73_U246 ( .A1(mult_73_n78), .A2(mult_73_n83), .ZN(mult_73_n27)
         );
  NAND2_X1 mult_73_U245 ( .A1(mult_73_n70), .A2(mult_73_n73), .ZN(mult_73_n17)
         );
  NAND2_X1 mult_73_U244 ( .A1(mult_73_n96), .A2(mult_73_n99), .ZN(mult_73_n42)
         );
  NAND2_X1 mult_73_U243 ( .A1(mult_73_n74), .A2(mult_73_n77), .ZN(mult_73_n24)
         );
  NAND2_X1 mult_73_U242 ( .A1(mult_73_n69), .A2(mult_73_n68), .ZN(mult_73_n10)
         );
  NOR2_X1 mult_73_U241 ( .A1(mult_73_n96), .A2(mult_73_n99), .ZN(mult_73_n41)
         );
  OR2_X2 mult_73_U240 ( .A1(mult_73_n74), .A2(mult_73_n77), .ZN(mult_73_n254)
         );
  NOR2_X1 mult_73_U239 ( .A1(mult_73_n70), .A2(mult_73_n73), .ZN(mult_73_n16)
         );
  INV_X1 mult_73_U238 ( .A(mult_73_n41), .ZN(mult_73_n66) );
  INV_X1 mult_73_U237 ( .A(mult_73_n16), .ZN(mult_73_n61) );
  INV_X1 mult_73_U236 ( .A(mult_73_n27), .ZN(mult_73_n29) );
  INV_X1 mult_73_U235 ( .A(mult_73_n24), .ZN(mult_73_n22) );
  AOI21_X1 mult_73_U234 ( .B1(mult_73_n29), .B2(mult_73_n254), .A(mult_73_n22), 
        .ZN(mult_73_n20) );
  XNOR2_X1 mult_73_U233 ( .A(mult_73_n71), .B(mult_73_n256), .ZN(mult_73_n68)
         );
  CLKBUF_X1 mult_73_U232 ( .A(u_del_vec[6]), .Z(mult_73_n253) );
  NOR2_X2 mult_73_U231 ( .A1(mult_73_n84), .A2(mult_73_n89), .ZN(mult_73_n34)
         );
  AOI21_X1 mult_73_U230 ( .B1(mult_73_n48), .B2(mult_73_n242), .A(mult_73_n243), .ZN(mult_73_n43) );
  AOI21_X1 mult_73_U229 ( .B1(mult_73_n48), .B2(mult_73_n242), .A(mult_73_n243), .ZN(mult_73_n252) );
  AND2_X1 mult_73_U228 ( .A1(mult_73_n106), .A2(mult_73_n119), .ZN(
        mult_73_n251) );
  NOR2_X1 mult_73_U227 ( .A1(mult_73_n90), .A2(mult_73_n95), .ZN(mult_73_n37)
         );
  NAND3_X1 mult_73_U226 ( .A1(mult_73_n248), .A2(mult_73_n249), .A3(
        mult_73_n250), .ZN(mult_73_n89) );
  NAND2_X1 mult_73_U225 ( .A1(mult_73_n117), .A2(mult_73_n97), .ZN(
        mult_73_n250) );
  NAND2_X1 mult_73_U224 ( .A1(mult_73_n92), .A2(mult_73_n97), .ZN(mult_73_n249) );
  NAND2_X1 mult_73_U223 ( .A1(mult_73_n92), .A2(mult_73_n117), .ZN(
        mult_73_n248) );
  XOR2_X1 mult_73_U222 ( .A(mult_73_n92), .B(mult_73_n247), .Z(mult_73_n90) );
  XOR2_X1 mult_73_U221 ( .A(mult_73_n117), .B(mult_73_n97), .Z(mult_73_n247)
         );
  AND2_X1 mult_73_U220 ( .A1(mult_73_n63), .A2(mult_73_n27), .ZN(mult_73_n246)
         );
  XNOR2_X1 mult_73_U219 ( .A(mult_73_n258), .B(mult_73_n246), .ZN(mulb0[9]) );
  AND2_X1 mult_73_U218 ( .A1(mult_73_n66), .A2(mult_73_n42), .ZN(mult_73_n245)
         );
  XNOR2_X1 mult_73_U217 ( .A(mult_73_n252), .B(mult_73_n245), .ZN(mulb0[6]) );
  OR2_X1 mult_73_U216 ( .A1(mult_73_n19), .A2(mult_73_n16), .ZN(mult_73_n244)
         );
  AND2_X1 mult_73_U215 ( .A1(mult_73_n100), .A2(mult_73_n103), .ZN(
        mult_73_n243) );
  OR2_X1 mult_73_U214 ( .A1(mult_73_n100), .A2(mult_73_n103), .ZN(mult_73_n242) );
  NOR2_X1 mult_73_U213 ( .A1(mult_73_n152), .A2(mult_73_n203), .ZN(
        mult_73_n121) );
  INV_X1 mult_73_U212 ( .A(mult_73_n109), .ZN(mult_73_n127) );
  XNOR2_X1 mult_73_U211 ( .A(b0[7]), .B(b0[6]), .ZN(mult_73_n205) );
  XNOR2_X1 mult_73_U210 ( .A(b0[11]), .B(b0[10]), .ZN(mult_73_n203) );
  XNOR2_X1 mult_73_U209 ( .A(b0[9]), .B(b0[8]), .ZN(mult_73_n204) );
  HA_X1 mult_73_U95 ( .A(mult_73_n142), .B(mult_73_n149), .CO(mult_73_n105), 
        .S(mult_73_n106) );
  FA_X1 mult_73_U94 ( .A(mult_73_n141), .B(mult_73_n148), .CI(mult_73_n134), 
        .CO(mult_73_n103), .S(mult_73_n104) );
  HA_X1 mult_73_U93 ( .A(mult_73_n140), .B(mult_73_n147), .CO(mult_73_n101), 
        .S(mult_73_n102) );
  FA_X1 mult_73_U92 ( .A(mult_73_n102), .B(mult_73_n118), .CI(mult_73_n133), 
        .CO(mult_73_n99), .S(mult_73_n100) );
  FA_X1 mult_73_U91 ( .A(mult_73_n132), .B(mult_73_n139), .CI(mult_73_n101), 
        .CO(mult_73_n97), .S(mult_73_n98) );
  FA_X1 mult_73_U90 ( .A(mult_73_n146), .B(mult_73_n126), .CI(mult_73_n98), 
        .CO(mult_73_n95), .S(mult_73_n96) );
  HA_X1 mult_73_U89 ( .A(mult_73_n131), .B(mult_73_n138), .CO(mult_73_n93), 
        .S(mult_73_n94) );
  FA_X1 mult_73_U88 ( .A(mult_73_n125), .B(mult_73_n94), .CI(mult_73_n145), 
        .CO(mult_73_n91), .S(mult_73_n92) );
  FA_X1 mult_73_U84 ( .A(mult_73_n93), .B(mult_73_n144), .CI(mult_73_n88), 
        .CO(mult_73_n85), .S(mult_73_n86) );
  FA_X1 mult_73_U83 ( .A(mult_73_n86), .B(mult_73_n137), .CI(mult_73_n91), 
        .CO(mult_73_n83), .S(mult_73_n84) );
  FA_X1 mult_73_U81 ( .A(mult_73_n82), .B(mult_73_n123), .CI(mult_73_n87), 
        .CO(mult_73_n79), .S(mult_73_n80) );
  FA_X1 mult_73_U80 ( .A(mult_73_n85), .B(mult_73_n136), .CI(mult_73_n80), 
        .CO(mult_73_n77), .S(mult_73_n78) );
  FA_X1 mult_73_U79 ( .A(mult_73_n122), .B(mult_73_n81), .CI(mult_73_n135), 
        .CO(mult_73_n75), .S(mult_73_n76) );
  FA_X1 mult_73_U78 ( .A(mult_73_n79), .B(mult_73_n129), .CI(mult_73_n76), 
        .CO(mult_73_n73), .S(mult_73_n74) );
  FA_X1 mult_73_U76 ( .A(mult_73_n128), .B(mult_73_n72), .CI(mult_73_n75), 
        .CO(mult_73_n69), .S(mult_73_n70) );
  OAI21_X1 mult_68_U385 ( .B1(mult_68_n1), .B2(mult_68_n26), .A(mult_68_n27), 
        .ZN(mult_68_n25) );
  OAI21_X1 mult_68_U384 ( .B1(mult_68_n1), .B2(mult_68_n19), .A(mult_68_n20), 
        .ZN(mult_68_n18) );
  OAI21_X1 mult_68_U383 ( .B1(mult_68_n266), .B2(mult_68_n263), .A(mult_68_n13), .ZN(mult_68_n11) );
  XNOR2_X1 mult_68_U382 ( .A(u_del_vec[6]), .B(a1[6]), .ZN(mult_68_n179) );
  XNOR2_X1 mult_68_U381 ( .A(mult_68_n259), .B(a1[10]), .ZN(mult_68_n161) );
  XNOR2_X1 mult_68_U380 ( .A(mult_68_n259), .B(a1[8]), .ZN(mult_68_n170) );
  XNOR2_X1 mult_68_U379 ( .A(mult_68_n259), .B(a1[11]), .ZN(mult_68_n152) );
  XNOR2_X1 mult_68_U378 ( .A(mult_68_n25), .B(mult_68_n4), .ZN(mula1[10]) );
  OAI21_X1 mult_68_U377 ( .B1(mult_68_n255), .B2(mult_68_n41), .A(mult_68_n42), 
        .ZN(mult_68_n40) );
  XNOR2_X1 mult_68_U376 ( .A(mult_68_n270), .B(a1[8]), .ZN(mult_68_n176) );
  NAND2_X1 mult_68_U375 ( .A1(mult_68_n78), .A2(mult_68_n83), .ZN(mult_68_n27)
         );
  NOR2_X1 mult_68_U374 ( .A1(mult_68_n78), .A2(mult_68_n83), .ZN(mult_68_n26)
         );
  XNOR2_X1 mult_68_U373 ( .A(mult_68_n11), .B(mult_68_n2), .ZN(mula1[12]) );
  XNOR2_X1 mult_68_U372 ( .A(mult_68_n18), .B(mult_68_n3), .ZN(mula1[11]) );
  AOI21_X1 mult_68_U371 ( .B1(mult_68_n269), .B2(mult_68_n56), .A(mult_68_n268), .ZN(mult_68_n51) );
  OAI21_X1 mult_68_U370 ( .B1(mult_68_n51), .B2(mult_68_n49), .A(mult_68_n50), 
        .ZN(mult_68_n48) );
  INV_X1 mult_68_U369 ( .A(mult_68_n257), .ZN(mult_68_n39) );
  OAI21_X1 mult_68_U368 ( .B1(mult_68_n39), .B2(mult_68_n262), .A(mult_68_n38), 
        .ZN(mult_68_n36) );
  NAND2_X1 mult_68_U367 ( .A1(mult_68_n84), .A2(mult_68_n89), .ZN(mult_68_n35)
         );
  NOR2_X1 mult_68_U366 ( .A1(mult_68_n84), .A2(mult_68_n89), .ZN(mult_68_n34)
         );
  NOR2_X1 mult_68_U365 ( .A1(mult_68_n37), .A2(mult_68_n248), .ZN(mult_68_n32)
         );
  INV_X1 mult_68_U364 ( .A(mult_68_n27), .ZN(mult_68_n29) );
  AOI21_X1 mult_68_U363 ( .B1(mult_68_n29), .B2(mult_68_n264), .A(mult_68_n22), 
        .ZN(mult_68_n20) );
  OAI21_X1 mult_68_U362 ( .B1(mult_68_n20), .B2(mult_68_n16), .A(mult_68_n17), 
        .ZN(mult_68_n15) );
  NAND2_X1 mult_68_U361 ( .A1(mult_68_n90), .A2(mult_68_n95), .ZN(mult_68_n38)
         );
  INV_X1 mult_68_U360 ( .A(mult_68_n26), .ZN(mult_68_n63) );
  OAI22_X1 mult_68_U359 ( .A1(mult_68_n167), .A2(mult_68_n200), .B1(
        mult_68_n204), .B2(mult_68_n166), .ZN(mult_68_n133) );
  NAND2_X1 mult_68_U358 ( .A1(mult_68_n264), .A2(mult_68_n24), .ZN(mult_68_n4)
         );
  NAND2_X1 mult_68_U357 ( .A1(mult_68_n63), .A2(mult_68_n264), .ZN(mult_68_n19) );
  OAI22_X1 mult_68_U356 ( .A1(mult_68_n179), .A2(mult_68_n202), .B1(
        mult_68_n178), .B2(mult_68_n222), .ZN(mult_68_n145) );
  OAI22_X1 mult_68_U355 ( .A1(mult_68_n260), .A2(mult_68_n222), .B1(
        mult_68_n202), .B2(mult_68_n180), .ZN(mult_68_n146) );
  OR2_X1 mult_68_U354 ( .A1(mult_68_n106), .A2(mult_68_n119), .ZN(mult_68_n269) );
  AND2_X1 mult_68_U353 ( .A1(mult_68_n106), .A2(mult_68_n119), .ZN(
        mult_68_n268) );
  OR2_X1 mult_68_U352 ( .A1(mult_68_n84), .A2(mult_68_n89), .ZN(mult_68_n267)
         );
  NAND2_X1 mult_68_U351 ( .A1(mult_68_n143), .A2(mult_68_n150), .ZN(
        mult_68_n58) );
  OAI22_X1 mult_68_U350 ( .A1(mult_68_n177), .A2(mult_68_n205), .B1(
        mult_68_n201), .B2(mult_68_n209), .ZN(mult_68_n119) );
  OAI22_X1 mult_68_U349 ( .A1(mult_68_n168), .A2(mult_68_n204), .B1(
        mult_68_n200), .B2(mult_68_n208), .ZN(mult_68_n118) );
  OAI22_X1 mult_68_U348 ( .A1(mult_68_n185), .A2(mult_68_n202), .B1(
        mult_68_n184), .B2(mult_68_n222), .ZN(mult_68_n151) );
  OAI22_X1 mult_68_U347 ( .A1(mult_68_n176), .A2(mult_68_n201), .B1(
        mult_68_n205), .B2(mult_68_n175), .ZN(mult_68_n142) );
  AND2_X1 mult_68_U346 ( .A1(mult_68_n270), .A2(mult_68_n107), .ZN(
        mult_68_n126) );
  OR2_X1 mult_68_U345 ( .A1(mult_68_n270), .A2(mult_68_n207), .ZN(mult_68_n159) );
  AND2_X1 mult_68_U344 ( .A1(mult_68_n270), .A2(mult_68_n110), .ZN(
        mult_68_n134) );
  OR2_X1 mult_68_U343 ( .A1(mult_68_n270), .A2(mult_68_n209), .ZN(mult_68_n177) );
  OR2_X1 mult_68_U342 ( .A1(mult_68_n270), .A2(mult_68_n208), .ZN(mult_68_n168) );
  XNOR2_X1 mult_68_U341 ( .A(mult_68_n270), .B(a1[10]), .ZN(mult_68_n167) );
  XNOR2_X1 mult_68_U340 ( .A(mult_68_n270), .B(a1[6]), .ZN(mult_68_n185) );
  OR2_X1 mult_68_U339 ( .A1(mult_68_n270), .A2(mult_68_n210), .ZN(mult_68_n186) );
  AND2_X1 mult_68_U338 ( .A1(mult_68_n270), .A2(mult_68_n113), .ZN(
        mult_68_n143) );
  AOI21_X1 mult_68_U337 ( .B1(mult_68_n257), .B2(mult_68_n32), .A(mult_68_n33), 
        .ZN(mult_68_n1) );
  AOI21_X1 mult_68_U336 ( .B1(mult_68_n40), .B2(mult_68_n32), .A(mult_68_n33), 
        .ZN(mult_68_n266) );
  INV_X1 mult_68_U335 ( .A(a1[10]), .ZN(mult_68_n208) );
  INV_X1 mult_68_U334 ( .A(a1[6]), .ZN(mult_68_n210) );
  XOR2_X1 mult_68_U333 ( .A(a1[5]), .B(a1[6]), .Z(mult_68_n198) );
  NAND2_X1 mult_68_U332 ( .A1(mult_68_n198), .A2(mult_68_n222), .ZN(
        mult_68_n202) );
  INV_X1 mult_68_U331 ( .A(a1[5]), .ZN(mult_68_n222) );
  XNOR2_X1 mult_68_U330 ( .A(a1[11]), .B(u_del_vec[5]), .ZN(mult_68_n153) );
  NOR2_X1 mult_68_U329 ( .A1(mult_68_n203), .A2(mult_68_n153), .ZN(mult_68_n71) );
  XOR2_X1 mult_68_U328 ( .A(a1[7]), .B(a1[8]), .Z(mult_68_n197) );
  NAND2_X1 mult_68_U327 ( .A1(mult_68_n197), .A2(mult_68_n205), .ZN(
        mult_68_n201) );
  XOR2_X1 mult_68_U326 ( .A(a1[9]), .B(a1[10]), .Z(mult_68_n196) );
  NAND2_X1 mult_68_U325 ( .A1(mult_68_n196), .A2(mult_68_n204), .ZN(
        mult_68_n200) );
  XNOR2_X1 mult_68_U324 ( .A(a1[11]), .B(u_del_vec[2]), .ZN(mult_68_n156) );
  NOR2_X1 mult_68_U323 ( .A1(mult_68_n203), .A2(mult_68_n156), .ZN(
        mult_68_n124) );
  XNOR2_X1 mult_68_U322 ( .A(a1[11]), .B(u_del_vec[3]), .ZN(mult_68_n155) );
  XNOR2_X1 mult_68_U321 ( .A(a1[6]), .B(u_del_vec[7]), .ZN(mult_68_n178) );
  XNOR2_X1 mult_68_U320 ( .A(a1[11]), .B(u_del_vec[4]), .ZN(mult_68_n154) );
  XNOR2_X1 mult_68_U319 ( .A(a1[6]), .B(u_del_vec[5]), .ZN(mult_68_n180) );
  XNOR2_X1 mult_68_U318 ( .A(a1[6]), .B(u_del_vec[1]), .ZN(mult_68_n184) );
  XNOR2_X1 mult_68_U317 ( .A(a1[8]), .B(u_del_vec[1]), .ZN(mult_68_n175) );
  XNOR2_X1 mult_68_U316 ( .A(a1[10]), .B(u_del_vec[1]), .ZN(mult_68_n166) );
  XNOR2_X1 mult_68_U315 ( .A(a1[10]), .B(u_del_vec[7]), .ZN(mult_68_n160) );
  XNOR2_X1 mult_68_U314 ( .A(a1[8]), .B(u_del_vec[7]), .ZN(mult_68_n169) );
  XNOR2_X1 mult_68_U313 ( .A(a1[6]), .B(u_del_vec[3]), .ZN(mult_68_n182) );
  XNOR2_X1 mult_68_U312 ( .A(a1[10]), .B(u_del_vec[5]), .ZN(mult_68_n162) );
  XNOR2_X1 mult_68_U311 ( .A(a1[8]), .B(u_del_vec[5]), .ZN(mult_68_n171) );
  XNOR2_X1 mult_68_U310 ( .A(a1[10]), .B(u_del_vec[3]), .ZN(mult_68_n164) );
  XNOR2_X1 mult_68_U309 ( .A(a1[8]), .B(u_del_vec[3]), .ZN(mult_68_n173) );
  XNOR2_X1 mult_68_U308 ( .A(a1[6]), .B(u_del_vec[4]), .ZN(mult_68_n181) );
  XNOR2_X1 mult_68_U307 ( .A(a1[6]), .B(u_del_vec[2]), .ZN(mult_68_n183) );
  XNOR2_X1 mult_68_U306 ( .A(a1[8]), .B(u_del_vec[2]), .ZN(mult_68_n174) );
  XNOR2_X1 mult_68_U305 ( .A(a1[10]), .B(u_del_vec[4]), .ZN(mult_68_n163) );
  XNOR2_X1 mult_68_U304 ( .A(a1[8]), .B(u_del_vec[4]), .ZN(mult_68_n172) );
  XNOR2_X1 mult_68_U303 ( .A(a1[10]), .B(u_del_vec[2]), .ZN(mult_68_n165) );
  NAND2_X1 mult_68_U302 ( .A1(mult_68_n267), .A2(mult_68_n246), .ZN(mult_68_n6) );
  XNOR2_X1 mult_68_U301 ( .A(mult_68_n36), .B(mult_68_n6), .ZN(mula1[8]) );
  XNOR2_X1 mult_68_U300 ( .A(a1[11]), .B(u_del_vec[1]), .ZN(mult_68_n157) );
  NOR2_X1 mult_68_U299 ( .A1(mult_68_n203), .A2(mult_68_n157), .ZN(
        mult_68_n125) );
  INV_X1 mult_68_U298 ( .A(a1[11]), .ZN(mult_68_n207) );
  NOR2_X1 mult_68_U297 ( .A1(mult_68_n159), .A2(mult_68_n203), .ZN(
        mult_68_n117) );
  OAI22_X1 mult_68_U296 ( .A1(mult_68_n202), .A2(mult_68_n183), .B1(
        mult_68_n182), .B2(mult_68_n222), .ZN(mult_68_n149) );
  NAND2_X1 mult_68_U295 ( .A1(mult_68_n61), .A2(mult_68_n17), .ZN(mult_68_n3)
         );
  NAND2_X1 mult_68_U294 ( .A1(mult_68_n265), .A2(mult_68_n10), .ZN(mult_68_n2)
         );
  INV_X1 mult_68_U293 ( .A(a1[8]), .ZN(mult_68_n209) );
  OAI22_X1 mult_68_U292 ( .A1(mult_68_n202), .A2(mult_68_n181), .B1(
        mult_68_n180), .B2(mult_68_n222), .ZN(mult_68_n147) );
  OAI22_X1 mult_68_U291 ( .A1(mult_68_n201), .A2(mult_68_n174), .B1(
        mult_68_n205), .B2(mult_68_n173), .ZN(mult_68_n140) );
  OAI22_X1 mult_68_U290 ( .A1(mult_68_n201), .A2(mult_68_n172), .B1(
        mult_68_n205), .B2(mult_68_n171), .ZN(mult_68_n138) );
  OAI22_X1 mult_68_U289 ( .A1(mult_68_n200), .A2(mult_68_n165), .B1(
        mult_68_n204), .B2(mult_68_n164), .ZN(mult_68_n131) );
  OAI22_X1 mult_68_U288 ( .A1(mult_68_n169), .A2(mult_68_n201), .B1(
        mult_68_n169), .B2(mult_68_n205), .ZN(mult_68_n112) );
  NOR2_X1 mult_68_U287 ( .A1(mult_68_n203), .A2(mult_68_n154), .ZN(
        mult_68_n122) );
  INV_X1 mult_68_U286 ( .A(mult_68_n112), .ZN(mult_68_n135) );
  NOR2_X1 mult_68_U285 ( .A1(mult_68_n203), .A2(mult_68_n155), .ZN(
        mult_68_n123) );
  INV_X1 mult_68_U284 ( .A(mult_68_n81), .ZN(mult_68_n82) );
  OR2_X1 mult_68_U283 ( .A1(mult_68_n130), .A2(mult_68_n124), .ZN(mult_68_n87)
         );
  OAI22_X1 mult_68_U282 ( .A1(mult_68_n200), .A2(mult_68_n166), .B1(
        mult_68_n204), .B2(mult_68_n165), .ZN(mult_68_n132) );
  OAI22_X1 mult_68_U281 ( .A1(mult_68_n201), .A2(mult_68_n173), .B1(
        mult_68_n205), .B2(mult_68_n172), .ZN(mult_68_n139) );
  OAI22_X1 mult_68_U280 ( .A1(mult_68_n178), .A2(mult_68_n202), .B1(
        mult_68_n178), .B2(mult_68_n222), .ZN(mult_68_n115) );
  XNOR2_X1 mult_68_U279 ( .A(mult_68_n130), .B(mult_68_n124), .ZN(mult_68_n88)
         );
  INV_X1 mult_68_U278 ( .A(mult_68_n115), .ZN(mult_68_n144) );
  INV_X1 mult_68_U277 ( .A(mult_68_n204), .ZN(mult_68_n110) );
  OAI22_X1 mult_68_U276 ( .A1(mult_68_n202), .A2(mult_68_n184), .B1(
        mult_68_n183), .B2(mult_68_n222), .ZN(mult_68_n150) );
  OAI22_X1 mult_68_U275 ( .A1(mult_68_n160), .A2(mult_68_n200), .B1(
        mult_68_n160), .B2(mult_68_n204), .ZN(mult_68_n109) );
  OAI22_X1 mult_68_U274 ( .A1(mult_68_n200), .A2(mult_68_n163), .B1(
        mult_68_n204), .B2(mult_68_n162), .ZN(mult_68_n81) );
  OAI22_X1 mult_68_U273 ( .A1(mult_68_n200), .A2(mult_68_n164), .B1(
        mult_68_n204), .B2(mult_68_n163), .ZN(mult_68_n130) );
  OAI21_X1 mult_68_U272 ( .B1(mult_68_n59), .B2(mult_68_n57), .A(mult_68_n58), 
        .ZN(mult_68_n56) );
  NAND2_X1 mult_68_U271 ( .A1(mult_68_n104), .A2(mult_68_n243), .ZN(
        mult_68_n50) );
  OAI22_X1 mult_68_U270 ( .A1(mult_68_n186), .A2(mult_68_n222), .B1(
        mult_68_n202), .B2(mult_68_n210), .ZN(mult_68_n120) );
  NAND2_X1 mult_68_U269 ( .A1(mult_68_n120), .A2(mult_68_n151), .ZN(
        mult_68_n59) );
  NOR2_X1 mult_68_U268 ( .A1(mult_68_n104), .A2(mult_68_n243), .ZN(mult_68_n49) );
  INV_X1 mult_68_U267 ( .A(mult_68_n205), .ZN(mult_68_n113) );
  OAI22_X1 mult_68_U266 ( .A1(mult_68_n170), .A2(mult_68_n205), .B1(
        mult_68_n201), .B2(mult_68_n171), .ZN(mult_68_n137) );
  OAI22_X1 mult_68_U265 ( .A1(mult_68_n170), .A2(mult_68_n201), .B1(
        mult_68_n205), .B2(mult_68_n169), .ZN(mult_68_n136) );
  OAI22_X1 mult_68_U264 ( .A1(mult_68_n161), .A2(mult_68_n204), .B1(
        mult_68_n200), .B2(mult_68_n162), .ZN(mult_68_n129) );
  NOR2_X1 mult_68_U263 ( .A1(mult_68_n90), .A2(mult_68_n95), .ZN(mult_68_n37)
         );
  OAI22_X1 mult_68_U262 ( .A1(mult_68_n161), .A2(mult_68_n200), .B1(
        mult_68_n204), .B2(mult_68_n160), .ZN(mult_68_n128) );
  INV_X1 mult_68_U261 ( .A(mult_68_n71), .ZN(mult_68_n72) );
  INV_X1 mult_68_U260 ( .A(mult_68_n203), .ZN(mult_68_n107) );
  OAI22_X1 mult_68_U259 ( .A1(mult_68_n201), .A2(mult_68_n175), .B1(
        mult_68_n205), .B2(mult_68_n174), .ZN(mult_68_n141) );
  OAI22_X1 mult_68_U258 ( .A1(mult_68_n202), .A2(mult_68_n182), .B1(
        mult_68_n181), .B2(mult_68_n222), .ZN(mult_68_n148) );
  INV_X1 mult_68_U257 ( .A(mult_68_n37), .ZN(mult_68_n65) );
  NAND2_X1 mult_68_U256 ( .A1(mult_68_n74), .A2(mult_68_n77), .ZN(mult_68_n24)
         );
  NAND2_X1 mult_68_U255 ( .A1(mult_68_n70), .A2(mult_68_n73), .ZN(mult_68_n17)
         );
  NAND2_X1 mult_68_U254 ( .A1(mult_68_n96), .A2(mult_68_n99), .ZN(mult_68_n42)
         );
  NAND2_X1 mult_68_U253 ( .A1(mult_68_n69), .A2(mult_68_n68), .ZN(mult_68_n10)
         );
  OR2_X1 mult_68_U252 ( .A1(mult_68_n69), .A2(mult_68_n68), .ZN(mult_68_n265)
         );
  NOR2_X1 mult_68_U251 ( .A1(mult_68_n96), .A2(mult_68_n99), .ZN(mult_68_n41)
         );
  OR2_X1 mult_68_U250 ( .A1(mult_68_n74), .A2(mult_68_n77), .ZN(mult_68_n264)
         );
  NOR2_X1 mult_68_U249 ( .A1(mult_68_n70), .A2(mult_68_n73), .ZN(mult_68_n16)
         );
  NOR2_X1 mult_68_U248 ( .A1(mult_68_n143), .A2(mult_68_n150), .ZN(mult_68_n57) );
  INV_X1 mult_68_U247 ( .A(mult_68_n41), .ZN(mult_68_n66) );
  INV_X1 mult_68_U246 ( .A(mult_68_n16), .ZN(mult_68_n61) );
  OR2_X1 mult_68_U245 ( .A1(mult_68_n19), .A2(mult_68_n16), .ZN(mult_68_n263)
         );
  INV_X1 mult_68_U244 ( .A(mult_68_n24), .ZN(mult_68_n22) );
  INV_X1 mult_68_U243 ( .A(mult_68_n65), .ZN(mult_68_n262) );
  NOR2_X1 mult_68_U242 ( .A1(mult_68_n152), .A2(mult_68_n203), .ZN(
        mult_68_n261) );
  XNOR2_X1 mult_68_U241 ( .A(mult_68_n109), .B(mult_68_n261), .ZN(mult_68_n67)
         );
  INV_X1 mult_68_U240 ( .A(mult_68_n15), .ZN(mult_68_n13) );
  XNOR2_X1 mult_68_U239 ( .A(mult_68_n259), .B(a1[6]), .ZN(mult_68_n260) );
  CLKBUF_X3 mult_68_U238 ( .A(u_del_vec[0]), .Z(mult_68_n270) );
  OR2_X1 mult_68_U237 ( .A1(mult_68_n100), .A2(mult_68_n103), .ZN(mult_68_n258) );
  OAI21_X1 mult_68_U236 ( .B1(mult_68_n43), .B2(mult_68_n41), .A(mult_68_n42), 
        .ZN(mult_68_n257) );
  AOI21_X1 mult_68_U235 ( .B1(mult_68_n48), .B2(mult_68_n258), .A(mult_68_n242), .ZN(mult_68_n43) );
  AOI21_X1 mult_68_U234 ( .B1(mult_68_n254), .B2(mult_68_n258), .A(
        mult_68_n242), .ZN(mult_68_n256) );
  AOI21_X1 mult_68_U233 ( .B1(mult_68_n48), .B2(mult_68_n258), .A(mult_68_n242), .ZN(mult_68_n255) );
  OAI21_X1 mult_68_U232 ( .B1(mult_68_n34), .B2(mult_68_n38), .A(mult_68_n35), 
        .ZN(mult_68_n33) );
  CLKBUF_X1 mult_68_U231 ( .A(mult_68_n48), .Z(mult_68_n254) );
  NAND3_X1 mult_68_U230 ( .A1(mult_68_n251), .A2(mult_68_n252), .A3(
        mult_68_n253), .ZN(mult_68_n89) );
  NAND2_X1 mult_68_U229 ( .A1(mult_68_n117), .A2(mult_68_n97), .ZN(
        mult_68_n253) );
  NAND2_X1 mult_68_U228 ( .A1(mult_68_n92), .A2(mult_68_n97), .ZN(mult_68_n252) );
  NAND2_X1 mult_68_U227 ( .A1(mult_68_n92), .A2(mult_68_n117), .ZN(
        mult_68_n251) );
  XOR2_X1 mult_68_U226 ( .A(mult_68_n92), .B(mult_68_n250), .Z(mult_68_n90) );
  XOR2_X1 mult_68_U225 ( .A(mult_68_n117), .B(mult_68_n97), .Z(mult_68_n250)
         );
  CLKBUF_X1 mult_68_U224 ( .A(mult_68_n142), .Z(mult_68_n249) );
  XOR2_X1 mult_68_U223 ( .A(mult_68_n142), .B(mult_68_n149), .Z(mult_68_n106)
         );
  NOR2_X1 mult_68_U222 ( .A1(mult_68_n84), .A2(mult_68_n89), .ZN(mult_68_n248)
         );
  AND2_X1 mult_68_U221 ( .A1(mult_68_n63), .A2(mult_68_n27), .ZN(mult_68_n247)
         );
  XNOR2_X1 mult_68_U220 ( .A(mult_68_n266), .B(mult_68_n247), .ZN(mula1[9]) );
  BUF_X1 mult_68_U219 ( .A(mult_68_n35), .Z(mult_68_n246) );
  AND2_X1 mult_68_U218 ( .A1(mult_68_n65), .A2(mult_68_n38), .ZN(mult_68_n245)
         );
  XNOR2_X1 mult_68_U217 ( .A(mult_68_n39), .B(mult_68_n245), .ZN(mula1[7]) );
  AND2_X1 mult_68_U216 ( .A1(mult_68_n66), .A2(mult_68_n42), .ZN(mult_68_n244)
         );
  XNOR2_X1 mult_68_U215 ( .A(mult_68_n256), .B(mult_68_n244), .ZN(mula1[6]) );
  AND2_X1 mult_68_U214 ( .A1(mult_68_n249), .A2(mult_68_n149), .ZN(
        mult_68_n243) );
  AND2_X1 mult_68_U213 ( .A1(mult_68_n100), .A2(mult_68_n103), .ZN(
        mult_68_n242) );
  XNOR2_X1 mult_68_U212 ( .A(a1[9]), .B(a1[8]), .ZN(mult_68_n204) );
  XNOR2_X1 mult_68_U211 ( .A(a1[11]), .B(a1[10]), .ZN(mult_68_n203) );
  XNOR2_X1 mult_68_U210 ( .A(a1[7]), .B(a1[6]), .ZN(mult_68_n205) );
  BUF_X1 mult_68_U209 ( .A(u_del_vec[6]), .Z(mult_68_n259) );
  FA_X1 mult_68_U94 ( .A(mult_68_n141), .B(mult_68_n148), .CI(mult_68_n134), 
        .CO(mult_68_n103), .S(mult_68_n104) );
  HA_X1 mult_68_U93 ( .A(mult_68_n140), .B(mult_68_n147), .CO(mult_68_n101), 
        .S(mult_68_n102) );
  FA_X1 mult_68_U92 ( .A(mult_68_n118), .B(mult_68_n102), .CI(mult_68_n133), 
        .CO(mult_68_n99), .S(mult_68_n100) );
  FA_X1 mult_68_U91 ( .A(mult_68_n132), .B(mult_68_n139), .CI(mult_68_n101), 
        .CO(mult_68_n97), .S(mult_68_n98) );
  FA_X1 mult_68_U90 ( .A(mult_68_n146), .B(mult_68_n126), .CI(mult_68_n98), 
        .CO(mult_68_n95), .S(mult_68_n96) );
  HA_X1 mult_68_U89 ( .A(mult_68_n131), .B(mult_68_n138), .CO(mult_68_n93), 
        .S(mult_68_n94) );
  FA_X1 mult_68_U88 ( .A(mult_68_n125), .B(mult_68_n94), .CI(mult_68_n145), 
        .CO(mult_68_n91), .S(mult_68_n92) );
  FA_X1 mult_68_U84 ( .A(mult_68_n93), .B(mult_68_n144), .CI(mult_68_n88), 
        .CO(mult_68_n85), .S(mult_68_n86) );
  FA_X1 mult_68_U83 ( .A(mult_68_n86), .B(mult_68_n137), .CI(mult_68_n91), 
        .CO(mult_68_n83), .S(mult_68_n84) );
  FA_X1 mult_68_U81 ( .A(mult_68_n82), .B(mult_68_n123), .CI(mult_68_n87), 
        .CO(mult_68_n79), .S(mult_68_n80) );
  FA_X1 mult_68_U80 ( .A(mult_68_n85), .B(mult_68_n136), .CI(mult_68_n80), 
        .CO(mult_68_n77), .S(mult_68_n78) );
  FA_X1 mult_68_U79 ( .A(mult_68_n122), .B(mult_68_n81), .CI(mult_68_n135), 
        .CO(mult_68_n75), .S(mult_68_n76) );
  FA_X1 mult_68_U78 ( .A(mult_68_n79), .B(mult_68_n129), .CI(mult_68_n76), 
        .CO(mult_68_n73), .S(mult_68_n74) );
  FA_X1 mult_68_U76 ( .A(mult_68_n128), .B(mult_68_n72), .CI(mult_68_n75), 
        .CO(mult_68_n69), .S(mult_68_n70) );
  XOR2_X1 mult_68_U74 ( .A(mult_68_n71), .B(mult_68_n67), .Z(mult_68_n68) );
endmodule

