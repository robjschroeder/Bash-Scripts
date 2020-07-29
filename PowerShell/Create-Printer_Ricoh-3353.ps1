$name = "Ricoh Aficio MP 3353"
$port = "IP_10.235.1.10"
$driver = "Ricoh Aficio MP 3350 PCL6"

Add-Printer -Name $name -PortName $port -DriverName $driver -Verbose

Get-Printer -Name $name