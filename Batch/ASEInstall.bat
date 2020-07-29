@ECHO OFF

#Copy Installers
XCOPY "\\ns-tsssrv01.adroot.azwestern.edu\deploy\Kaseya-PC\TC\APPS\ASE\ASE\ProSatelliteLauncher.exe" "C:\Temp\ASE\" /E /R /Y
ping localhost -n 6 >nul
XCOPY "\\ns-tsssrv01.adroot.azwestern.edu\deploy\Kaseya-PC\TC\APPS\ASE\ASE\SecureClientInstaller.msi" "C:\Temp\ASE\" /E /R /Y
ping localhost -n 6 >nul

#Install 
MsiExec.exe /i C:\Temp\ASE\SecureClientInstaller.msi /quiet /qn /norestart
ping localhost -n 6>nul
C:\Temp\ASE\ProSatelliteLauncher.exe /s
ping localhost -n 6>nul

#CleanUp
del C:\Users\Public\Desktop\SecureCLient.lnk
RD /S /Q "C:\Temp\ASE"