# Azure Lab Progress

This document tracks completed Azure administration work, documentation, testing, and planned improvements.

---

## Completed

### Repository Foundation

- [x] Created Azure Lab repository
- [x] Added professional root README
- [x] Added architecture documentation
- [x] Added troubleshooting notes
- [x] Added sample output
- [x] Added scripts documentation
- [x] Added `.gitignore`
- [x] Added MIT license

### Resource Management

- [x] `create-resource-group.ps1`
- [x] `list-azure-resources.ps1`
- [x] `cleanup-resource-group.ps1`
- [x] `get-azure-resource-inventory.ps1`

### Storage

- [x] `create-storage-account.ps1`
- [x] `new-storage-account.ps1`

### Networking

- [x] `create-virtual-network.ps1`
- [x] `new-virtual-network.ps1`
- [x] `create-network-security-group.ps1`

### Compute

- [x] `create-virtual-machine.ps1`

### Documentation

- [x] Updated repository structure
- [x] Updated project script table
- [x] Updated sample output
- [x] Updated scripts README
- [x] Added root changelog

---

## In Progress

- [ ] Test deployment scripts with `-WhatIf`
- [ ] Replace sample results with sanitized real output
- [ ] Review naming consistency between `create-*` and `new-*` scripts
- [ ] Confirm cleanup procedures after deployment testing

---

## Planned Improvements

- [ ] Azure Key Vault automation
- [ ] Azure Monitor configuration
- [ ] Azure Backup configuration
- [ ] Azure Policy reporting
- [ ] Microsoft Entra ID reporting
- [ ] Cost-management reporting
- [ ] Resource tagging validation
- [ ] Pester tests
- [ ] GitHub Actions validation
