$computer = read-host 'Please enter the computer name you want to retrieve a list of services from'

$netid = read-host 'Please enter your -admin username (adroot is not needed as the variable is appended to it in the command)'

gwmi -Class Win32_Service -ComputerName $computer -Credential adroot\$netid | Select-Object -property DisplayName,Name,State,Description | sort-object  -Property DisplayName, State | Out-GridView -Title "Services on computer $computer" -Wait