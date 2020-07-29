$configFiles=get-childitem "C:\Deployments\*" -Include *.vbs,*.bat,*.txt, *.sh
foreach ($file in $configFiles)
{
(Get-Content $file.PSPath) | 
Foreach-Object {$_.replace("tss-mbrsrv1\deploy","adroot\tss\deploy")} |
Foreach-Object {$_.replace("tss-mbrsrv1\Deploy","adroot\tss\deploy")} |
Foreach-Object {$_.replace("TSS-MBRSRV1\Deploy","adroot\tss\deploy")} |
Foreach-Object {$_.replace("TSS-MBRSRV1\DEPLOY","adroot\tss\deploy")} |
Foreach-Object {$_.replace("TSS-MBRSRV1\deploy","adroot\tss\deploy")} |
Set-Content $file.PSPath
Write-Output $file.fullname >> C:\Temp\Archived.txt
}


$configFiles=get-childitem "C:\Users\mec6\Downloads" *.xml
foreach ($file in $configFiles)
{
(Get-Content $file.PSPath) | 
Foreach-Object {$_.replace("tss-mbrsrv1\deploy","adroot\tss\deploy")} |
Foreach-Object {$_.replace("tss-mbrsrv1\Deploy","adroot\tss\deploy")} |
Foreach-Object {$_.replace("TSS-MBRSRV1\Deploy","adroot\tss\deploy")} |
Foreach-Object {$_.replace("TSS-MBRSRV1\DEPLOY","adroot\tss\deploy")} |
Foreach-Object {$_.replace("TSS-MBRSRV1\deploy","adroot\tss\deploy")} |
Foreach-Object {$_.replace("tss-mbrsrv1.adroot.azwestern.edu\deploy","adroot\tss\deploy")} |
Foreach-Object {$_.replace("tss-mbrsrv1.adroot.azwestern.edu\Deploy","adroot\tss\deploy")} |
Foreach-Object {$_.replace("TSS-MBRSRV1.adroot.azwestern.edu\Deploy","adroot\tss\deploy")} |
Foreach-Object {$_.replace("TSS-MBRSRV1.adroot.azwestern.edu\DEPLOY","adroot\tss\deploy")} |
Foreach-Object {$_.replace("TSS-MBRSRV1.adroot.azwestern.edu\deploy","adroot\tss\deploy")} |
Foreach-Object {$_.replace("tss-mbrsrv1\dist","adroot\tss\dist")} |
Foreach-Object {$_.replace("tss-mbrsrv1\Dist","adroot\tss\dist")} |
Foreach-Object {$_.replace("TSS-MBRSRV1\Dist","adroot\tss\dist")} |
Foreach-Object {$_.replace("TSS-MBRSRV1\DIST","adroot\tss\dist")} |
Foreach-Object {$_.replace("TSS-MBRSRV1\dist","adroot\tss\dist")} |
Foreach-Object {$_.replace("tss-mbrsrv1.adroot.azwestern.edu\dist","adroot\tss\dist")} |
Foreach-Object {$_.replace("tss-mbrsrv1.adroot.azwestern.edu\Dist","adroot\tss\dist")} |
Foreach-Object {$_.replace("TSS-MBRSRV1.adroot.azwestern.edu\Dist","adroot\tss\dist")} |
Foreach-Object {$_.replace("TSS-MBRSRV1.adroot.azwestern.edu\DIST","adroot\tss\dist")} |
Foreach-Object {$_.replace("TSS-MBRSRV1.adroot.azwestern.edu\dist","adroot\tss\dist")} |
Set-Content $file.PSPath
Write-Output $file.fullname >> C:\Temp\Updated.txt
}

get-childitem "C:\Deployments\*" -Include *.vbs,*.bat,*.txt, *.sh | 
ForEach-Object {Copy-Item $_.FullName C:\Temp\Archived}
Write-Output $_.fullname >> C:\Temp\Archived.txt

$destination=C:\Temp\Archived
$configFiles=get-childitem "C:\Deployments\*" -Include "*.vbs","*.bat","*.txt","*.sh
foreach ($file in $configFiles)
{ 
ForEach-Object {Copy-Item $files -Destination $destination}
Write-Output $file.fullname >> C:\Temp\Archived.txt
}

Get-ChildItem "C:\Deployments\*" -Include *.vbs, *.bat, *.txt, *.sh |
ForEach-Object {Copy-Item $_ C:\Temp\Archived}

Copy-Item -Path C:\Deployments\* -Include *.txt, *.vbs, *.bat, *.sh -Recurse `
  -Destination C:\Temp\Archived


$configFiles=get-childitem "C:\Deployments\*" -Include *.vbs,*.bat,*.txt, *.sh |




$T = Get-ChildItem \\adroot\tss\deploy -Recurse | 
$V = Get-ChildItem \\tss-mbrsrv1\deploy -Recurse
Compare-Object $T $V