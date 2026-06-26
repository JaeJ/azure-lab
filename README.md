# Azure Lab

![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2F7.0-blue?logo=powershell)
![Azure](https://img.shields.io/badge/Microsoft-Azure-0078D4?logo=microsoftazure)
![Windows Server](https://img.shields.io/badge/Windows-Server-0078D6?logo=windows)
![License](https://img.shields.io/badge/License-MIT-green)

---

## Overview

This repository contains hands-on Azure administration projects designed to demonstrate practical cloud administration, infrastructure automation, PowerShell scripting, and enterprise documentation.

The goal is to showcase repeatable solutions that improve operational efficiency while following infrastructure best practices.

---

# Business Problem

Cloud environments can quickly become difficult to manage when resources are created manually without consistent naming conventions, documentation, or automation.

Infrastructure teams require repeatable deployment methods, accurate resource reporting, and reliable cleanup procedures to reduce operational costs and administrative overhead.

This project demonstrates practical PowerShell automation used to simplify Azure administration.

---

# Objectives

- Learn Azure administration
- Practice Infrastructure as Code concepts
- Automate repetitive administration tasks
- Improve PowerShell skills
- Build reusable cloud administration tools
- Document enterprise processes

---

# Skills Demonstrated

- Microsoft Azure
- Azure Resource Groups
- Azure Resource Management
- Azure PowerShell (Az Module)
- PowerShell Automation
- Infrastructure Documentation
- Cloud Administration
- Cost Management
- Troubleshooting
- Process Documentation

---

# Repository Structure

```text
azure-lab/
│
├── docs/
│   ├── lab-progress.md
│   └── troubleshooting-notes.md
│
├── examples/
│   └── sample-output.md
│
├── scripts/
│   ├── create-resource-group.ps1
│   ├── list-azure-resources.ps1
│   └── cleanup-resource-group.ps1
│
└── README.md
```

---

# Project Scripts

| Script | Description |
|---------|-------------|
| create-resource-group.ps1 | Creates a new Azure Resource Group |
| list-azure-resources.ps1 | Lists Azure resources within a subscription |
| cleanup-resource-group.ps1 | Removes lab resources after testing |

---

# How to Run

## Prerequisites

- Windows PowerShell 5.1 or PowerShell 7+
- Azure Subscription
- Azure PowerShell Module

Install the Azure module:

```powershell
Install-Module Az -Scope CurrentUser
```

Login to Azure:

```powershell
Connect-AzAccount
```

Run the scripts:

Create Resource Group

```powershell
.\scripts\create-resource-group.ps1
```

List Azure Resources

```powershell
.\scripts\list-azure-resources.ps1
```

Remove Test Resources

```powershell
.\scripts\cleanup-resource-group.ps1
```

---

# Example Output

## Resource Group Created

```text
Subscription:
Portfolio Lab Subscription

Resource Group:
rg-portfolio-eastus

Location:
East US

Status:
Succeeded
```

---

## Azure Resource Inventory

```text
Resource Group             Resource Type
-----------------------------------------------
rg-portfolio-eastus        Storage Account
rg-portfolio-eastus        Virtual Network
rg-portfolio-eastus        Network Security Group
```

---

## Cleanup

```text
Searching for lab resources...

3 Resources Found

Removing Resource Group...

Completed Successfully

No remaining resources detected.
```

---

# Technologies Used

- Azure
- Azure Resource Manager
- Azure PowerShell
- PowerShell
- Windows
- Git
- GitHub

---

# Future Improvements

- Deploy Virtual Machines
- Deploy Azure Storage
- Deploy Virtual Networks
- Azure Key Vault
- Azure Backup
- Azure Monitor
- Azure Automation
- Microsoft Entra ID
- Azure Policy
- Azure Cost Management

---

# Documentation

Additional documentation can be found inside the **docs** folder.

- Lab Progress
- Troubleshooting Notes
- Sample Output

---

# Recruiter Summary

This repository demonstrates practical Azure administration skills using PowerShell automation.

The projects focus on repeatable cloud administration tasks including deployment, reporting, cleanup, and documentation that align with enterprise infrastructure engineering practices.

The repository is intended to showcase cloud administration experience, scripting ability, operational documentation, and automation techniques relevant to Systems Administration, Infrastructure Engineering, and Cloud Operations roles.

---

## Author

**Jae McNeal**

Senior Systems Administrator

Azure • Microsoft 365 • Active Directory • PowerShell • Infrastructure Automation • Windows Server
