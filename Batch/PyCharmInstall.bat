@echo off

:: PyCharm Installation

"\\ns-tsssrv01.adroot.azwestern.edu\deploy\Kaseya-PC\Software\JetBrains\PyCharm\pycharm-community-2017.3.3.exe" /S

:: Shortcut Copy

x32-x64
:: Test if x64
IF NOT EXIST C:\Windows\SysWOW64 GOTO 32Bit-W7
:: Delete ARM folder and all contents.
RMDIR /S /Q "%ProgramFiles(x86)%\Common Files\Adobe\ARM"

:32Bit-W7
:: Delete ARM folder and all contents.
RMDIR /S /Q "%ProgramFiles%\Common Files\Adobe\ARM"