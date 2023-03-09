#This script allows us to modify the GPO of "Remove Task Manager"

#Define Registry Key & Path
$RegPath = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies'
$RegKey = 'System'
$RegParam = 'DisableTaskMgr'
$FullPath = $RegPath,$RegKey -join "\"
#Check if Path Exists
If (-Not (Test-Path -Path $FullPath)) {
    Write-Host 'Path:' $FullPath 'does NOT Exist!!! Creating Now...'
    New-Item -Path $RegPath -Name $RegKey -Force
    New-ItemProperty -Path $FullPath -Name $RegParam -PropertyType 'DWORD' -Value 1 -Force
} 
#Check if Key Exists in Path
ElseIf (-Not (Get-ItemProperty -Path $FullPath -Name $RegParam -ErrorAction Ignore)) {
    Write-Host 'Key Parameter:' $RegParam 'Does Not Exist!!! Creating Now...'
    New-ItemProperty -Path $FullPath -Name $RegParam -PropertyType 'DWORD' -Value 1 -Force
}
#Update Existing Key Value
Else {
    Write-Host 'Updating Key Parameter:' $RegParam 'to a value of 1...'
    Set-ItemProperty -Path $FullPath -Name $RegParam -Value 1 -Force
}
Write-Output 'Successfully Blocked "Remove Tasks Manager" GPO'