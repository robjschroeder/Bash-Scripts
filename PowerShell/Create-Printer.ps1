$PrinterIP = “10.215.224.24”
$PrinterPort = “9100”
$PrinterPortName = “IP_” + $PrinterIP
$DriverName = “HP Laserjet M401n”
$DriverPath = “\\ns-tsssrv01\deploy\Kaseya-PC\Printers\Printer_Deployment\HP_LaserJet_400_M401”
$DriverInf = “$DriverPath\hpcm401u.INF”
$PrinterCaption = “SC212-P1”
$RegData = "$PrinterCaption,$DriverName,$PrinterPortName"


CreatePrinterPort -PrinterIP $PrinterIP -PrinterPort $PrinterPort -PrinterPortName $PrinterPortName -ComputerName $Env:ComputerName
InstallPrinterDriver -DriverName $DriverName -DriverPath $DriverPath -DriverInf $DriverInf -ComputerName $Env:ComputerName
CreatePrinter -PrinterPortName $PrinterPortName -DriverName $DriverName -PrinterCaption $PrinterCaption -ComputerName $Env:ComputerName