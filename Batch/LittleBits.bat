@echo off
::
::
:: Copies LittleBits 64-bit directory
:: By Robert Schroeder 
:: 4.19.2018

CLS
ECHO COPY THE LittleBits
mkdir "C:\Program Files\little Bits"
XCOPY \\ns-tsssrv01.adroot.azwestern.edu\deploy\Kaseya-PC\Software\LittleBits\littleBitsCodeKitApp "C:\Programs Files\little Bits" /E /R /Y
XCOPY \\ns-tsssrv01.adroot.azwestern.edu\deploy\Kaseya-PC\Software\LittleBits\"littleBits Code Kit.lnk" C:\Users\Public\Desktop\

ECHO ENJOY THE LittleBits

Exit /B