$SearchString = Read-Host "Please enter a computer name or building/room number, i.e. "plc107-101" or "plc107""
$Computers = (Get-ADComputer -LDAPFilter "(name=*$searchString*)").name

foreach ($computer in $computers)
    {
        Copy-Item -Path 'C:\Users\mec6\Desktop\La Paz County - Department of Finance' -Destination "\\$computer\c$\Users\Public\Desktop" -Recurse
    }