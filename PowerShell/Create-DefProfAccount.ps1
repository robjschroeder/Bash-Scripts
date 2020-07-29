$username = "DefProf"
$defProfAccountCredentials = get-credential "$username"
$defProfDescription = "Account for Configuring Default User Profile"
$defProfFullName = "Default Profile"
$localWKSAdminsGroup = "LCL_WKSAdmins"


net user $username ($defProfAccountCredentials.GetNetworkCredential()).Password /ADD /active:no /comment:$defProfDescription /fullname:$defProfFullName
if ($? -eq "$true")
    {
        $user = ([adsi]"WinNT://$env:computername/$username")
        $user.psbase.InvokeSet("userflags", 66051)
        $user.psbase.commitchanges()
        net localgroup /add "Administrators" "$username"
        net localgroup /add "$localWKSAdminsGroup" "$username"
    }