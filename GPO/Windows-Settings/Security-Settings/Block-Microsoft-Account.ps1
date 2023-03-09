#This script allows us to modify the GPO of "Accounts:Block Microsoft Accounts"

#Define Registry Key 'NoConnectedUser' & Path
$RegPath = 'HKLM:\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\POLICIES'
$RegKey = 'SYSTEM'
$RegParam = 'NoConnectedUser'
$FullPath = $RegPath,$RegKey -join "\"
#Check if Path Exists
If (-Not (Test-Path -Path $FullPath)) {
    Write-Host 'Path:' $FullPath 'does NOT Exist!!! Creating Now...'
    New-Item -Path $RegPath -Name $RegKey -Force
    New-ItemProperty -Path $FullPath -Name $RegParam -PropertyType 'DWORD' -Value 3 -Force
} 
#Check if Key Exists in Path
ElseIf (-Not (Get-ItemProperty -Path $FullPath -Name $RegParam -ErrorAction Ignore)) {
    Write-Host 'Key Parameter:' $RegParam 'Does Not Exist!!! Creating Now...'
    New-ItemProperty -Path $FullPath -Name $RegParam -PropertyType 'DWORD' -Value 3 -Force
}
#Update Existing Key Value
Else {
    Write-Host 'Updating Key Parameter:' $RegParam 'to a value of 3...'
    Set-ItemProperty -Path $FullPath -Name $RegParam -Value 3 -Force
}
Write-Output 'Successfully Blocked Microsoft Accounts'