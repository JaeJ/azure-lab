<#
.SYNOPSIS
Creates an Azure Virtual Machine.
#>

$ResourceGroupName = "rg-azure-lab"
$VMName = "azlabvm01"
$Location = "eastus"

Connect-AzAccount

New-AzVm `
    -ResourceGroupName $ResourceGroupName `
    -Name $VMName `
    -Location $Location `
    -VirtualNetworkName "vnet-azure-lab" `
    -SubnetName "default" `
    -SecurityGroupName "nsg-azure-lab" `
    -PublicIpAddressName "azlabvm-ip"

Write-Host "Virtual machine deployment initiated." -ForegroundColor Green    
