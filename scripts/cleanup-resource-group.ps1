<#
.SYNOPSIS
Removes an Azure lab resource group.

.DESCRIPTION
Deletes the specified Azure resource group and all resources inside it.
Use carefully. This is intended for lab cleanup only.

.PARAMETER ResourceGroupName
The name of the resource group to delete.

.EXAMPLE
.\cleanup-resource-group.ps1 -ResourceGroupName "rg-azure-lab"
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$ResourceGroupName
)

try {
    Write-Host "Connecting to Azure..." -ForegroundColor Cyan
    $context = Connect-AzAccount -ErrorAction Stop
    
    if (-not $context) {
        throw "Failed to connect to Azure"
    }
    
    Write-Host "WARNING: This will delete the resource group: $ResourceGroupName" -ForegroundColor Yellow
    $ConfirmDelete = Read-Host "Type DELETE to confirm"

    if ($ConfirmDelete -eq "DELETE") {
        Write-Host "Deleting resource group '$ResourceGroupName'..." -ForegroundColor Yellow
        Remove-AzResourceGroup -Name $ResourceGroupName -Force -ErrorAction Stop
        Write-Host "Resource group deleted successfully." -ForegroundColor Green
        exit 0
    }
    else {
        Write-Host "Cleanup cancelled." -ForegroundColor Red
        exit 1
    }
}
catch {
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
    exit 2
}
