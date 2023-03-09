#Changing Ownership

# To view the current ACL
$acl = Get-Acl C:\Windows\regedit.exe
# Define User Ownership
$object = New-Object System.Security.Principal.Ntaccount("administrators")
#Set Account Ownership
$acl.SetOwner($object)
#Deploy Ownership 
$acl | Set-Acl C:\Windows\regedit.exe
`
#Set Permissions

$acl = Get-Acl C:\Windows\regedit.exe
#Define User & Permission
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("student","FullControl","Deny")
$acl.SetAccessRule($AccessRule)
#Deploy Permissions
$acl | Set-Acl C:\Windows\regedit.exe


#View ACL
Get-Acl C:\Windows\regedit.exe | fl

