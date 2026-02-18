# homebrew-azguard

Homebrew tap for [AzGuard](https://github.com/cdobratz/AzGuard) — One command to make sure your Azure free tier doesn't surprise you with a bill.

## Install

```bash
brew install cdobratz/azguard/azguard
```

Or add tap first:

```bash
brew tap cdobratz/azguard
brew install azguard
```

## Usage

```bash
# Check your Azure free tier status
azguard status

# Scan resources approaching limits
azguard scan

# Set budget alerts
azguard budget --set 50

# List all resources
azguard resources

# Clean up unused resources
azguard cleanup

# View cost breakdown
azguard cost
```

## Requirements

- Azure subscription
- Azure CLI `az` authenticated

For more commands and options, see the [Full Documentation](https://github.com/cdobratz/AzGuard)

