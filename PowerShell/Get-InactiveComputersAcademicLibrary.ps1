# Variables
Import-Module ActiveDirectory
$domain = "adroot.azwestern.edu"
$time = (Get-Date).AddDays(-($daysInactive))
$date = Get-Date -Format M.d.yyyy
#$datestr = '{0:yyyyMMdd}' -f $date

$daysInactive = 7
$time = (Get-Date).AddDays(-($daysInactive))
Get-ADComputer -Filter {LastLogonTimeStamp -lt $time} -SearchBase "ou=Academic Library,ou=computers,ou=awc,dc=adroot,dc=azwestern,dc=edu" -Properties LastLogonTimeStamp | Sort Name |
  
# Output hostname and lastLogonTimestamp into CSV 
Select-Object Name,@{Name="Stamp"; Expression={[DateTime]::FromFileTime($_.lastLogonTimestamp)}}, DistinguishedName | export-csv "\\ns-tsssrv01.adroot.azwestern.edu\dist\Pub\Robert\InactiveComputerReports\$date - $daysInactive days Inactive Class Computer Report.csv" -NoTypeInformation

$daysInactive = 30
$time = (Get-Date).AddDays(-($daysInactive))
Get-ADComputer -Filter {LastLogonTimeStamp -lt $time} -SearchBase "ou=Academic Library,ou=computers,ou=awc,dc=adroot,dc=azwestern,dc=edu" -Properties LastLogonTimeStamp | Sort Name |
  
# Output hostname and lastLogonTimestamp into CSV 
Select-Object Name,@{Name="Stamp"; Expression={[DateTime]::FromFileTime($_.lastLogonTimestamp)}}, DistinguishedName | export-csv "\\ns-tsssrv01.adroot.azwestern.edu\dist\Pub\Robert\InactiveComputerReports\$date - $daysInactive days Inactive Class Computer Report.csv" -NoTypeInformation

$daysInactive = 60
$time = (Get-Date).AddDays(-($daysInactive))
Get-ADComputer -Filter {LastLogonTimeStamp -lt $time} -SearchBase "ou=Academic Library,ou=computers,ou=awc,dc=adroot,dc=azwestern,dc=edu" -Properties LastLogonTimeStamp | Sort Name |
  
# Output hostname and lastLogonTimestamp into CSV 
Select-Object Name,@{Name="Stamp"; Expression={[DateTime]::FromFileTime($_.lastLogonTimestamp)}}, DistinguishedName | export-csv "\\ns-tsssrv01.adroot.azwestern.edu\dist\Pub\Robert\InactiveComputerReports\$date - $daysInactive days Inactive Class Computer Report.csv" -NoTypeInformation

$daysInactive = 90
$time = (Get-Date).AddDays(-($daysInactive))
Get-ADComputer -Filter {LastLogonTimeStamp -lt $time} -SearchBase "ou=Academic Library,ou=computers,ou=awc,dc=adroot,dc=azwestern,dc=edu" -Properties LastLogonTimeStamp | Sort Name |
  
# Output hostname and lastLogonTimestamp into CSV 
Select-Object Name,@{Name="Stamp"; Expression={[DateTime]::FromFileTime($_.lastLogonTimestamp)}}, DistinguishedName | export-csv "\\ns-tsssrv01.adroot.azwestern.edu\dist\Pub\Robert\InactiveComputerReports\$date - $daysInactive days Inactive Class Computer Report.csv" -NoTypeInformation