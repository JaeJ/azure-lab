# Azure Lab Setup Guide

## Requirements

- Azure Account
- PowerShell 7+
- Azure PowerShell Module
- Visual Studio Code

## Install Azure PowerShell Module

```powershell
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
```

## Connect to Azure

```powershell
Connect-AzAccount
```

## Verify Subscription

```powershell
Get-AzSubscription
```

## Recommended Lab Resources

- Resource Groups
- Storage Accounts
- Virtual Machines
- Azure Networking
- Monitoring Tools
