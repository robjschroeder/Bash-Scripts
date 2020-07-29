$path = 'OU=PSIWL2,OU=PSI,OU=Yuma Campus,OU=Classrooms,OU=Computers,OU=AWC,DC=adroot,DC=azwestern,DC=edu'

$Computers = Get-Content 'C:\Scripts\Windows PowerShell\Work\ADComputers.txt'

foreach ($Computer in $Computers)
    {

        New-ADComputer -Name $Computer -path $path -Credential $cred -Enabled $true -Verbose

    }