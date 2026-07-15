<#
.SYNOPSIS
Creates an Azure Storage Account.

.DESCRIPTION
Validates the target resource group and creates an Azure Storage Account
using a globally unique name.

.PARAMETER ResourceGroupName
The Azure Resource Group where the storage account will be created.

.PARAMETER Location
The Azure region. Defaults to eastus.

.PARAMETER StorageAccountName
Optional storage account name. If omitted, a unique name is generated.

.PARAMETER SkuName
Storage account SKU. Defaults to Standard_LRS.

.EXAMPLE
.\new-storage-account.ps1 -ResourceGroupName rg-portfolio-eastus
#>

[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]$ResourceGroupName,

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$Location = "eastus",

    [Parameter()]
    [ValidatePattern("^[a-z0-9]{3,24}$")]
    [string]$StorageAccountName,

    [Parameter()]
    [ValidateSet(
        "Standard_LRS",
        "Standard_GRS",
        "Standard_RAGRS",
        "Standard_ZRS"
    )]
    [string]$SkuName = "Standard_LRS"
)

try {
    if (-not (Get-AzContext)) {
        throw "No Azure session detected. Run Connect-AzAccount first."
    }

    $ResourceGroup = Get-AzResourceGroup `
        -Name $ResourceGroupName `
        -ErrorAction Stop

    if (-not $StorageAccountName) {
        $Suffix = -join ((97..122) |
            Get-Random -Count 8 |
            ForEach-Object { [char]$_ })

        $StorageAccountName = "jaelab$Suffix"
    }

    $Availability = Get-AzStorageAccountNameAvailability `
        -Name $StorageAccountName `
        -ErrorAction Stop

    if (-not $Availability.NameAvailable) {
        throw "Storage account name '$StorageAccountName' is unavailable."
    }

    if ($PSCmdlet.ShouldProcess(
        $StorageAccountName,
        "Create Azure Storage Account"
    )) {
        $StorageAccount = New-AzStorageAccount `
            -ResourceGroupName $ResourceGroup.ResourceGroupName `
            -Name $StorageAccountName `
            -Location $Location `
            -SkuName $SkuName `
            -Kind StorageV2 `
            -EnableHttpsTrafficOnly $true `
            -MinimumTlsVersion TLS1_2 `
            -ErrorAction Stop

        [PSCustomObject]@{
            Name              = $StorageAccount.StorageAccountName
            ResourceGroup     = $ResourceGroup.ResourceGroupName
            Location          = $StorageAccount.Location
            Sku               = $StorageAccount.Sku.Name
            Kind              = $StorageAccount.Kind
            HttpsOnly         = $StorageAccount.EnableHttpsTrafficOnly
            MinimumTlsVersion = $StorageAccount.MinimumTlsVersion
            ProvisioningState = $StorageAccount.ProvisioningState
        }
    }
}
catch {
    Write-Error "Storage account deployment failed. $($_.Exception.Message)"
}
