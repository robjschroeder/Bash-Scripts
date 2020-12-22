$users = Import-Csv 'C:\Path\To\CSV.csv'

 

Foreach ($user in $users){
    $networkID = $user.SamAccountName 
    Get-ADUser $networkID -Prop memberof |select samaccountname, @{N= "MemberGroups"; E ={(($_.MemberOf).split(",") | where-object {$_.contains("CN=")}).replace("CN=","")-join ','}} 
        }