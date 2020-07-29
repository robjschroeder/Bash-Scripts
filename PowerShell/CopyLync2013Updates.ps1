$servers = '\\gryphon\winupdates', '\\ns-ec-fs01\winupdates', '\\ns-parker-fs01\winupdates', '\\ns-qlc-fs01\winupdates', '\\ns-sllc-fs01\winupdates', '\\slc-mbrsrv1\winupdates', '\\som-mbrsrv1\winupdates', '\\ns-wlc-fs01\winupdates'
$updates = Get-Content -Path "C:\users\mec6\Documents\LyncUpdates.csv"
$x86String = "x86"
$x64String = "x64"
$x86Path = 'C:\temp\x86'
$x64Path = 'C:\temp\x64'
$x86ExtractedPath = "$x86Path\extracted"
$x64ExtractedPath = "$x64Path\extracted"
$x86ExtractedUpdates = Get-ChildItem -Path "$x86ExtractedPath" -exclude *.xml, *.txt
$x64ExtractedUpdates = Get-ChildItem -Path "$x64ExtractedPath" -exclude *.xml, *.txt
$x86Arguments = "/quiet /extract:$x86ExtractedPath"
$x64Arguments = "/quiet /extract:$x64ExtractedPath"
$x86LyncUpdatesFolder = "\\adroot\tss\deploy\kaseya-apps\Lync2013\$x86String\updates"
$x64LyncUpdatesFolder = "\\adroot\tss\deploy\kaseya-apps\Lync2013\$x64String\updates"

foreach ($server in $servers)
    {
        $cachedUpdates = Get-ChildItem -Path "$server" -Exclude *.txt
        foreach ($update in $cachedUpdates)
            {
                foreach ($update2 in $updates)
                    {
                        IF ($update.name -like "*$update2*")
                            {
                                IF ($update.name -like "*$x86String*")
                                    {
                                        $updateName = $update.name
                                        IF (!(Test-Path -path "$x86Path\$updateName"))
                                            {
                                                Write-host Copying $updateName to $x86Path
                                                Copy-Item -Path $update -Destination $x86Path 
                                                Start-Process -FilePath "$x86Path\$updateName" -ArgumentList $x86Arguments
                                            }
                                    }
                                ElseIf ($update.Name -like "*$x64String*")
                                    {
                                        $updateName = $update.name
                                        IF (!(Test-Path -path "$x64Path\$updateName"))
                                            {
                                                Write-host Copying $update to $x64Path
                                                Copy-Item -Path $update -Destination $x64Path
                                                Start-Process -FilePath "$x64Path\$updateName" -ArgumentList $x64Arguments
                                            }
                                    }
                            }
                    }         
            }
    }

foreach ($extractedUpdate in $x86ExtractedUpdates)
    {
        IF ($extractedUpdate.name -like "*en-us*")
            {
                $extractedUpdateName = $extractedUpdate.name                                 
                IF (!(Test-Path -path "$x86LyncUpdatesFolder\$extractedUpdateName"))
                    {
                        Write-host Copying $extractedUpdate to $x86LyncUpdatesFolder
                        Copy-Item -Path $extractedUpdate -Destination $x86LyncUpdatesFolder
                    }
            }
        ElseIf ($extractedUpdate.name -like "*none*")
            {
                $extractedUpdateName = $extractedUpdate.name                                 
                IF (!(Test-Path -path "$x86LyncUpdatesFolder\$extractedUpdateName"))
                    {
                        Write-host Copying $extractedUpdate to $x86LyncUpdatesFolder
                        Copy-Item -Path $extractedUpdate -Destination $x86LyncUpdatesFolder
                    }
            }    
    }

foreach ($extractedUpdate in $x64ExtractedUpdates)
    {
        IF ($extractedUpdate.name -like "*en-us*")
            {
                $extractedUpdateName = $extractedUpdate.name                                 
                IF (!(Test-Path -path "$x64LyncUpdatesFolder\$extractedUpdateName"))
                    {
                        Write-host Copying $extractedUpdate to $x64LyncUpdatesFolder
                        Copy-Item -Path $extractedUpdate -Destination $x64LyncUpdatesFolder
                    }
            }
        ElseIf ($extractedUpdate.name -like "*none*")
            {
                $extractedUpdateName = $extractedUpdate.name                                 
                IF (!(Test-Path -path "$x64LyncUpdatesFolder\$extractedUpdateName"))
                    {
                        Write-host Copying $extractedUpdate to $x64LyncUpdatesFolder
                        Copy-Item -Path $extractedUpdate -Destination $x64LyncUpdatesFolder
                    }
            }    
    }

#Uncomment below to just extract updates to the specified folder
<#$x86LocalUpdates = get-childitem -Path "$x86Path"
IF (!(Test-Path $x86ExtractedPath))
    {
        New-Item -Path $x86ExtractedPath -ItemType Directory
    } 
foreach ($localUpdate in $x86LocalUpdates)
    {
        $localUpdateName = $localUpdate.name
        Start-Process -FilePath "$x86Path\$localUpdateName" -ArgumentList "$x86Arguments"
    }

$x64LocalUpdates = get-childitem -Path "$x64Path"
IF (!(Test-Path $x64ExtractedPath))
    {
        New-Item -Path $x64ExtractedPath -ItemType Directory
    } 
foreach ($localUpdate in $x64LocalUpdates)
    {
        $localUpdateName = $localUpdate.name
        Start-Process -FilePath "$x64Path\$localUpdateName" -ArgumentList "$x64Arguments"
    }#>