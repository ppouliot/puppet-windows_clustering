$newPoolName = "New StoragePool"
$newVolumeName = "New Volume"

# Get the storage pool to create a volume from
$newPool = Get-StoragePool | ? FriendlyName -eq $newPoolName

# Determine the size of the volume to create.

# diskRedundancy determines how many mirrors there will be. 1 = two-way mirror, 2 = three-way mirror.
$diskRedundancy = 2 

# adding a factor of .95 to this because we don't truly have access to all the space in the pool. Not yet sure how to make this calculation definitive.
$newVolumeSize = $newPool.Size / ($diskRedundancy + 1) * .95 

# Create a volume on the virtual disk.
New-Volume `
-StoragePoolFriendlyName $newPool.FriendlyName `
-FriendlyName $newVolumeName `
-FileSystem NTFS `
-PhysicalDiskRedundancy $diskRedundancy `
-ProvisioningType Fixed `
-ResiliencySettingName Mirror `
-Size $newVolumeSize
