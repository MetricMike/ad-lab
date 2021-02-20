$DomainName = "vagrant.lab"
$DomainPassword = "Vagrant1!"
$SecureDomainPassword = $DomainPassword | ConvertTo-SecureString -AsPlainText -Force

Install-WindowsFeature -Name AD-Domain-Services -IncludeAllSubFeature -IncludeManagementTools

Install-ADDSForest -DomainName $DomainName -InstallDns -SafeModeAdministratorPassword $SecureDomainPassword -Force -NoRebootOnCompletion

## vagrant reboot

$DomainPath = "DC=vagrant,DC=lab"
$BaseOU = "Accounts"
$AccountOUs = ("General", "Privileged", "Imposters")

New-ADOrganizationalUnit -Name $BaseOU -Path $DomainPath

foreach ($OU in $AccountOUs) {
    New-ADOrganizationalUnit -Name $OU -Path "OU=$BaseOU,$DomainPath"
    $i = 1
    while ($i -ne 5) {
        New-ADUser -Name "$OU-User-$i" -Path "OU=$OU,OU=$BaseOU,$DomainPath"
        $i++
    }
}
