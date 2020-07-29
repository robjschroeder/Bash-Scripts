Get-ADComputer -Credential $cred -LDAPFilter "(name=*PLC120*)" | Select-Object Name | Export-Csv .\renamecomputers-plc120.csv -NoTypeInformation

$Members = import-csv .\RenameComputers-plc120.csv

foreach ($Member in $Members){

Add-ADGroupMember "PLC120DefPrn1" -Members $Member.Name -Credential $cred
}