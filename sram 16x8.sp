*dedocer 4:16

.SUBCKT Inverter in out vdd vss
M1 vdd in out vdd MODP W=4U L=1U
M2 out in vss vss MODN W=4U L=1U
.ENDS Inverter


.SUBCKT Nand4 A B C D out vdd vss
M1 vdd A out vdd MODP W=4U L=1U
M2 vdd B out vdd MODP W=4U L=1U
M3 vdd D out vdd MODP W=4U L=1U
M4 vdd C out vdd MODP W=4U L=1U

M5 out A 1   vss MODN W=4U L=1U
M6 1   B 2   vss MODN W=4U L=1U
M7 2   C 3   vss MODN W=4U L=1U
M8 3   D vss vss MODN W=4U L=1U
.ENDS Nand4

.SUBCKT Nand3 A B C out vdd vss
M1 vdd A out vdd MODP W=4U L=1U
M2 vdd B out vdd MODP W=4U L=1U
M4 vdd C out vdd MODP W=4U L=1U

M5 out A 1   vss MODN W=4U L=1U
M6 1   B 2   vss MODN W=4U L=1U
M7 2   C vss vss MODN W=4U L=1U
.ENDS Nand3

.SUBCKT Nand2 A B out vdd vss
M1 vdd A out vdd MODP W=4U L=1U
M2 vdd B out vdd MODP W=4U L=1U

M5 out A 1   vss MODN W=4U L=1U
M6 1   B vss vss MODN W=4U L=1U
.ENDS Nand2

.SUBCKT And2 A B out vdd vss
AND A B Z vdd vss Nand2
INV Z out vdd vss Inverter
.ENDS And2





.SUBCKT DLatch D EN_Latch Q SUPPLY GROUND
Dinverted D    Dinv 				SUPPLY GROUND Inverter
NAND_1 	  D    EN_Latch S 			SUPPLY GROUND Nand2
NAND_2 	  Dinv EN_Latch R 			SUPPLY GROUND Nand2
NAND_3 	  S    Qbar 	Q 			SUPPLY GROUND Nand2
NAND_4 	  R    Q 		Qbar 		SUPPLY GROUND Nand2
.ENDS DLatch

.SUBCKT ENABLE_Latch CLK WRITE Row EN_Latch SUPPLY GROUND
EL_BAR	  CLK  WRITE 	Row 	Z 	SUPPLY GROUND Nand3
EL 		  Z    EN_Latch 			SUPPLY GROUND Inverter
.ENDS ENABLE_Latch


.subckt Nor16 A0 A1 A2 A3 A4 A5 A6 A7 A8 A9 A10 A11 A12 A13 A14 A15 out vdd vss
M1 vdd    A0 1 vdd MODP W=4U L=1U
M2 1      A1 2 vdd MODP W=4U L=1U
M4 2      A2 3 vdd MODP W=4U L=1U
M5 3      A3 4 vdd MODP W=4U L=1U
M6 4      A4 5 vdd MODP W=4U L=1U
M7 5      A5 6 vdd MODP W=4U L=1U
M8 6      A6 7 vdd MODP W=4U L=1U
M9 7      A7 8 vdd MODP W=4U L=1U
M10 8      A8 9 vdd MODP W=4U L=1U
M11 9      A9 10 vdd MODP W=4U L=1U
M12 10     A10 11 vdd MODP W=4U L=1U
M13 11     A11 12 vdd MODP W=4U L=1U
M14 12     A12 13 vdd MODP W=4U L=1U
M15 13     A13 14 vdd MODP W=4U L=1U
M16 14     A14 15 vdd MODP W=4U L=1U
M3  15     A15 out vdd MODP W=4U L=1U

M17 out A0 vss vss MODN W=4U L=1U
M18 out A1 vss vss MODN W=4U L=1U
M19 out A2 vss vss MODN W=4U L=1U
M20 out A3 vss vss MODN W=4U L=1U
M21 out A4 vss vss MODN W=4U L=1U
M22 out A5 vss vss MODN W=4U L=1U
M23 out A6 vss vss MODN W=4U L=1U
M24 out A7 vss vss MODN W=4U L=1U
M25 out A8 vss vss MODN W=4U L=1U
M26 out A9 vss vss MODN W=4U L=1U
M27 out A10 vss vss MODN W=4U L=1U
M28 out A11 vss vss MODN W=4U L=1U
M29 out A12 vss vss MODN W=4U L=1U
M30 out A13 vss vss MODN W=4U L=1U
M31 out A14 vss vss MODN W=4U L=1U
M32 out A15 vss vss MODN W=4U L=1U
.ends Nor16


A0invert A0 A0inv SUPPLY GROUND Inverter
A1invert A1 A1inv SUPPLY GROUND Inverter
A2invert A2 A2inv SUPPLY GROUND Inverter
A3invert A3 A3inv SUPPLY GROUND Inverter


