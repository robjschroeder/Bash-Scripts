#Update path to computers.csv ex. C:\scripts\windows powershell\Work\ADComputers.csv
$computers = Get-Content -Path "..."

#OU to create the new computers ex. OU=ITN,OU=AC,OU=Yuma,OU=Yuma,OU=Classrooms,OU=Computers,OU=AZW,DC=adroot,DC=azwestern,DC=edu
$OU = '...'

#Update your computers' descriptions ex. ITN - Dell
$description = "..."

#Update your DC Server Name ex. DC-FSMO-2016
$server = '...'

ForEach ($computer in $computers)
    {
        New-ADComputer -name $computer -Path $OU -Description $description -Server $server -verbose
    }
