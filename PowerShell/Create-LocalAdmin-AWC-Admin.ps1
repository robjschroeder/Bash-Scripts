$username = "AWC-Admin"
$password = ConvertTo-SecureString "test1234!!" -AsPlainText -Force
$group = "Administrators"

New-LocalUser -Name "$username" -Password $password -FullName "AWC Admin" -Description "Local admin account NOT built-in"
Add-LocalGroupMember -Group "$group" -Member "$username"