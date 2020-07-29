$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
$RegROPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce"
$user = "chkoutu-00"
$pass = "student1"

Set-ItemProperty $RegPath "AutoAdminLogin" -Value "1" -type String
Set-ItemProperty $RegPath "ForceAutoLogin" -Value "1" -type String
Set-ItemProperty $RegPath "DefaultDomainName" -Value "ADROOT" -type String
Set-ItemProperty $RegPath "DefaultUsername" -Value "$user" -type String
Set-ItemProperty $RegPath "DefaultPassword" -Value "$pass" -type String

Exit