#Changing Ownership

# To view the current ACL
$acl = Get-Acl C:\Windows\System32\control.exe
# Define User Ownership
$object = New-Object System.Security.Principal.Ntaccount("administrators")
#Set Account Ownership
$acl.SetOwner($object)
#Deploy Ownership 
$acl | Set-Acl C:\Windows\System32\control.exe

#Set Permissions

$acl = Get-Acl C:\Windows\System32\control.exe
#Define User & Permission
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("student","FullControl","Deny")
$acl.SetAccessRule($AccessRule)
#Deploy Permissions
$acl | Set-Acl C:\Windows\System32\control.exe


#View ACL
Get-Acl C:\Windows\System32\control.exe | fl

