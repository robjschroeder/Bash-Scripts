$pass = read-host 'Please enter the password'
$user = "Administrator"
$computers = Read-Host "Please enter a computer or list of computers (e.g. "PLC107-101"; "PLC107-101", "PLC107-102", "PLC107-103")"
foreach($Computer in $Computers)
    {
        $newpass = [ADSI]"WinNT://$_/$user,user"
        $newpass.SetPassword($pass)
        $newpass.SetInfo()
    }