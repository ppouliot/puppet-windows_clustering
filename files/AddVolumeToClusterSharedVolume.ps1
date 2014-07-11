$newVolumeName = "*New Volume*"

Get-ClusterResource $newVolumeName | Add-ClusterSharedVolume