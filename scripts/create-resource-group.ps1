$ResourceGroupName = "rg-azure-lab"
$Location = "eastus"

Write-Host "Connecting to Azure..." -ForegroundColor Cyan
Connect-AzAccount

Write-Host "Creating Resource Group: $ResourceGroupName in $Location..." -ForegroundColor Cyan

New-AzResourceGroup `
    -Name $ResourceGroupName `
    -Location $Location

Write-Host "Resource Group created successfully." -ForegroundColor Green
