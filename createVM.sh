# Variables for VM resources
uniqueId=sonlh98ba
resourceGroup="K8s"
location='australiaeast'
masterVM="master"
workerVM="worker"

# Create resource group
az group create \
--name $resourceGroup \
--location $location \
--verbose

# Create Master VM
az vm create \
--resource-group $resourceGroup \
--name $masterVM \
--image UbuntuLTS \
--admin-username ubuntu \
--admin-password "Son@123456789" 

az vm run-command invoke \
-g $resourceGroup \
-n $masterVM \
--command-id RunShellScript \
--scripts "sudo apt-get update && sudo apt-get install -y ansible"

# Create Worker VM
az vm create \
--resource-group $resourceGroup \
--name $workerVM \
--image UbuntuLTS \
--admin-username ubuntu \
--admin-password "Son@123456789"
