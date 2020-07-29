$dataStamp = get-date -Format yyyyMMddTHHmmss
$logFile = "C:\Temp\SCCMClient.log"
$Args = @(
    "/i"
    "\\ns-sccm2016\SCCM_Client_Install\ccmsetup.msi"
    "/SMSSITECODE=AZW"
    "/FSP=ns-sccm2016.adroot.azwestern.edu"
    "/MP=ns-sccm2016.adroot.azwestern.edu"
    "/qn"
    "/norestart"
    $logFile
)
Start-Process "msiexec.exe" -ArgumentList $Args -Wait -NoNewWindow