*Decode Outputs
D0  A3inv A2inv A1inv A0inv Row0_low  SUPPLY GROUND Nand4
D1  A3inv A2inv A1inv A0	Row1_low  SUPPLY GROUND Nand4
D2  A3inv A2inv A1	  A0inv Row2_low  SUPPLY GROUND Nand4
D3  A3inv A2inv A1	  A0	Row3_low  SUPPLY GROUND Nand4
D4  A3inv A2	A1inv A0inv Row4_low  SUPPLY GROUND Nand4
D5  A3inv A2 	A1inv A0 	Row5_low  SUPPLY GROUND Nand4
D6  A3inv A2 	A1	  A0inv Row6_low  SUPPLY GROUND Nand4
D7  A3inv A2 	A1	  A0 	Row7_low  SUPPLY GROUND Nand4
D8  A3 	  A2inv A1inv A0inv Row8_low  SUPPLY GROUND Nand4
D9  A3    A2inv A1inv A0	Row9_low  SUPPLY GROUND Nand4
D10 A3	  A2inv A1	  A0inv Row10_low SUPPLY GROUND Nand4
D11 A3	  A2inv A1	  A0	Row11_low SUPPLY GROUND Nand4
D12 A3    A2  	A1inv A0inv Row12_low SUPPLY GROUND Nand4
D13 A3    A2  	A1inv A0	Row13_low SUPPLY GROUND Nand4
D14 A3    A2  	A1 	  A0inv Row14_low SUPPLY GROUND Nand4
D15 A3	  A2    A1 	  A0 	Row15_low SUPPLY GROUND Nand4


Row0invert  Row0_low  Row0_high  SUPPLY GROUND Inverter 
Row1invert  Row1_low  Row1_high  SUPPLY GROUND Inverter
Row2invert  Row2_low  Row2_high  SUPPLY GROUND Inverter
Row3invert  Row3_low  Row3_high  SUPPLY GROUND Inverter
Row4invert  Row4_low  Row4_high  SUPPLY GROUND Inverter
Row5invert  Row5_low  Row5_high  SUPPLY GROUND Inverter
Row6invert  Row6_low  Row6_high  SUPPLY GROUND Inverter
Row7invert  Row7_low  Row7_high  SUPPLY GROUND Inverter
Row8invert  Row8_low  Row8_high  SUPPLY GROUND Inverter
Row9invert  Row9_low  Row9_high  SUPPLY GROUND Inverter
Row10invert Row10_low Row10_high SUPPLY GROUND Inverter
Row11invert Row11_low Row11_high SUPPLY GROUND Inverter
Row12invert Row12_low Row12_high SUPPLY GROUND Inverter
Row13invert Row13_low Row13_high SUPPLY GROUND Inverter
Row14invert Row14_low Row14_high SUPPLY GROUND Inverter
Row15invert Row15_low Row15_high SUPPLY GROUND Inverter


D CLK WRITE Row Q SUPPLY GROUND
*ROW0
EL0  CLK WRITE Row0_high EN_Latch0 SUPPLY GROUND ENABLE_Latch
DL0_0 Din0 EN_Latch0 Dout0_0 SUPPLY GROUND DLatch
DL0_1 Din1 EN_Latch0 Dout0_1 SUPPLY GROUND DLatch
DL0_2 Din2 EN_Latch0 Dout0_2 SUPPLY GROUND DLatch
DL0_3 Din3 EN_Latch0 Dout0_3 SUPPLY GROUND DLatch
DL0_4 Din4 EN_Latch0 Dout0_4 SUPPLY GROUND DLatch
DL0_5 Din5 EN_Latch0 Dout0_5 SUPPLY GROUND DLatch
DL0_6 Din6 EN_Latch0 Dout0_6 SUPPLY GROUND DLatch
DL0_7 Din7 EN_Latch0 Dout0_7 SUPPLY GROUND DLatch
		   
*ROW1      
EL1  CLK WRITE Row1_high EN_Latch1 SUPPLY GROUND ENABLE_Latch
DL1_0 Din0 EN_Latch1 Dout1_0 SUPPLY GROUND DLatch
DL1_1 Din1 EN_Latch1 Dout1_1 SUPPLY GROUND DLatch
DL1_2 Din2 EN_Latch1 Dout1_2 SUPPLY GROUND DLatch
DL1_3 Din3 EN_Latch1 Dout1_3 SUPPLY GROUND DLatch
DL1_4 Din4 EN_Latch1 Dout1_4 SUPPLY GROUND DLatch
DL1_5 Din5 EN_Latch1 Dout1_5 SUPPLY GROUND DLatch
DL1_6 Din6 EN_Latch1 Dout1_6 SUPPLY GROUND DLatch
DL1_7 Din7 EN_Latch1 Dout1_7 SUPPLY GROUND DLatch
		   
*ROW2      
EL2  CLK WRITE Row2_high EN_Latch2 SUPPLY GROUND ENABLE_Latch
DL2_0 Din0 EN_Latch2 Dout2_0 SUPPLY GROUND DLatch
DL2_1 Din1 EN_Latch2 Dout2_1 SUPPLY GROUND DLatch
DL2_2 Din2 EN_Latch2 Dout2_2 SUPPLY GROUND DLatch
DL2_3 Din3 EN_Latch2 Dout2_3 SUPPLY GROUND DLatch
DL2_4 Din4 EN_Latch2 Dout2_4 SUPPLY GROUND DLatch
DL2_5 Din5 EN_Latch2 Dout2_5 SUPPLY GROUND DLatch
DL2_6 Din6 EN_Latch2 Dout2_6 SUPPLY GROUND DLatch
DL2_7 Din7 EN_Latch2 Dout2_7 SUPPLY GROUND DLatch
		   
*ROW3      
EL3  CLK WRITE Row3_high EN_Latch3 SUPPLY GROUND ENABLE_Latch
DL3_0 Din0 EN_Latch3 Dout3_0 SUPPLY GROUND DLatch
DL3_1 Din1 EN_Latch3 Dout3_1 SUPPLY GROUND DLatch
DL3_2 Din2 EN_Latch3 Dout3_2 SUPPLY GROUND DLatch
DL3_3 Din3 EN_Latch3 Dout3_3 SUPPLY GROUND DLatch
DL3_4 Din4 EN_Latch3 Dout3_4 SUPPLY GROUND DLatch
DL3_5 Din5 EN_Latch3 Dout3_5 SUPPLY GROUND DLatch
DL3_6 Din6 EN_Latch3 Dout3_6 SUPPLY GROUND DLatch
DL3_7 Din7 EN_Latch3 Dout3_7 SUPPLY GROUND DLatch
		   
