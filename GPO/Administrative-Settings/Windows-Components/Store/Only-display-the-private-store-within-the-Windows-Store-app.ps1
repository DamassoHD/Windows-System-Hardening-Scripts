#This script allows us to modify GPO of Only Display the Private Store Within the Windows Store App

#Define Registry Keys

$RegPathCU = 'HKCU:\Software\Policies\Microsoft'
$RegPathLM = 'HKLM:\Software\Policies\Microsoft'
$RegKey = 'WindowsStore'
$RegPath = @($RegPathCU,$RegPathLM)
$RegParam = 'RequirePrivateStoreOnly'
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

Write-Host 'Completed Enabling the GPO of "Only Display the Private Store Within the Windows Store App"'