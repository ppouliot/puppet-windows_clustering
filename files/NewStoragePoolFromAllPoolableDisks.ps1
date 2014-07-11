$newPoolName = "New StoragePool"

# Create a storage pool from all the applicable disks.
$pd = Get-PhysicalDisk | ? CanPool -eq $true
$subsys = Get-StorageSubSystem | ? FriendlyName -like "Clustered*"

$newPool = New-StoragePool `
    -StorageSubSystemFriendlyName $subsys.FriendlyName `
    -FriendlyName $newPoolName `
    -EnclosureAwareDefault $true `
    -AutoWriteCacheSize $true `
    -ProvisioningTypeDefault Fixed `
    -ResiliencySettingNameDefault Mirror `
    -PhysicalDisks $pd
