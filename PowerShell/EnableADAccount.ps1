$computerName = Read-Host "Please enter the name of a computer account to enable in Active Directory"
$enableAccountCredential = read-host "Please enter your netID (-admin will be appended to this variable, thus not necessary)"

Enable-ADAccount -Identity "$computername$" -Credential "adroot\$enableAccountCredential-admin" -Verbose