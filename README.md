# Azure Lab

![PowerShell](https://img.shields.io/badge/PowerShell-7+-5391FE?logo=powershell)
![Azure](https://img.shields.io/badge/Microsoft-Azure-0078D4?logo=microsoftazure)
![Infrastructure](https://img.shields.io/badge/Cloud-Infrastructure-success)
![License](https://img.shields.io/badge/License-MIT-green)

---

## Overview

This repository contains Azure administration and infrastructure automation projects built with PowerShell.

The scripts demonstrate repeatable workflows for resource deployment, inventory, reporting, and lab cleanup while emphasizing clear documentation, secure defaults, and operational consistency.

---

## Business Problem

Cloud environments can become difficult to manage when resources are created manually without consistent naming, documentation, validation, or cleanup procedures.

Infrastructure teams need repeatable deployment methods, accurate resource inventories, and reliable cleanup processes to reduce administrative effort, control costs, and improve consistency.

---

## Project Objectives

- Automate common Azure administration tasks
- Build reusable cloud infrastructure scripts
- Practice Azure resource management
- Improve PowerShell automation skills
- Document repeatable administrative workflows
- Demonstrate cloud operations and troubleshooting practices

---

## Skills Demonstrated

- Microsoft Azure
- Azure PowerShell
- Azure Resource Groups
- Azure Storage
- Azure Networking
- Azure Virtual Machines
- Resource Inventory
- Infrastructure Automation
- Cloud Administration
- Operational Documentation
- Cost Awareness
- Troubleshooting

---

## Repository Structure

```text
azure-lab/
├── docs/
│   ├── architecture.md
│   ├── lab-progress.md
│   └── troubleshooting-notes.md
├── examples/
│   └── sample-output.md
├── images/
│   └── README.md
├── scripts/
│   ├── README.md
│   ├── cleanup-resource-group.ps1
│   ├── create-network-security-group.ps1
│   ├── create-resource-group.ps1
│   ├── create-storage-account.ps1
│   ├── create-virtual-machine.ps1
│   ├── create-virtual-network.ps1
│   ├── get-azure-resource-inventory.ps1
│   ├── list-azure-resources.ps1
│   ├── new-storage-account.ps1
│   └── new-virtual-network.ps1
├── .gitignore
├── CHANGELOG.md
├── LICENSE
└── README.md
```

---

## Project Scripts

| Script | Description |
|---|---|
| `create-resource-group.ps1` | Creates an Azure Resource Group for lab resources. |
| `list-azure-resources.ps1` | Lists Azure resources in the current subscription. |
| `cleanup-resource-group.ps1` | Removes a lab resource group and its contained resources. |
| `get-azure-resource-inventory.ps1` | Creates a structured inventory of Azure resources with optional CSV export. |
| `create-storage-account.ps1` | Creates an Azure Storage Account. |
| `new-storage-account.ps1` | Creates a validated StorageV2 account using secure defaults. |
| `create-virtual-network.ps1` | Creates an Azure Virtual Network and subnet. |
| `new-virtual-network.ps1` | Creates a validated virtual network and subnet. |
| `create-network-security-group.ps1` | Creates an Azure Network Security Group. |
| `create-virtual-machine.ps1` | Deploys an Azure virtual machine for lab use. |

---

## Prerequisites

- Windows PowerShell 5.1 or PowerShell 7+
- Azure PowerShell `Az` module
- Azure account and active subscription
- Appropriate permissions to create or review resources

Install the Azure PowerShell module:

```powershell
Install-Module Az -Scope CurrentUser
```

Authenticate:

```powershell
Connect-AzAccount
```

Confirm the current subscription:

```powershell
Get-AzContext
```

---

## How to Run

Clone or download the repository and open PowerShell in the repository root.

### Create a Resource Group

```powershell
.\scripts\create-resource-group.ps1
```

### List Azure Resources

```powershell
.\scripts\list-azure-resources.ps1
```

### Generate an Azure Resource Inventory

```powershell
.\scripts\get-azure-resource-inventory.ps1
```

### Preview a Storage Account Deployment

```powershell
.\scripts\new-storage-account.ps1 `
    -ResourceGroupName rg-portfolio-eastus `
    -WhatIf
```

### Preview a Virtual Network Deployment

```powershell
.\scripts\new-virtual-network.ps1 `
    -ResourceGroupName rg-portfolio-eastus `
    -VirtualNetworkName vnet-portfolio-eastus `
    -WhatIf
```

### Remove Lab Resources

```powershell
.\scripts\cleanup-resource-group.ps1
```

---

## Example Output

Sanitized command and output examples are available in:

```text
examples/sample-output.md
```

---

## Cost and Safety

Some scripts create Azure resources that may produce charges.

Before running deployment scripts:

- Confirm the active Azure subscription
- Review the selected region, SKU, and resource names
- Use `-WhatIf` when supported
- Remove lab resources after testing
- Do not commit credentials, secrets, tenant IDs, subscription IDs, or private resource information

---

## Documentation

Additional project documentation is available in the `docs` folder:

- `architecture.md`
- `lab-progress.md`
- `troubleshooting-notes.md`

---

## Planned Improvements

- Azure Key Vault automation
- Azure Monitor configuration
- Azure Backup configuration
- Azure Policy reporting
- Microsoft Entra ID reporting
- Cost-management reporting
- Resource-tagging validation
- Pester tests
- GitHub Actions validation

---

## Technologies Used

- Microsoft Azure
- Azure Resource Manager
- Azure PowerShell
- PowerShell
- Git
- GitHub

---

## Author

**Jae McNeal**

Senior Systems Administrator

Azure • Microsoft 365 • Active Directory • PowerShell • Infrastructure Automation • Windows Server
