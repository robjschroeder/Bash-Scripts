@echo off

msiexec /i "\\ns-tsssrv01.adroot.azwestern.edu\deploy\Kaseya-PC\Software\SoftDocs\AutoFile\AutoFile_Client.msi" /qn /norestart

msiexec /i "\\ns-tsssrv01.adroot.azwestern.edu\deploy\Kaseya-PC\Software\SoftDocs\KofaxDriver\Kofax.WebCapture.Installer.msi" /qn /norestart

exit