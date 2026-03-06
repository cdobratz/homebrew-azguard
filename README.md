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

## Commands

### Azure

| Command | Description |
|---------|-------------|
| `azguard status` | Quick overview of your Azure free tier status |
| `azguard scan` | Scan for Azure free tier overages |
| `azguard resources` | List resources with status indicators |
| `azguard budget add [amount]` | Add a budget alert ($1-$100) |
| `azguard budget list` | List all budget alerts |
| `azguard cost current` | Show current month costs |
| `azguard cost history` | Show cost history |
| `azguard cleanup` | Interactive cleanup guide |

### AWS

| Command | Description |
|---------|-------------|
| `azguard aws status` | Check your AWS free tier usage |
| `azguard aws scan` | Scan AWS services approaching limits |
| `azguard aws alerts --threshold 80` | Set alert thresholds (percentage) |
| `azguard aws resources` | List free tier eligible services |
| `azguard aws cost` | View AWS cost breakdown |

## Requirements

- Azure subscription
- Azure CLI `az` authenticated

For more commands and options, see the [Full Documentation](https://github.com/cdobratz/AzGuard)

