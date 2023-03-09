#This script allows us to modify GPO of CD & DVD Deny R/W/X for User & Machine

#Define Registry Keys

$RegPathCU = 'HKCU:\Software\Policies\Microsoft\Windows'
$RegPathLM = 'HKLM:\Software\Policies\Microsoft\Windows'
$RegKey = 'RemovableStorageDevices'
$RegPath = @($RegPathCU,$RegPathLM)
$RegParam = 'Deny_All'
For ($i=0; $i -lt $RegPath.Length; $i++) {
	$FullPath = $RegPath[$i],$RegKey -join "\"
	If (-Not (Test-Path -Path $FullPath)) {
        Write-Host 'Path:' $FullPath 'does NOT Exist!!! Creating Now...'
        New-Item -Path $RegPath[$i] -Name $RegKey -Force
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
}

Write-Host 'Completed Blocking CD & DVD R/W/X'