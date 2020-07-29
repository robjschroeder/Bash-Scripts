@ECHO OFF

:: Variables

SET loc="\\adroot\tss\deploy\Kaseya-PC\TC\APPS\ASE"
SET switches=/qn /norestart

:: Install Surpass Secure Client
%loc%\"Supass Secure Client\SecureClientInstaller.msi" %switches%

:: Install Suprass Launcher
%loc%\"Surpass Satelite Launcher\ProSatelliteLauncher.EXE"