*ROW4      
EL4  CLK WRITE Row4_high EN_Latch4 SUPPLY GROUND ENABLE_Latch
DL4_0 Din0 EN_Latch4 Dout4_0 SUPPLY GROUND DLatch
DL4_1 Din1 EN_Latch4 Dout4_1 SUPPLY GROUND DLatch
DL4_2 Din2 EN_Latch4 Dout4_2 SUPPLY GROUND DLatch
DL4_3 Din3 EN_Latch4 Dout4_3 SUPPLY GROUND DLatch
DL4_4 Din4 EN_Latch4 Dout4_4 SUPPLY GROUND DLatch
DL4_5 Din5 EN_Latch4 Dout4_5 SUPPLY GROUND DLatch
DL4_6 Din6 EN_Latch4 Dout4_6 SUPPLY GROUND DLatch
DL4_7 Din7 EN_Latch4 Dout4_7 SUPPLY GROUND DLatch


*ROW5
EL5  CLK WRITE Row5_high EN_Latch5 SUPPLY GROUND ENABLE_Latch
DL5_0 Din0 EN_Latch5 Dout5_0 SUPPLY GROUND DLatch
DL5_1 Din1 EN_Latch5 Dout5_1 SUPPLY GROUND DLatch
DL5_2 Din2 EN_Latch5 Dout5_2 SUPPLY GROUND DLatch
DL5_3 Din3 EN_Latch5 Dout5_3 SUPPLY GROUND DLatch
DL5_4 Din4 EN_Latch5 Dout5_4 SUPPLY GROUND DLatch
DL5_5 Din5 EN_Latch5 Dout5_5 SUPPLY GROUND DLatch
DL5_6 Din6 EN_Latch5 Dout5_6 SUPPLY GROUND DLatch
DL5_7 Din7 EN_Latch5 Dout5_7 SUPPLY GROUND DLatch

*ROW6
EL6  CLK WRITE Row6_high EN_Latch6 SUPPLY GROUND ENABLE_Latch
DL6_0 Din0 EN_Latch6 Dout6_0 SUPPLY GROUND DLatch
DL6_1 Din1 EN_Latch6 Dout6_1 SUPPLY GROUND DLatch
DL6_2 Din2 EN_Latch6 Dout6_2 SUPPLY GROUND DLatch
DL6_3 Din3 EN_Latch6 Dout6_3 SUPPLY GROUND DLatch
DL6_4 Din4 EN_Latch6 Dout6_4 SUPPLY GROUND DLatch
DL6_5 Din5 EN_Latch6 Dout6_5 SUPPLY GROUND DLatch
DL6_6 Din6 EN_Latch6 Dout6_6 SUPPLY GROUND DLatch
DL6_7 Din7 EN_Latch6 Dout6_7 SUPPLY GROUND DLatch

*ROW7
EL7  CLK WRITE Row7_high EN_Latch7 SUPPLY GROUND ENABLE_Latch
DL7_0 Din0 EN_Latch7 Dout7_0 SUPPLY GROUND DLatch
DL7_1 Din1 EN_Latch7 Dout7_1 SUPPLY GROUND DLatch
DL7_2 Din2 EN_Latch7 Dout7_2 SUPPLY GROUND DLatch
DL7_3 Din3 EN_Latch7 Dout7_3 SUPPLY GROUND DLatch
DL7_4 Din4 EN_Latch7 Dout7_4 SUPPLY GROUND DLatch
DL7_5 Din5 EN_Latch7 Dout7_5 SUPPLY GROUND DLatch
DL7_6 Din6 EN_Latch7 Dout7_6 SUPPLY GROUND DLatch
DL7_7 Din7 EN_Latch7 Dout7_7 SUPPLY GROUND DLatch

*ROW8
EL8  CLK WRITE Row8_high EN_Latch8 SUPPLY GROUND ENABLE_Latch
DL8_0 Din0 EN_Latch8 Dout8_0 SUPPLY GROUND DLatch
DL8_1 Din1 EN_Latch8 Dout8_1 SUPPLY GROUND DLatch
DL8_2 Din2 EN_Latch8 Dout8_2 SUPPLY GROUND DLatch
DL8_3 Din3 EN_Latch8 Dout8_3 SUPPLY GROUND DLatch
DL8_4 Din4 EN_Latch8 Dout8_4 SUPPLY GROUND DLatch
DL8_5 Din5 EN_Latch8 Dout8_5 SUPPLY GROUND DLatch
DL8_6 Din6 EN_Latch8 Dout8_6 SUPPLY GROUND DLatch
DL8_7 Din7 EN_Latch8 Dout8_7 SUPPLY GROUND DLatch

*ROW9
EL9  CLK WRITE Row9_high EN_Latch9 SUPPLY GROUND ENABLE_Latch
DL9_0 Din0 EN_Latch9 Dout9_0 SUPPLY GROUND DLatch
DL9_1 Din1 EN_Latch9 Dout9_1 SUPPLY GROUND DLatch
DL9_2 Din2 EN_Latch9 Dout9_2 SUPPLY GROUND DLatch
DL9_3 Din3 EN_Latch9 Dout9_3 SUPPLY GROUND DLatch
DL9_4 Din4 EN_Latch9 Dout9_4 SUPPLY GROUND DLatch
DL9_5 Din5 EN_Latch9 Dout9_5 SUPPLY GROUND DLatch
DL9_6 Din6 EN_Latch9 Dout9_6 SUPPLY GROUND DLatch
DL9_7 Din7 EN_Latch9 Dout9_7 SUPPLY GROUND DLatch

