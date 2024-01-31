*dedocer 4:16

.SUBCKT NotGate in out vdd vss
M1 vdd in out vdd MODP W=4U L=1U
M2 out in vss vss MODN W=4U L=1U
.ENDS NotGate


.SUBCKT Nand4 A B C D out vdd vss
M1 vdd A out vdd MODN W=4U L=1U
M2 vdd B out vdd MODN W=4U L=1U
M3 vdd D out vdd MODN W=4U L=1U
M4 vdd C out vdd MODN W=4U L=1U

M5 out A 1   vss MODP W=4U L=1U
M6 1   B 2   vss MODP W=4U L=1U
M7 2   C 3   vss MODP W=4U L=1U
M8 3   D vss vss MODP W=4U L=1U
.ENDS Nand4

.SUBCKT And4 A B C D out vdd vss
M1 vdd A 1   vdd MODP W=4U L=1U
M2 1   B 2   vdd MODP W=4U L=1U
M3 2   C 3   vdd MODP W=4U L=1U
M4 3   D out vdd MODP W=4U L=1U

M5 out A vss vss MODN W=4U L=1U
M6 out B vss vss MODN W=4U L=1U
M7 out D vss vss MODN W=4U L=1U
M8 out C vss vss MODN W=4U L=1U
.ENDS And4


A0invert A0 A0inv SUPPLY GROUND NotGate
A1invert A1 A1inv SUPPLY GROUND NotGate
A2invert A2 A2inv SUPPLY GROUND NotGate
A3invert A3 A3inv SUPPLY GROUND NotGate


*.SUBCKT DEODER_4x16 A3 A2 A1 A0 Y0 Y1 Y2 Y3 Y4 Y5 Y6 Y7 Y8 Y9 Y10 Y11 Y12 Y13 Y14 Y15 SUPPLY GROUND
*Decode Outputs
D0  A3inv A2inv A1inv A0inv Y0_low  SUPPLY GROUND Nand4
D1  A3inv A2inv A1inv A0	Y1_low  SUPPLY GROUND Nand4
D2  A3inv A2inv A1	  A0inv Y2_low  SUPPLY GROUND Nand4
D3  A3inv A2inv A1	  A0	Y3_low  SUPPLY GROUND Nand4
D4  A3inv A2	A1inv A0inv Y4_low  SUPPLY GROUND Nand4
D5  A3inv A2 	A1inv A0 	Y5_low  SUPPLY GROUND Nand4
D6  A3inv A2 	A1	  A0inv Y6_low  SUPPLY GROUND Nand4
D7  A3inv A2 	A1	  A0 	Y7_low  SUPPLY GROUND Nand4
D8  A3 	  A2inv A1inv A0inv Y8_low  SUPPLY GROUND Nand4
D9  A3    A2inv A1inv A0	Y9_low  SUPPLY GROUND Nand4
D10 A3	  A2inv A1	  A0inv Y10_low SUPPLY GROUND Nand4
D11 A3	  A2inv A1	  A0	Y11_low SUPPLY GROUND Nand4
D12 A3    A2  	A1inv A0inv Y12_low SUPPLY GROUND Nand4
D13 A3    A2  	A1inv A0	Y13_low SUPPLY GROUND Nand4
D14 A3    A2  	A1 	  A0inv Y14_low SUPPLY GROUND Nand4
D15 A3	  A2    A1 	  A0 	Y15_low SUPPLY GROUND Nand4


Y0invert  Y0_low  Y0_high  SUPPLY GROUND NotGate 
Y1invert  Y1_low  Y1_high  SUPPLY GROUND NotGate
Y2invert  Y2_low  Y2_high  SUPPLY GROUND NotGate
Y3invert  Y3_low  Y3_high  SUPPLY GROUND NotGate
Y4invert  Y4_low  Y4_high  SUPPLY GROUND NotGate
Y5invert  Y5_low  Y5_high  SUPPLY GROUND NotGate
Y6invert  Y6_low  Y6_high  SUPPLY GROUND NotGate
Y7invert  Y7_low  Y7_high  SUPPLY GROUND NotGate
Y8invert  Y8_low  Y8_high  SUPPLY GROUND NotGate
Y9invert  Y9_low  Y9_high  SUPPLY GROUND NotGate
Y10invert Y10_low Y10_high SUPPLY GROUND NotGate
Y11invert Y11_low Y11_high SUPPLY GROUND NotGate
Y12invert Y12_low Y12_high SUPPLY GROUND NotGate
Y13invert Y13_low Y13_high SUPPLY GROUND NotGate
Y14invert Y14_low Y14_high SUPPLY GROUND NotGate
Y15invert Y15_low Y15_high SUPPLY GROUND NotGate





*select output of cells by pmos
Mrow1 d00 Y0_low d0 supply 




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