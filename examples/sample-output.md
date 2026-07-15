# Sample Output

These examples are sanitized demonstrations. Azure names, subscription details, resource IDs, and addresses are placeholders.

Creating or running deployment scripts may create billable Azure resources. Use `-WhatIf` where supported and remove lab resources when testing is complete.

---

## create-resource-group.ps1

### Command

```powershell
.\scripts\create-resource-group.ps1
```

### Example Output

```text
ResourceGroupName : rg-portfolio-eastus
Location          : eastus
ProvisioningState : Succeeded
```

---

## list-azure-resources.ps1

### Command

```powershell
.\scripts\list-azure-resources.ps1
```

### Example Output

```text
ResourceGroupName   Name                    ResourceType
-----------------   ----                    ------------
rg-portfolio-eastus jaelabstorage01         Microsoft.Storage/storageAccounts
rg-portfolio-eastus vnet-portfolio-eastus  Microsoft.Network/virtualNetworks
rg-portfolio-eastus nsg-portfolio-eastus   Microsoft.Network/networkSecurityGroups
```

---

## cleanup-resource-group.ps1

### Example Output

```text
Resource group found: rg-portfolio-eastus
Removing resource group and contained resources...
Cleanup completed successfully.
```

---

## create-storage-account.ps1

### Example Output

```text
Storage account created successfully.

Name          : jaelabstorage02
ResourceGroup : rg-portfolio-eastus
Location      : eastus
Sku           : Standard_LRS
```

---

## new-storage-account.ps1

### What-If Command

```powershell
.\scripts\new-storage-account.ps1 `
    -ResourceGroupName rg-portfolio-eastus `
    -WhatIf
```

### Example Output

```text
What if: Performing the operation "Create Azure Storage Account"
on target "jaelabstorage01".
```

### Deployment Output

```text
Name              : jaelabstorage01
ResourceGroup     : rg-portfolio-eastus
Location          : eastus
Sku               : Standard_LRS
Kind              : StorageV2
HttpsOnly         : True
MinimumTlsVersion : TLS1_2
ProvisioningState : Succeeded
```

---

## create-virtual-network.ps1

### Example Output

```text
Virtual network created successfully.

Name          : vnet-lab-eastus
AddressSpace  : 10.20.0.0/16
Subnet        : subnet-lab
SubnetPrefix  : 10.20.1.0/24
```

---

## new-virtual-network.ps1

### What-If Command

```powershell
.\scripts\new-virtual-network.ps1 `
    -ResourceGroupName rg-portfolio-eastus `
    -VirtualNetworkName vnet-portfolio-eastus `
    -WhatIf
```

### Deployment Output

```text
Name          : vnet-portfolio-eastus
ResourceGroup : rg-portfolio-eastus
Location      : eastus
AddressSpace  : 10.10.0.0/16
SubnetName    : default
SubnetPrefix  : 10.10.1.0/24
Provisioning  : Succeeded
```

---

## create-network-security-group.ps1

### Example Output

```text
Name              : nsg-portfolio-eastus
ResourceGroup     : rg-portfolio-eastus
Location          : eastus
ProvisioningState : Succeeded
```

---

## create-virtual-machine.ps1

### Example Output

```text
VirtualMachineName : vm-portfolio-01
ResourceGroup      : rg-portfolio-eastus
Location           : eastus
ProvisioningState  : Succeeded
PowerState         : VM running
```

---

## get-azure-resource-inventory.ps1

### Command

```powershell
.\scripts\get-azure-resource-inventory.ps1
```

### Example Output

```text
Subscription      : Azure Portfolio Subscription
ResourceGroupName : rg-portfolio-eastus
Name              : vnet-portfolio-eastus
ResourceType      : Microsoft.Network/virtualNetworks
Location          : eastus
ResourceId        : /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-portfolio-eastus/providers/Microsoft.Network/virtualNetworks/vnet-portfolio-eastus
```

### CSV Export

```powershell
.\scripts\get-azure-resource-inventory.ps1 `
    -OutputPath .\reports\AzureResourceInventory.csv
```
