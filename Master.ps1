#This script is to automate all System Hardening Scripts at once
&"$PSScriptroot\GPO\Administrative-Settings\System\All-Removable Storage-Allow-direct-access-in-remote-sessions.ps1"
&"$PSScriptroot\GPO\Administrative-Settings\System\Block-All-Removable-Storage-Classes.ps1"
&"$PSScriptroot\GPO\Administrative-Settings\System\Block-CD-DVD.ps1"
&"$PSScriptroot\GPO\Administrative-Settings\System\Block-Floppy-Drives.ps1"
&"$PSScriptroot\GPO\Administrative-Settings\System\Block-Removable-Disks.ps1"
&"$PSScriptroot\GPO\Administrative-Settings\System\Block-Removable-Storage-Management.ps1"
&"$PSScriptroot\GPO\Administrative-Settings\System\Block-Tape-Drives.ps1"
&"$PSScriptroot\GPO\Administrative-Settings\System\Block-WPD-Devices.ps1"
&"$PSScriptroot\GPO\Administrative-Settings\System\Remove-Change-Password.ps1"
&"$PSScriptroot\GPO\Administrative-Settings\System\Remove-Task-Manager.ps1"
&"$PSScriptroot\GPO\Administrative-Settings\Windows-Components\Microsoft-Account\Block-all-consumer-Microsoft-account-user-authentication.ps1"
&"$PSScriptroot\GPO\Administrative-Settings\Windows-Components\Store\Disable-all-apps-from-Windows-Store.ps1"
&"$PSScriptroot\GPO\Administrative-Settings\Windows-Components\Store\Only-display-the-private-store-within-the-Windows-Store-app.ps1"
&"$PSScriptroot\GPO\Administrative-Settings\Windows-Components\Store\Turn-off-Automatic-Download-and-Install-of-updates.ps1"
&"$PSScriptroot\GPO\Administrative-Settings\Windows-Components\Store\Turn-off-Store-application.ps1"
&"$PSScriptroot\GPO\Administrative-Settings\Windows-Components\Store\Turn-off-the-offer-to-update-to-latest-version-of-Windows.ps1"
&"$PSScriptroot\GPO\Windows-Settings\Security-Settings\Block-Microsoft-Account.ps1"
&"$PSScriptroot\Extra-Layer\CMD-Restrictions.ps1"
&"$PSScriptroot\Extra-Layer\ControlPanel-Restrictions.ps1"
&"$PSScriptroot\Extra-Layer\gpeditdll-Restrictions.ps1"
&"$PSScriptroot\Extra-Layer\gpeditmsc-Restrictions.ps1"
&"$PSScriptroot\Extra-Layer\MMC-Restrictions.ps1"
&"$PSScriptroot\Extra-Layer\Regedit-Restriction.ps1"
#Revert PS back to Restricted Execution Policy Mode
Set-ExecutionPolicy -ExecutionPolicy Restricted