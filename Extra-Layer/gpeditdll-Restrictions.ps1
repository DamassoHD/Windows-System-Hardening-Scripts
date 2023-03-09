#Changing Ownership

# To view the current ACL
$acl = Get-Acl C:\Windows\System32\gpedit.dll
# Define User Ownership
$object = New-Object System.Security.Principal.Ntaccount("administrators")
#Set Account Ownership
$acl.SetOwner($object)
#Deploy Ownership 
$acl | Set-Acl C:\Windows\System32\gpedit.dll

#Set Permissions

$acl = Get-Acl C:\Windows\System32\gpedit.dll
#Define User & Permission
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("student","FullControl","Deny")
$acl.SetAccessRule($AccessRule)
#Deploy Permissions
$acl | Set-Acl C:\Windows\System32\gpedit.dll


#View ACL
Get-Acl C:\Windows\System32\gpedit.dll | fl