*ROW10
EL10  CLK WRITE Row10_high EN_Latch10 SUPPLY GROUND ENABLE_Latch
DL10_0 Din0 EN_Latch10 Dout10_0 SUPPLY GROUND DLatch
DL10_1 Din1 EN_Latch10 Dout10_1 SUPPLY GROUND DLatch
DL10_2 Din2 EN_Latch10 Dout10_2 SUPPLY GROUND DLatch
DL10_3 Din3 EN_Latch10 Dout10_3 SUPPLY GROUND DLatch
DL10_4 Din4 EN_Latch10 Dout10_4 SUPPLY GROUND DLatch
DL10_5 Din5 EN_Latch10 Dout10_5 SUPPLY GROUND DLatch
DL10_6 Din6 EN_Latch10 Dout10_6 SUPPLY GROUND DLatch
DL10_7 Din7 EN_Latch10 Dout10_7 SUPPLY GROUND DLatch

*ROW11
EL11  CLK WRITE Row11_high EN_Latch11 SUPPLY GROUND ENABLE_Latch
DL11_0 Din0 EN_Latch11 Dout11_0 SUPPLY GROUND DLatch
DL11_1 Din1 EN_Latch11 Dout11_1 SUPPLY GROUND DLatch
DL11_2 Din2 EN_Latch11 Dout11_2 SUPPLY GROUND DLatch
DL11_3 Din3 EN_Latch11 Dout11_3 SUPPLY GROUND DLatch
DL11_4 Din4 EN_Latch11 Dout11_4 SUPPLY GROUND DLatch
DL11_5 Din5 EN_Latch11 Dout11_5 SUPPLY GROUND DLatch
DL11_6 Din6 EN_Latch11 Dout11_6 SUPPLY GROUND DLatch
DL11_7 Din7 EN_Latch11 Dout11_7 SUPPLY GROUND DLatch

*ROW12
EL12  CLK WRITE Row12_high EN_Latch12 SUPPLY GROUND ENABLE_Latch
DL12_0 Din0 EN_Latch12 Dout12_0 SUPPLY GROUND DLatch
DL12_1 Din1 EN_Latch12 Dout12_1 SUPPLY GROUND DLatch
DL12_2 Din2 EN_Latch12 Dout12_2 SUPPLY GROUND DLatch
DL12_3 Din3 EN_Latch12 Dout12_3 SUPPLY GROUND DLatch
DL12_4 Din4 EN_Latch12 Dout12_4 SUPPLY GROUND DLatch
DL12_5 Din5 EN_Latch12 Dout12_5 SUPPLY GROUND DLatch
DL12_6 Din6 EN_Latch12 Dout12_6 SUPPLY GROUND DLatch
DL12_7 Din7 EN_Latch12 Dout12_7 SUPPLY GROUND DLatch

*ROW13
EL13  CLK WRITE Row13_high EN_Latch13 SUPPLY GROUND ENABLE_Latch
DL13_0 Din0 EN_Latch13 Dout13_0 SUPPLY GROUND DLatch
DL13_1 Din1 EN_Latch13 Dout13_1 SUPPLY GROUND DLatch
DL13_2 Din2 EN_Latch13 Dout13_2 SUPPLY GROUND DLatch
DL13_3 Din3 EN_Latch13 Dout13_3 SUPPLY GROUND DLatch
DL13_4 Din4 EN_Latch13 Dout13_4 SUPPLY GROUND DLatch
DL13_5 Din5 EN_Latch13 Dout13_5 SUPPLY GROUND DLatch
DL13_6 Din6 EN_Latch13 Dout13_6 SUPPLY GROUND DLatch
DL13_7 Din7 EN_Latch13 Dout13_7 SUPPLY GROUND DLatch

*ROW14
EL14  CLK WRITE Row14_high EN_Latch14 SUPPLY GROUND ENABLE_Latch
DL14_0 Din0 EN_Latch14 Dout14_0 SUPPLY GROUND DLatch
DL14_1 Din1 EN_Latch14 Dout14_1 SUPPLY GROUND DLatch
DL14_2 Din2 EN_Latch14 Dout14_2 SUPPLY GROUND DLatch
DL14_3 Din3 EN_Latch14 Dout14_3 SUPPLY GROUND DLatch
DL14_4 Din4 EN_Latch14 Dout14_4 SUPPLY GROUND DLatch
DL14_5 Din5 EN_Latch14 Dout14_5 SUPPLY GROUND DLatch
DL14_6 Din6 EN_Latch14 Dout14_6 SUPPLY GROUND DLatch
DL14_7 Din7 EN_Latch14 Dout14_7 SUPPLY GROUND DLatch

*ROW15
EL15  CLK WRITE Row15_high EN_Latch15 SUPPLY GROUND ENABLE_Latch
DL15_0 Din0 EN_Latch15 Dout15_0 SUPPLY GROUND DLatch
DL15_1 Din1 EN_Latch15 Dout15_1 SUPPLY GROUND DLatch
DL15_2 Din2 EN_Latch15 Dout15_2 SUPPLY GROUND DLatch
DL15_3 Din3 EN_Latch15 Dout15_3 SUPPLY GROUND DLatch
DL15_4 Din4 EN_Latch15 Dout15_4 SUPPLY GROUND DLatch
DL15_5 Din5 EN_Latch15 Dout15_5 SUPPLY GROUND DLatch
DL15_6 Din6 EN_Latch15 Dout15_6 SUPPLY GROUND DLatch
DL15_7 Din7 EN_Latch15 Dout15_7 SUPPLY GROUND DLatch





