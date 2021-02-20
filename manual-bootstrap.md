M@-VRAjrAltT@8aT)y2aLo=Ralgw.HK3

Add Roles
skip first page always
role-based installation
select local server
ADDS
DNS (accept no static IP addresses)
File Server, DFS Namespaces, DFS Replication
WEb Server (IIS)
allow automatic restarts

promote server to domain controller
add a new forest
root domain name: cacp.com
forest/domain FL: server 2016
capabilities: DNS server, GC
DSRM password: CACPWorking4Home!

NETBIOS domain name: CACP

Paths: Default

#
# Windows PowerShell script for AD DS Deployment
#

Import-Module ADDSDeployment
Install-ADDSForest `
-CreateDnsDelegation:$false `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "WinThreshold" `
-DomainName "cacp.com" `
-DomainNetbiosName "CACP" `
-ForestMode "WinThreshold" `
-InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
-NoRebootOnCompletion:$false `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true

#
#
#

ADAC>New Users

Luther Hargreeves // spaceboy // number1!
Vanya Hargreeves // whiteviolin // number7!

#
#
#

DFS Manangement>Namespaces>New
Namespace
	Namespace name: \\cacp.com\umbrella
	Namespace type:  Domain (Windows Server 2008 mode)
	Namespace server: ec2amaz-8ajbhs5
	Root shared folder:  A shared folder will be created if one does not exist.
	Local path of namespace shared folder: C:\DFSRoots\umbrella
	Permissions for namespace shared folder: Everyone read only

properties of umbrella namespace
advanced
enabled ABE

FILE EXPLORER

C:\DFSRoots\umbrella
right click folder -> properties -> security -> advanced

folders/permissions:
\moon (spaceboy can write, whiteviolin can read, private folder that only spaceboy can read/write)
\newyork (both can read/write)
\texas (whiteviolin can write, spaceboy can read, private folder that only whiteviolin can read/write)

