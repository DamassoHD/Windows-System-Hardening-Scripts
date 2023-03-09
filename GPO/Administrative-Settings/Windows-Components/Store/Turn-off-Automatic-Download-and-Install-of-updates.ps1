#Define Registry Key & Path
$RegPath = 'HKLM:\Software\Policies\Microsoft'
$RegKey = 'WindowsStore'
$RegParam = 'AutoDownload'
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
Write-Output 'Successfully Disabled All Apps from the Windows Store'