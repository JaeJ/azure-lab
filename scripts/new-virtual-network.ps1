<#
.SYNOPSIS
Creates an Azure Virtual Network and subnet.

.DESCRIPTION
Creates a virtual network with a configurable address space and subnet.

.PARAMETER ResourceGroupName
Existing Azure Resource Group.

.PARAMETER VirtualNetworkName
Name of the new virtual network.

.PARAMETER Location
Azure region. Defaults to eastus.

.PARAMETER AddressPrefix
Virtual network address space.

.PARAMETER SubnetName
Name of the initial subnet.

.PARAMETER SubnetPrefix
Subnet address prefix.

.EXAMPLE
.\new-virtual-network.ps1 `
    -ResourceGroupName rg-portfolio-eastus `
    -VirtualNetworkName vnet-portfolio-eastus
#>

[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]$ResourceGroupName,

    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]$VirtualNetworkName,

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$Location = "eastus",

    [Parameter()]
    [ValidatePattern("^\d{1,3}(\.\d{1,3}){3}/\d{1,2}$")]
    [string]$AddressPrefix = "10.10.0.0/16",

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$SubnetName = "default",

    [Parameter()]
    [ValidatePattern("^\d{1,3}(\.\d{1,3}){3}/\d{1,2}$")]
    [string]$SubnetPrefix = "10.10.1.0/24"
)

try {
    if (-not (Get-AzContext)) {
        throw "No Azure session detected. Run Connect-AzAccount first."
    }

    Get-AzResourceGroup `
        -Name $ResourceGroupName `
        -ErrorAction Stop |
        Out-Null

    $ExistingNetwork = Get-AzVirtualNetwork `
        -ResourceGroupName $ResourceGroupName `
        -Name $VirtualNetworkName `
        -ErrorAction SilentlyContinue

    if ($ExistingNetwork) {
        throw "Virtual network '$VirtualNetworkName' already exists."
    }

    $SubnetConfig = New-AzVirtualNetworkSubnetConfig `
        -Name $SubnetName `
        -AddressPrefix $SubnetPrefix

    if ($PSCmdlet.ShouldProcess(
        $VirtualNetworkName,
        "Create Azure Virtual Network"
    )) {
        $VirtualNetwork = New-AzVirtualNetwork `
            -ResourceGroupName $ResourceGroupName `
            -Name $VirtualNetworkName `
            -Location $Location `
            -AddressPrefix $AddressPrefix `
            -Subnet $SubnetConfig `
            -ErrorAction Stop

        [PSCustomObject]@{
            Name          = $VirtualNetwork.Name
            ResourceGroup = $VirtualNetwork.ResourceGroupName
            Location      = $VirtualNetwork.Location
            AddressSpace  = $VirtualNetwork.AddressSpace.AddressPrefixes -join ", "
            SubnetName    = $VirtualNetwork.Subnets.Name -join ", "
            SubnetPrefix  = $VirtualNetwork.Subnets.AddressPrefix -join ", "
            Provisioning  = $VirtualNetwork.ProvisioningState
        }
    }
}
catch {
    Write-Error "Virtual network deployment failed. $($_.Exception.Message)"
}
