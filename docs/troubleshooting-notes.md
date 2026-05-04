# Azure Troubleshooting Notes

## Azure PowerShell Login Issues

### Problem

Unable to connect using Azure PowerShell.

### Solution

```powershell
Connect-AzAccount
```

If authentication fails:
- Verify internet connection
- Confirm MFA approval
- Verify Azure account permissions

---

## Resource Group Deployment Failures

### Common Causes

- Invalid region name
- Naming conflicts
- Insufficient permissions
- Subscription limits

### Verification

```powershell
Get-AzResourceGroup
```

---

## Storage Account Creation Errors

### Common Causes

- Storage account name already exists
- Invalid characters in name
- Unsupported region

### Best Practices

- Use lowercase names only
- Use globally unique names
- Keep names between 3-24 characters

Example:

```powershell
$StorageAccountName = "azlabstorage001"
```

---

## Azure Resource Inventory Troubleshooting

### Verify Resources

```powershell
Get-AzResource
```

### Verify Subscription

```powershell
Get-AzSubscription
```

### Set Subscription

```powershell
Set-AzContext -SubscriptionName "YourSubscription"
```

---

## PowerShell Module Issues

### Verify Installed Modules

```powershell
Get-Module -ListAvailable Az
```

### Install Azure Module

```powershell
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
```

### Update Azure Module

```powershell
Update-Module Az
```

---

## Common Lab Issues

- Authentication failures
- Subscription access issues
- Resource deployment conflicts
- Incorrect region selection
- Storage naming conflicts
- PowerShell execution policy restrictions
