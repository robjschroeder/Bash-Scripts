Function Connect-Exchange {

    param(
        [Parameter( Mandatory=$false)]
        [string]$URL="ns-mailhub02.adroot.azwestern.edu"
    )

    $Credential = Get-Credential -Message "Enter your Exchange admin Credentials"

    $PSSessionLine = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://$URL/PowerShell/ -Authentication Kerberos -Credential $Credential

    Import-PSSession $PSSessionLine

}

Connect-Exchange