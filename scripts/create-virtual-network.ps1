<#
.SYNOPSIS
Creates an Azure Virtual Network.
#>

$ResourceGroupName = "rg-azure-lab"
$Location = "eastus"
$VnetName = "vnet-azure-lab"

Connect-AzAccount

New-AzVirtualNetwork `
    -ResourceGroupName $ResourceGroupName `
    -Location $Location `
    -Name $VnetName `
    -AddressPrefix "10.0.0.0/16"

Write-Host "Virtual network created successfully." -ForegroundColor Green