*Dout0
DO0 Dout0_0 Row0_high Dout0_0or SUPPLY GROUND And2 
DO0 Dout1_0 Row1_high Dout1_0or SUPPLY GROUND And2 
DO0 Dout2_0 Row2_high Dout2_0or SUPPLY GROUND And2 
DO0 Dout3_0 Row3_high Dout3_0or SUPPLY GROUND And2 
DO0 Dout4_0 Row4_high Dout4_0or SUPPLY GROUND And2 
DO0 Dout5_0 Row5_high Dout5_0or SUPPLY GROUND And2 
DO0 Dout6_0 Row6_high Dout6_0or SUPPLY GROUND And2 
DO0 Dout7_0 Row7_high Dout7_0or SUPPLY GROUND And2 
DO0 Dout8_0 Row8_high Dout8_0or SUPPLY GROUND And2 
DO0 Dout9_0 Row9_high Dout9_0or SUPPLY GROUND And2 
DO0 Dout10_0 Row10_high Dout10_0or SUPPLY GROUND And2 
DO0 Dout11_0 Row11_high Dout11_0or SUPPLY GROUND And2 
DO0 Dout12_0 Row12_high Dout12_0or SUPPLY GROUND And2 
DO0 Dout13_0 Row13_high Dout13_0or SUPPLY GROUND And2 
DO0 Dout14_0 Row14_high Dout14_0or SUPPLY GROUND And2 
DO0 Dout15_0 Row15_high Dout15_0or SUPPLY GROUND And2 

Nor0_ Dout0_0or Dout1_0or Dout2_0or Dout3_0or Dout4_0or Dout5_0or Dout6_0or Dout7_0or Dout8_0or Dout9_0or Dout10_0or Dout11_0or Dout12_0or Dout13_0or Dout14_0or Dout15_0or Nor0 SUPPLY GROUND Nor16
Or0_ Nor0 Dout0 SUPPLY GROUND Inverter


*Dout1
DO0 Dout0_1 Row0_high Dout0_1or SUPPLY GROUND And2 
DO0 Dout1_1 Row1_high Dout1_1or SUPPLY GROUND And2 
DO0 Dout2_1 Row2_high Dout2_1or SUPPLY GROUND And2 
DO0 Dout3_1 Row3_high Dout3_1or SUPPLY GROUND And2 
DO0 Dout4_1 Row4_high Dout4_1or SUPPLY GROUND And2 
DO0 Dout5_1 Row5_high Dout5_1or SUPPLY GROUND And2 
DO0 Dout6_1 Row6_high Dout6_1or SUPPLY GROUND And2 
DO0 Dout7_1 Row7_high Dout7_1or SUPPLY GROUND And2 
DO0 Dout8_1 Row8_high Dout8_1or SUPPLY GROUND And2 
DO0 Dout9_1 Row9_high Dout9_1or SUPPLY GROUND And2 
DO0 Dout10_1 Row10_high Dout10_1or SUPPLY GROUND And2 
DO0 Dout11_1 Row11_high Dout11_1or SUPPLY GROUND And2 
DO0 Dout12_1 Row12_high Dout12_1or SUPPLY GROUND And2 
DO0 Dout13_1 Row13_high Dout13_1or SUPPLY GROUND And2 
DO0 Dout14_1 Row14_high Dout14_1or SUPPLY GROUND And2 
DO0 Dout15_1 Row15_high Dout15_1or SUPPLY GROUND And2 

Nor1_ Dout0_1or Dout1_1or Dout2_1or Dout3_1or Dout4_1or Dout5_1or Dout6_1or Dout7_1or Dout8_1or Dout9_1or Dout10_1or Dout11_1or Dout12_1or Dout13_1or Dout14_1or Dout15_1or Nor1 SUPPLY GROUND Nor16
Or1_ Nor1 Dout1 SUPPLY GROUND Inverter

*Dout2
DO0 Dout0_2 Row0_high Dout0_2or SUPPLY GROUND And2 
DO0 Dout1_2 Row1_high Dout1_2or SUPPLY GROUND And2 
DO0 Dout2_2 Row2_high Dout2_2or SUPPLY GROUND And2 
DO0 Dout3_2 Row3_high Dout3_2or SUPPLY GROUND And2 
DO0 Dout4_2 Row4_high Dout4_2or SUPPLY GROUND And2 
DO0 Dout5_2 Row5_high Dout5_2or SUPPLY GROUND And2 
DO0 Dout6_2 Row6_high Dout6_2or SUPPLY GROUND And2 
DO0 Dout7_2 Row7_high Dout7_2or SUPPLY GROUND And2 
DO0 Dout8_2 Row8_high Dout8_2or SUPPLY GROUND And2 
DO0 Dout9_2 Row9_high Dout9_2or SUPPLY GROUND And2 
DO0 Dout10_2 Row10_high Dout10_2or SUPPLY GROUND And2 
DO0 Dout11_2 Row11_high Dout11_2or SUPPLY GROUND And2 
DO0 Dout12_2 Row12_high Dout12_2or SUPPLY GROUND And2 
DO0 Dout13_2 Row13_high Dout13_2or SUPPLY GROUND And2 
DO0 Dout14_2 Row14_high Dout14_2or SUPPLY GROUND And2 
DO0 Dout15_2 Row15_high Dout15_2or SUPPLY GROUND And2 

