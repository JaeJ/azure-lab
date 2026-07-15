# Changelog

All notable changes to this Azure Lab project will be documented in this file.

---

## Foundation

### Added

- Added Azure Resource Group creation.
- Added Azure resource listing.
- Added lab cleanup automation.
- Added architecture and troubleshooting documentation.
- Added repository README, license, and `.gitignore`.

---

## Azure Resource Expansion

### Added

- Added `create-storage-account.ps1`.
- Added `create-virtual-network.ps1`.
- Added `create-network-security-group.ps1`.
- Added `create-virtual-machine.ps1`.
- Added `new-storage-account.ps1`.
- Added secure StorageV2 deployment defaults.
- Added storage account name validation.
- Added `-WhatIf` support through `SupportsShouldProcess`.
- Added `new-virtual-network.ps1`.
- Added configurable virtual network and subnet address ranges.
- Added virtual network existence validation.
- Added `get-azure-resource-inventory.ps1`.
- Added current-subscription and resource-group inventory reporting.
- Added optional CSV export.

### Documentation

- Updated `examples/sample-output.md`.
- Updated `docs/lab-progress.md`.
- Updated `scripts/README.md`.
- Updated the root README repository structure.
- Updated the root README project script table.
- Added root-level `CHANGELOG.md`.
