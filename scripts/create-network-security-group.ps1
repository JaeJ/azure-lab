<#
.SYNOPSIS
Creates an Azure Network Security Group.
#>

$ResourceGroupName = "rg-azure-lab"
$Location = "eastus"
$NSGName = "nsg-azure-lab"

Connect-AzAccount

New-AzNetworkSecurityGroup `
    -ResourceGroupName $ResourceGroupName `
    -Location $Location `
    -Name $NSGName

Write-Host "Network Security Group created successfully." -ForegroundColor Green
