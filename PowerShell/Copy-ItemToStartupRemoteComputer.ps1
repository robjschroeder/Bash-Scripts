$computersTXTFile = "C:\users\mec6\computers.txt"
$computers = get-content -path $computersTXTFile
$sourcePath = 'C:\temp\winexit.scr'
$destinationPath = "windows\system32"


foreach ($computer in $computers)
    {
        $adminSharePath = "$computer.adroot.azwestern.edu\c$"
        if (test-path -Path "\\$adminSharePath" -Verbose)
            {
                
                #$TargetFile = "\\$adminSharePath\$onenote2013EXEPath"
                #$ShortcutFile = "\\$adminSharePath\$publicDesktopPath\$shortcutName"
                #$ShortcutFile1 = "\\$adminSharePath\$startMenuPath\$shortcutName"
                Copy-Item -Path "$sourcePath" -Destination "\\$adminSharePath\$destinationPath" -Force -Verbose 
            }        
    }