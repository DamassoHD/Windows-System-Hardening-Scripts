#This script allows us to modify GPO of WPD Devices Deny R/W/X for User & Machine

#Define Registry Keys

$RegPathCU = 'HKCU:\Software\Policies\Microsoft\Windows\RemovableStorageDevices'
$RegPathLM = 'HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices'
$RegKeyA = '{6AC27878-A6FA-4155-BA85-F98F491D4F33}'
$RegKeyB = '{F33FDC04-D1AC-4E8E-9A30-19BBD4B108AE}'
$RegPath = @($RegPathCU,$RegPathLM)
$RegKey = @($RegKeyA,$RegKeyB)
$RegParam = @('Deny_Read','Deny_Write')

For ($i=0; $i -lt $RegPath.Length; $i++) {
    For ($j=0; $j -lt $RegKey.Length; $j++) {
        $FullPath = $RegPath[$i],$RegKey[$j] -join "\"
        #Check if Path Exists
        If (-Not (Test-Path -Path $FullPath)) {
            Write-Host 'Key DOES NOT EXIST in path:' $FullPath
            #Create New Path and Key
		    New-Item -Path $RegPath[$i] -Name $RegKey[$j] -Force 
        }
        For ($k=0; $k -lt $RegParam.Length; $k++) {
            #Check if Parameter Exists
            If (-NOT(Get-ItemProperty -Path $FullPath -Name $RegParam[$k] -ErrorAction Ignore)) {
                Write-Host 'Parameter:' $RegParam[$k] 'DOES NOT EXIST in Path:' $FullPath
                #Create New Parameter
                New-ItemProperty -Path $FullPath -Name $RegParam[$k] -PropertyType 'DWORD' -Value 1 -Force
            }
            Else {
                Write-Host 'Updating Parameter:' $RegParam[$k] 'which EXISTS in Path:' $FullPath
                #Updating Existing Parameter
                Set-ItemProperty -Path $FullPath -Name $RegParam[$k] -Value 1 -Force
            }
        }
    }
}

Write-Host 'Completed Blocking WPD Devices R/W/X'