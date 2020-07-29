$OUs = "adroot.azwestern.edu/AWC/Computers/Classrooms/LaPaz/LC/LPLC107"      
clear-host
$user = Read-Host "Please enter your netID (adroot and -admin are not needed)"
$credentials = Get-Credential adroot\$user-admin
$computers = foreach ($OU in $OUs) { (Get-ADComputer -SearchBase $OU -filter * -Credential $credentials) | sort }
clear-host
#$filePath = Read-Host Please enter the local path where you want to store 'computers.txt'
$filePath = "$env:USERPROFILE\"
$fileName = 'computers.txt'
$fullPath = "$filePath\$fileName"

Clear-Host
Start-Sleep 3
Write-Host Found $computers.Count computer accounts in Active Directory using the search base provided. -ForegroundColor Cyan

foreach ($computer in $computers)
    {
        Write-Output $computer.name | Out-File $fullPath -Append -Force -verbose
    }