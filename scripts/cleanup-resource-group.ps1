<#
.SYNOPSIS
Removes an Azure lab resource group.

.DESCRIPTION
Deletes the specified Azure resource group and all resources inside it.
Use carefully. This is intended for lab cleanup only.
#>

$ResourceGroupName = "rg-azure-lab"

Write-Host "Connecting to Azure..." -ForegroundColor Cyan
Connect-AzAccount

Write-Host "WARNING: This will delete the resource group: $ResourceGroupName" -ForegroundColor Yellow

$ConfirmDelete = Read-Host "Type DELETE to confirm"

if ($ConfirmDelete -eq "DELETE") {
    Remove-AzResourceGroup -Name $ResourceGroupName -Force
    Write-Host "Resource group deleted successfully." -ForegroundColor Green
}
else {
    Write-Host "Cleanup cancelled." -ForegroundColor Red
}
