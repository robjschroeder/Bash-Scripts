$ous = Get-Content "C:\Scripts\Windows PowerShell\Work\ous.txt"
$path = "OU=BA,OU=Yuma,OU=Yuma,OU=Classrooms,OU=Computers,OU=AZW,DC=adroot,DC=azwestern,DC=edu"
Foreach ($ou in $ous){
New-ADOrganizationalUnit -Name $ou -Path $path
}