Nor2_ Dout0_2or Dout1_2or Dout2_2or Dout3_2or Dout4_2or Dout5_2or Dout6_2or Dout7_2or Dout8_2or Dout9_2or Dout10_2or Dout11_2or Dout12_2or Dout13_2or Dout14_2or Dout15_2or Nor2 SUPPLY GROUND Nor16
Or2_ Nor2 Dout2 SUPPLY GROUND Inverter

*Dout3
DO0 Dout0_3 Row0_high Dout0_3or SUPPLY GROUND And2 
DO0 Dout1_3 Row1_high Dout1_3or SUPPLY GROUND And2 
DO0 Dout2_3 Row2_high Dout2_3or SUPPLY GROUND And2 
DO0 Dout3_3 Row3_high Dout3_3or SUPPLY GROUND And2 
DO0 Dout4_3 Row4_high Dout4_3or SUPPLY GROUND And2 
DO0 Dout5_3 Row5_high Dout5_3or SUPPLY GROUND And2 
DO0 Dout6_3 Row6_high Dout6_3or SUPPLY GROUND And2 
DO0 Dout7_3 Row7_high Dout7_3or SUPPLY GROUND And2 
DO0 Dout8_3 Row8_high Dout8_3or SUPPLY GROUND And2 
DO0 Dout9_3 Row9_high Dout9_3or SUPPLY GROUND And2 
DO0 Dout10_3 Row10_high Dout10_3or SUPPLY GROUND And2 
DO0 Dout11_3 Row11_high Dout11_3or SUPPLY GROUND And2 
DO0 Dout12_3 Row12_high Dout12_3or SUPPLY GROUND And2 
DO0 Dout13_3 Row13_high Dout13_3or SUPPLY GROUND And2 
DO0 Dout14_3 Row14_high Dout14_3or SUPPLY GROUND And2 
DO0 Dout15_3 Row15_high Dout15_3or SUPPLY GROUND And2 

Nor3_ Dout0_3or Dout1_3or Dout2_3or Dout3_3or Dout4_3or Dout5_3or Dout6_3or Dout7_3or Dout8_3or Dout9_3or Dout10_3or Dout11_3or Dout12_3or Dout13_3or Dout14_3or Dout15_3or Nor3 SUPPLY GROUND Nor16
Or3_ Nor3 Dout3 SUPPLY GROUND Inverter


*Dout4
DO0 Dout0_4 Row0_high Dout0_4or SUPPLY GROUND And2 
DO0 Dout1_4 Row1_high Dout1_4or SUPPLY GROUND And2 
DO0 Dout2_4 Row2_high Dout2_4or SUPPLY GROUND And2 
DO0 Dout3_4 Row3_high Dout3_4or SUPPLY GROUND And2 
DO0 Dout4_4 Row4_high Dout4_4or SUPPLY GROUND And2 
DO0 Dout5_4 Row5_high Dout5_4or SUPPLY GROUND And2 
DO0 Dout6_4 Row6_high Dout6_4or SUPPLY GROUND And2 
DO0 Dout7_4 Row7_high Dout7_4or SUPPLY GROUND And2 
DO0 Dout8_4 Row8_high Dout8_4or SUPPLY GROUND And2 
DO0 Dout9_4 Row9_high Dout9_4or SUPPLY GROUND And2 
DO0 Dout10_4 Row10_high Dout10_4or SUPPLY GROUND And2 
DO0 Dout11_4 Row11_high Dout11_4or SUPPLY GROUND And2 
DO0 Dout12_4 Row12_high Dout12_4or SUPPLY GROUND And2 
DO0 Dout13_4 Row13_high Dout13_4or SUPPLY GROUND And2 
DO0 Dout14_4 Row14_high Dout14_4or SUPPLY GROUND And2 
DO0 Dout15_4 Row15_high Dout15_4or SUPPLY GROUND And2 

Nor4_ Dout0_4or Dout1_4or Dout2_4or Dout3_4or Dout4_4or Dout5_4or Dout6_4or Dout7_4or Dout8_4or Dout9_4or Dout10_4or Dout11_4or Dout12_4or Dout13_4or Dout14_4or Dout15_4or Nor4 SUPPLY GROUND Nor16
Or4_ Nor4 Dout4 SUPPLY GROUND Inverter

*Dout5
DO0 Dout0_5 Row0_high Dout0_5or SUPPLY GROUND And2 
DO0 Dout1_5 Row1_high Dout1_5or SUPPLY GROUND And2 
DO0 Dout2_5 Row2_high Dout2_5or SUPPLY GROUND And2 
DO0 Dout3_5 Row3_high Dout3_5or SUPPLY GROUND And2 
DO0 Dout4_5 Row4_high Dout4_5or SUPPLY GROUND And2 
DO0 Dout5_5 Row5_high Dout5_5or SUPPLY GROUND And2 
DO0 Dout6_5 Row6_high Dout6_5or SUPPLY GROUND And2 
DO0 Dout7_5 Row7_high Dout7_5or SUPPLY GROUND And2 
DO0 Dout8_5 Row8_high Dout8_5or SUPPLY GROUND And2 
DO0 Dout9_5 Row9_high Dout9_5or SUPPLY GROUND And2 
DO0 Dout10_5 Row10_high Dout10_5or SUPPLY GROUND And2 
DO0 Dout11_5 Row11_high Dout11_5or SUPPLY GROUND And2 
DO0 Dout12_5 Row12_high Dout12_5or SUPPLY GROUND And2 
DO0 Dout13_5 Row13_high Dout13_5or SUPPLY GROUND And2 
DO0 Dout14_5 Row14_high Dout14_5or SUPPLY GROUND And2 
DO0 Dout15_5 Row15_high Dout15_5or SUPPLY GROUND And2 

