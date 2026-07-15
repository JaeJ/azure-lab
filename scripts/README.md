# Azure Lab Scripts

This folder contains PowerShell scripts for Azure resource deployment, inventory, reporting, and lab cleanup.

## Requirements

- PowerShell 7 recommended
- Azure PowerShell `Az` module
- An Azure account and subscription
- Appropriate permissions for the target subscription
- An authenticated Azure session

Install the Azure PowerShell module:

```powershell
Install-Module Az -Scope CurrentUser
```

Authenticate:

```powershell
Connect-AzAccount
```

Confirm the selected subscription:

```powershell
Get-AzContext
```

## Scripts

| Script | Purpose |
|---|---|
| `create-resource-group.ps1` | Creates an Azure Resource Group for lab resources. |
| `list-azure-resources.ps1` | Lists Azure resources in the current subscription. |
| `cleanup-resource-group.ps1` | Removes a lab resource group and contained resources. |
| `get-azure-resource-inventory.ps1` | Creates a structured Azure resource inventory with optional CSV export. |
| `create-storage-account.ps1` | Creates an Azure Storage Account. |
| `new-storage-account.ps1` | Creates a validated StorageV2 account with secure defaults and `-WhatIf` support. |
| `create-virtual-network.ps1` | Creates an Azure Virtual Network and subnet. |
| `new-virtual-network.ps1` | Creates a validated virtual network and subnet with `-WhatIf` support. |
| `create-network-security-group.ps1` | Creates an Azure Network Security Group. |
| `create-virtual-machine.ps1` | Deploys an Azure virtual machine for lab use. |

## Usage

Run scripts from the repository root:

```powershell
.\scripts\get-azure-resource-inventory.ps1
```

Use `-WhatIf` with scripts that support it:

```powershell
.\scripts\new-storage-account.ps1 `
    -ResourceGroupName rg-portfolio-eastus `
    -WhatIf
```

## Cost and Safety

Some scripts create Azure resources that may generate charges.

Before running deployment scripts:

1. Confirm the active subscription.
2. Review the selected region and SKU.
3. Use `-WhatIf` when available.
4. Remove lab resources after testing.
5. Do not commit credentials, secrets, subscription IDs, or private resource information.
