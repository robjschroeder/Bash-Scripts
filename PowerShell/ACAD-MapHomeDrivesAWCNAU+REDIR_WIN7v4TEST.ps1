# Creates a new COM object to be used for mapping the drives
$net = new-object -ComObject WScript.Network

$guest1 = "G-plcwl1"

# Paths to Webhome and UserFiles for Students
$ToroUserFiles = "\\toro.azwestern.edu\userfiles"
$ToroWebhome = "\\toro.azwestern.edu\webhome"

# Paths to Webhome and UserFiles for Employees
$VirgilUserFiles = "\\virgil.azwestern.edu\userfiles"
$VirgilWebhome = "\\virgil.azwestern.edu\webhome"

# Folders that are redirected and must exist for redirection to work
$Folders = "My Documents","Desktop","Favorites"

# Capture current logged on profile into a variable
$User = get-wmiobject win32_computersystem -computer $env:COMPUTERNAME | select username

# Pull list of g- accounts in active directory and store into a variable
$gaccounts = "g-3c112", "g-3c114", "g-3c116", "g-3c2105", "g-3c2116", "g-3c2206", "g-3c2a06", "g-ab103", "G-AB105", "g-ac107", "g-ac108", "g-ac110", "g-ac111", "g-ac126", "g-ac146", "g-ac159", "g-ac213", "g-ac214", "g-ac278", "g-ac279", "g-ac280", "g-ac282", "g-ac286", "g-ac288", "g-ac289", "g-acwl1", "g-al101", "G-AS101", "G-AS102", "G-AS103", "G-AS104", "G-AS105", "G-AS105A", "G-AS106", "G-AS107", "G-AS108", "G-AS110", "G-AS111", "G-AS112", "G-AS113", "G-AS114", "G-AS115", "g-AS116", "G-AS116a", "G-AS116b", "G-AS116c", "G-AS118", "G-AS201", "G-AS202", "G-AS206", "G-AS207", "G-AS209", "G-AS210", "G-AS211", "G-AS212", "G-AS215", "g-ba101", "g-ba111", "g-ba118", "g-ba119", "g-ba124", "g-ba201", "g-ba205", "g-ba225", "g-ba226", "g-ba230", "G-BA235", "G-BA236", "g-cd100", "g-cd403", "g-cr100", "g-cte120", "G-CTLab", "g-ds135", "g-ds143", "g-ec113", "g-ec114", "G-EC115", "g-ec116", "g-ec120", "G-EC129", "g-ec143", "g-ec154", "G-EC156", "G-EC158", "g-ec159", "g-ec160", "g-ec161", "g-ec163", "g-ec165", "g-ec170", "G-ECKIOSK", "g-es105", "g-es107", "g-es112", "g-es114", "g-es116", "g-et102", "g-et104", "G-ET127", "g-etwl", "g-fs5", "G-GA126", "g-gy108", "g-gy116", "g-honors", "g-hs101", "g-hs111", "g-hs114", "g-la105", "g-la106", "g-la107", "g-la108", "g-la114", "g-la115", "g-la116", "g-la117", "G-libref", "G-libreflc", "G-LR023", "g-lr046", "g-lr047", "g-lr048", "g-lr050", "g-lr052", "g-lr053", "g-lr073", "G-LR086", "G-LR087", "g-lr095", "g-lr096", "g-lr097", "g-lr098", "g-lr100", "g-lr101", "g-lr104", "G-LR109", "g-lr116", "g-lr120", "g-lr208", "g-lr250", "g-lr251", "g-lrwl1", "g-lrwl2", "G-MCAS", "G-MLK", "G-PLC107", "G-PLC111", "g-plc114", "G-PLC118", "G-PLC120", "G-PLC121", "G-PLC125", "G-PLC126", "G-PLC127", "G-PLCWL1", "G-PTC101", "G-PTC102", "G-QLC101", "G-QLC102", "G-QLC105", "G-QLC113", "G-QLCLBY", "G-QLCWL1", "G-SC106", "G-SC117", "G-SC118", "G-SC119", "G-SC120", "G-SC200", "G-SC209", "G-SC210", "G-SC212", "g-si101", "g-si111", "g-si114", "G-SL051", "G-SL052", "G-SLLC108", "G-SLLC109", "G-SLLC110", "G-SLLC112", "G-SOMCL", "G-Srooms", "G-SS101", "g-te107", "g-te108", "g-te109", "g-te111", "g-te113", "g-te114d", "g-te115", "g-te116", "g-te117", "G-TF106", "g-wlc103", "G-WLC107", "G-WLC108", "G-WLC115"

