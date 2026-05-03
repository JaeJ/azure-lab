<#
.SYNOPSIS
Lists Azure resources in the current subscription.

.DESCRIPTION
Connects to Azure and displays resource names, types, resource groups, and locations.
#>

Write-Host "Connecting to Azure..." -ForegroundColor Cyan
Connect-AzAccount

Write-Host "Retrieving Azure resources..." -ForegroundColor Cyan

Get-AzResource |
    Select-Object Name, ResourceType, ResourceGroupName, Location |
    Format-Table -AutoSize

Write-Host "Azure resource inventory complete." -ForegroundColor Green