Nor5_ Dout0_5or Dout1_5or Dout2_5or Dout3_5or Dout4_5or Dout5_5or Dout6_5or Dout7_5or Dout8_5or Dout9_5or Dout10_5or Dout11_5or Dout12_5or Dout13_5or Dout14_5or Dout15_5or Nor5 SUPPLY GROUND Nor16
Or5_ Nor5 Dout5 SUPPLY GROUND Inverter


*Dout6
DO0 Dout0_6 Row0_high Dout0_6or SUPPLY GROUND And2 
DO0 Dout1_6 Row1_high Dout1_6or SUPPLY GROUND And2 
DO0 Dout2_6 Row2_high Dout2_6or SUPPLY GROUND And2 
DO0 Dout3_6 Row3_high Dout3_6or SUPPLY GROUND And2 
DO0 Dout4_6 Row4_high Dout4_6or SUPPLY GROUND And2 
DO0 Dout5_6 Row5_high Dout5_6or SUPPLY GROUND And2 
DO0 Dout6_6 Row6_high Dout6_6or SUPPLY GROUND And2 
DO0 Dout7_6 Row7_high Dout7_6or SUPPLY GROUND And2 
DO0 Dout8_6 Row8_high Dout8_6or SUPPLY GROUND And2 
DO0 Dout9_6 Row9_high Dout9_6or SUPPLY GROUND And2 
DO0 Dout10_6 Row10_high Dout10_6or SUPPLY GROUND And2 
DO0 Dout11_6 Row11_high Dout11_6or SUPPLY GROUND And2 
DO0 Dout12_6 Row12_high Dout12_6or SUPPLY GROUND And2 
DO0 Dout13_6 Row13_high Dout13_6or SUPPLY GROUND And2 
DO0 Dout14_6 Row14_high Dout14_6or SUPPLY GROUND And2 
DO0 Dout15_6 Row15_high Dout15_6or SUPPLY GROUND And2 

Nor6_ Dout6_0or Dout1_6or Dout2_6or Dout3_6or Dout4_6or Dout5_6or Dout6_6or Dout7_6or Dout8_6or Dout9_6or Dout10_6or Dout11_6or Dout12_6or Dout13_6or Dout14_6or Dout15_6or Nor6 SUPPLY GROUND Nor16
Or6_ Nor6 Dout6 SUPPLY GROUND Inverter

*Dout7
DO0 Dout0_7 Row0_high Dout0_7or SUPPLY GROUND And2 
DO0 Dout1_7 Row1_high Dout1_7or SUPPLY GROUND And2 
DO0 Dout2_7 Row2_high Dout2_7or SUPPLY GROUND And2 
DO0 Dout3_7 Row3_high Dout3_7or SUPPLY GROUND And2 
DO0 Dout4_7 Row4_high Dout4_7or SUPPLY GROUND And2 
DO0 Dout5_7 Row5_high Dout5_7or SUPPLY GROUND And2 
DO0 Dout6_7 Row6_high Dout6_7or SUPPLY GROUND And2 
DO0 Dout7_7 Row7_high Dout7_7or SUPPLY GROUND And2 
DO0 Dout8_7 Row8_high Dout8_7or SUPPLY GROUND And2 
DO0 Dout9_7 Row9_high Dout9_7or SUPPLY GROUND And2 
DO0 Dout10_7 Row10_high Dout10_7or SUPPLY GROUND And2 
DO0 Dout11_7 Row11_high Dout11_7or SUPPLY GROUND And2 
DO0 Dout12_7 Row12_high Dout12_7or SUPPLY GROUND And2 
DO0 Dout13_7 Row13_high Dout13_7or SUPPLY GROUND And2 
DO0 Dout14_7 Row14_high Dout14_7or SUPPLY GROUND And2 
DO0 Dout15_7 Row15_high Dout15_7or SUPPLY GROUND And2 

Nor7_ Dout0_7or Dout1_7or Dout2_7or Dout3_7or Dout4_7or Dout5_7or Dout6_7or Dout7_7or Dout8_7or Dout9_7or Dout10_7or Dout11_7or Dout12_7or Dout13_7or Dout14_7or Dout15_7or Nor7 SUPPLY GROUND Nor16
Or7_ Nor7 Dout7 SUPPLY GROUND Inverter





Va0 A0 0 PWL(1PS 0V, 9.99NS 0V, 10NS 5V, 19.99NS 5V, 20NS 0V)
Va1 A1 0 PWL(1PS 0V, 11.99NS 0V, 12NS 5V, 21.99NS 5V, 22NS 0V)
Va2 A2 0 PWL(1PS 0V, 13.99NS 0V, 14NS 5V, 23.99NS 5V, 24NS 0V)
Va3 A3 0 PWL(1PS 0V, 15.99NS 0V, 16NS 5V, 25.99NS 5V, 26NS 0V)


VS SUPPLY 0 5V
VGND GROUND 0 0V

