#This script allows us to modify GPO of Tape Drives R/W/X for User & Machine

#Define Registry Keys

$RegPathCU = 'HKCU:\Software\Policies\Microsoft\Windows\RemovableStorageDevices'
$RegPathLM = 'HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices'
$RegKey = '{53f5630b-b6bf-11d0-94f2-00a0c91efb8b}'
$RegPath = @($RegPathCU,$RegPathLM)
$RegParam = @('Deny_Read','Deny_Write','Deny_Execute')
For ($i=0; $i -lt $RegPath.Length; $i++) {
	$FullPath = $RegPath[$i],$RegKey -join "\"
	If (-NOT(Test-Path -Path $FullPath)) {
		Write-Host 'Key DOES NOT EXIST in path:' $FullPath
		New-Item -Path $RegPath[$i] -Name $RegKey -Force
	}
	For ($j=0; $j -lt $RegParam.Length; $j++) {
		If (-NOT ($i -eq 0 -And $j -eq 2)) {
			If (-NOT(Get-ItemProperty -Path $FullPath -Name $RegParam[$j] -ErrorAction Ignore)) {
				Write-Host 'Parameter:' $RegParam[$j] 'DOES NOT EXIST in Path:' $FullPath
				New-ItemProperty -Path $FullPath -Name $RegParam[$j] -PropertyType 'DWORD' -Value 1 -Force
			}
			Else {
				Write-Host 'Updating Parameter:' $RegParam[$j] 'which EXISTS in Path:' $FullPath
				Set-ItemProperty -Path $FullPath -Name $RegParam[$j] -Value 1 -Force
			}
		}
	}
}

Write-Host 'Completed Blocking Tape Drives R/W/X'