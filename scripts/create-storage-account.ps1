<#
.SYNOPSIS
Creates an Azure Storage Account for lab practice.

.DESCRIPTION
Creates a storage account inside the Azure lab resource group.
Storage account names must be globally unique and lowercase.
#>

$ResourceGroupName = "rg-azure-lab"
$Location = "eastus"
$StorageAccountName = "azlabstorage$(Get-Random -Minimum 1000 -Maximum 9999)"

Write-Host "Connecting to Azure..." -ForegroundColor Cyan
Connect-AzAccount

Write-Host "Creating storage account: $StorageAccountName" -ForegroundColor Cyan

New-AzStorageAccount `
    -ResourceGroupName $ResourceGroupName `
    -Name $StorageAccountName `
    -Location $Location `
    -SkuName Standard_LRS `
    -Kind StorageV2

Write-Host "Storage account created successfully." -ForegroundColor Green