.MODEL MODN NMOS (
+LEVEL   = 49             acm     = 3              hdif    = 0.35e-6
+VERSION = 3.1            TNOM    = 27             TOX     = 5.7E-9
+XJ      = 1E-7           NCH     = 2.3549E17      VTH0    = 0.4365497
+K1      = 0.3915623      K2      = 0.0175145      K3      = 1E-3
+K3B     = 2.6588343      W0      = 1E-7           NLX     = 1.111465E-7
+DVT0W   = 0              DVT1W   = 0              DVT2W   = 0
+DVT0    = -0.0408321     DVT1    = 0.0746768      DVT2    = 0.307109
+U0      = 407.1177485    UA      = 9.442714E-11   UB      = 1.092986E-18
+UC      = 1.63196E-11    VSAT    = 1.365087E5     A0      = 1.3189329
+AGS     = 0.2711719      B0      = 3.291713E-8    B1      = -1E-7
+KETA    = 4.645753E-3    A1      = 0              A2      = 1
+RDSW    = 439.9558234    PRWG    = 0.0345487      PRWB    = -0.0441065
+WR      = 1              WINT    = 1.645705E-9    LINT    = 1.116516E-9
+XL      = 3E-8           XW      = 0              DWG     = -1.494138E-9
+DWB     = 1.459097E-8    VOFF    = -0.1026054     NFACTOR = 0.1344887
+CIT     = 0              CDSC    = 1.527511E-3    CDSCD   = 0
+CDSCB   = 0              ETA0    = 1.930311E-3    ETAB    = 2.946158E-4
+DSUB    = 0.0214865      PCLM    = 1.3387947      PDIBLC1 = 0.480652
+PDIBLC2 = 9.034986E-3    PDIBLCB = -1E-3          DROUT   = 0.5593223
+PSCBE1  = 9.843289E9     PSCBE2  = 2.10878E-9     PVAG    = 1.0033136
+DELTA   = 0.01           MOBMOD  = 1              PRT     = 0
+UTE     = -1.5           KT1     = -0.11          KT1L    = 0
+KT2     = 0.022          UA1     = 4.31E-9        UB1     = -7.61E-18
+UC1     = -5.6E-11       AT      = 3.3E4          WL      = 0
+WLN     = 1              WW      = -1.22182E-16   WWN     = 1.2127
+WWL     = 0              LL      = 0              LLN     = 1
+LW      = 0              LWN     = 1              LWL     = 0
+CAPMOD  = 2              XPART   = 0.4            CGDO    = 3.11E-10
+CGSO    = 3.11E-10       CGBO    = 1E-11          CJ      = 1.758521E-3
+PB      = 0.99           MJ      = 0.457547       CJSW    = 4.085057E-10
+PBSW    = 0.8507757      MJSW    = 0.3374073      PVTH0   = 7.147521E-5
+PRDSW   = -67.2161633    PK2     = -1.344599E-3   WKETA   = 3.035972E-3
+LKETA   = -9.0406E-3     LAGS    = -0.3012         )
*
.MODEL MODP PMOS (
+LEVEL   = 49             acm     = 3              hdif    = 0.35e-6
+VERSION = 3.1            TNOM    = 27             TOX     = 5.7E-9
+XJ      = 1E-7           NCH     = 4.1589E17      VTH0    = -0.6586391
+K1      = 0.5199897      K2      = 0.0357513      K3      = 0
+K3B     = 15.5613889     W0      = 1E-6           NLX     = 1E-9
+DVT0W   = 0              DVT1W   = 0              DVT2W   = 0
+DVT0    = 2.6100181      DVT1    = 0.4363142      DVT2    = -0.042436
+U0      = 196.024903     UA      = 2.767112E-9    UB      = 1.90709E-18
+UC      = 6.166867E-11   VSAT    = 1.975064E5     A0      = 0.2398712
+AGS     = 0.0943234      B0      = 3.21184E-6     B1      = 5E-6
+KETA    = 0.0312217      A1      = 0              A2      = 1
+RDSW    = 997.072701     PRWG    = -0.1916111     PRWB    = -0.495
+WR      = 1              WINT    = 2.527293E-9    LINT    = 1.254514E-8
+XL      = 3E-8           XW      = 0              DWG     = -3.253948E-8
+DWB     = 4.92072E-8     VOFF    = -0.15          NFACTOR = 1.5460516
+CIT     = 0              CDSC    = 1.413317E-4    CDSCD   = 0
+CDSCB   = 0              ETA0    = 0.7241245      ETAB    = -0.240523
+DSUB    = 1.0813613      PCLM    = 2.0772083      PDIBLC1 = 4.31459E-4
+PDIBLC2 = 0.0252121      PDIBLCB = -9.960722E-4   DROUT   = 0.0432774
+PSCBE1  = 3.191047E10    PSCBE2  = 1.323218E-8    PVAG    = 0.0420525
+DELTA   = 0.01           MOBMOD  = 1              PRT     = 0
+UTE     = -1.5           KT1     = -0.11          KT1L    = 0
+KT2     = 0.022          UA1     = 4.31E-9        UB1     = -7.61E-18
+UC1     = -5.6E-11       AT      = 3.3E4          WL      = 0
+WLN     = 1              WW      = 0              WWN     = 1
+WWL     = 0              LL      = 0              LLN     = 1
+LW      = 0              LWN     = 1              LWL     = 0
+CAPMOD  = 2              XPART   = 0.4            CGDO    = 2.68E-10
+CGSO    = 2.68E-10       CGBO    = 1E-11          CJ      = 1.902493E-3
+PB      = 0.9810285      MJ      = 0.4644362      CJSW    = 3.142741E-10
+PBSW    = 0.9048624      MJSW    = 0.3304452      PVTH0   = 4.952976E-3
+PRDSW   = 29.8169373     PK2     = 3.383373E-3    WKETA   = -7.913501E-3
+LKETA   = -0.0208318      )



.TRAN 1PS 30NS 0.1NS
.PROBE
.END