# Checks to see if the path exists and if it does, maps the Virgil drives for the user
if ($gaccounts -contains $env:USERNAME)
{
outfile C:\temp\guest.txt
}
Else
{
    if (test-path -Path "$VirgilUserFiles")
    {
    # Maps the Virgil drives for the user
    $net.MapNetworkDrive("Z:", "$VirgilUserFiles")
    $net.MapNetworkDrive("W:", "$VirgilWebhome")
        
    # Foreach loop to check for the existence of the folders that are used for redirection
    # and if they don't exist, it will create them on the appropriate share
    foreach ($folder in $folders)
        {
            if (!(test-path -path "$VirgilUserFiles\User Settings\$folder"))
                { 
                    New-Item -ItemType Directory -path "$VirgilUserFiles\User Settings\$folder"
                }
        }    

    # Registry keys used for folder redirection
    New-ItemProperty -path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name Desktop -PropertyType ExpandString -Value "$VirgilUserFiles\User Settings\Desktop" -Force
    New-ItemProperty -path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name Personal -PropertyType ExpandString -Value "$VirgilUserFiles\User Settings\My Documents" -Force
    New-ItemProperty -path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name Favorites -PropertyType ExpandString -Value "$VirgilUserFiles\User Settings\Favorites" -Force

    # Checks to see if the path exists and if it does, maps the Toro drives for the user
    if (test-path -path "$ToroUserFiles")
       {
            # Maps the Virgil drives for the user
            $net.MapNetworkDrive("V:", "$ToroUserFiles")
            $net.MapNetworkDrive("Y:", "$ToroWebhome")
       }
}
    ELSE
    {
    # Checks to see if the path exists and if it does, maps the Toro drives for the user
    if (test-path -Path "$ToroUserFiles")
        {    
            # Maps the Virgil drives for the user
            $net.MapNetworkDrive("Z:", "$ToroUserFiles")
            $net.MapNetworkDrive("W:", "$ToroWebhome")

            # These entries test for the existance of the Z and W drive if Z exists we test for the existance of the "user settings" folder aswell
            If (test-path -Path "Z:\")
            {
                IF (!(test-path -Path "Z:\user settings"))
                {
                femail /from:RedirectionScript@azwestern.edu /to:"Hector.Gaspar@azwestern.edu,Richard.Hernandez@azwestern.edu" /Subject:"LibraryRedirectionLog" /bodyt:"$User failed to create networkdrive Z:\$ToroUserFiles on $env:computername" /SMTP:mobile.azwestern.edu
                }
            }
            If (!(test-path -Path "W:\"))
                {
                femail /from:RedirectionScript@azwestern.edu /to:"Hector.Gaspar@azwestern.edu,Richard.Hernandez@azwestern.edu" /Subject:"LibraryRedirectionLog" /bodyt:"$User failed to create networkdrive W:\$ToroWebhome on $env:computername" /SMTP:mobile.azwestern.edu
                }

            # Foreach loop to check for the existence of the folders that are used for redirection
            # and if they don't exist, it will create them
            foreach ($folder in $folders)
                {
                    if (!(test-path -Path "$ToroUserFiles\User Settings\$folder"))
                        { 
                            New-Item -ItemType Directory -path "$ToroUserFiles\User Settings\$folder"
                        }
                }    
            # These entries verifies that the folders exist on the users drive
            If (!(test-path -Path "$ToroUserFiles\User Settings\My Documents"))
            {
            femail /from:RedirectionScript@azwestern.edu /to:"Hector.Gaspar@azwestern.edu,Richard.Hernandez@azwestern.edu" /Subject:"LibraryRedirectionLog" /bodyt:"$User failed to create My Documents folder on $env:computername" /SMTP:mobile.azwestern.edu
            }
            If (!(test-path -Path "$ToroUserFiles\User Settings\Desktop"))
            {
            femail /from:RedirectionScript@azwestern.edu /to:"Hector.Gaspar@azwestern.edu,Richard.Hernandez@azwestern.edu" /Subject:"LibraryRedirectionLog" /bodyt:"$User failed to create Desktop folder on $env:computername" /SMTP:mobile.azwestern.edu
            }
            If (!(test-path -Path "$ToroUserFiles\User Settings\Favorites"))
            {
            femail /from:RedirectionScript@azwestern.edu /to:"Hector.Gaspar@azwestern.edu,Richard.Hernandez@azwestern.edu" /Subject:"LibraryRedirectionLog" /bodyt:"$User failed to create Favorites folder on $env:computername" /SMTP:mobile.azwestern.edu
            }
            # Registry keys used for folder redirection
            New-ItemProperty -path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name Desktop -PropertyType ExpandString -Value "$ToroUserFiles\User Settings\Desktop" -Force
            New-ItemProperty -path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name Personal -PropertyType ExpandString -Value "$ToroUserFiles\User Settings\My Documents" -Force
            New-ItemProperty -path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name Favorites -PropertyType ExpandString -Value "$ToroUserFiles\User Settings\Favorites" -Force
        }
    Else
        {
        femail /from:RedirectionScript@azwestern.edu /to:"Hector.Gaspar@azwestern.edu,Richard.Hernandez@azwestern.edu" /Subject:"LibraryRedirectionLog" /bodyt:"$User failed in Test-Path for Virgil and Toro on $env:computername" /SMTP:mobile.azwestern.edu
        }
}
    stop-process -name explorer
}