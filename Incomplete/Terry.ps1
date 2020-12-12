$users = Import-Csv 'C:\Users\tn32\Documents\Security Accounts\UM_NAU_Accts.csv'

 

Foreach ($user in $users){
    $netID = $user.SamAccountName 
    Get-ADUser $netID -Prop memberof |select samaccountname, @{N= "MemberGroups"; E ={(($_.MemberOf).split(",") | where-object {$_.contains("CN=")}).replace("CN=","")-join ','}} 
        }