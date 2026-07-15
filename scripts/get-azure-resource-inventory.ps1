<#
.SYNOPSIS
Generates an inventory of Azure resources.

.DESCRIPTION
Retrieves Azure resources from the current subscription or a specified
resource group and optionally exports the inventory to CSV.

.PARAMETER ResourceGroupName
Optional Azure Resource Group filter.

.PARAMETER OutputPath
Optional CSV export path.

.EXAMPLE
.\get-azure-resource-inventory.ps1

.EXAMPLE
.\get-azure-resource-inventory.ps1 `
    -ResourceGroupName rg-portfolio-eastus

.EXAMPLE
.\get-azure-resource-inventory.ps1 `
    -OutputPath .\reports\AzureInventory.csv
#>

[CmdletBinding()]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$ResourceGroupName,

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$OutputPath
)

try {
    $Context = Get-AzContext

    if (-not $Context) {
        throw "No Azure session detected. Run Connect-AzAccount first."
    }

    $Resources = if ($ResourceGroupName) {
        Get-AzResource `
            -ResourceGroupName $ResourceGroupName `
            -ErrorAction Stop
    }
    else {
        Get-AzResource -ErrorAction Stop
    }

    $Results = $Resources |
        Select-Object @{
            Name = "Subscription"
            Expression = { $Context.Subscription.Name }
        }, @{
            Name = "SubscriptionId"
            Expression = { $Context.Subscription.Id }
        }, ResourceGroupName, Name, ResourceType, Location, ResourceId

    if ($OutputPath) {
        $ParentFolder = Split-Path -Path $OutputPath -Parent

        if ($ParentFolder -and -not (Test-Path -Path $ParentFolder)) {
            New-Item -ItemType Directory -Path $ParentFolder -Force |
                Out-Null
        }

        $Results |
            Export-Csv `
                -Path $OutputPath `
                -NoTypeInformation `
                -Encoding UTF8
    }

    $Results
}
catch {
    Write-Error "Unable to retrieve Azure resource inventory. $($_.Exception.Message)"
}
