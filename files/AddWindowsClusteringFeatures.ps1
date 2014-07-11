# File-share clustering on Windows Server
Add-WindowsFeature -Name FS-FileServer,Failover-Clustering -IncludeManagementTools

# Restart
Restart-Computer