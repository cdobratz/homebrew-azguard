# homebrew-azguard

Homebrew tap for [AzGuard](https://github.com/cdobratz/AzGuard) — One command to make sure your Azure and AWS free tiers don't surprise you with a bill.

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

## AWS Credential Setup

AzGuard resolves AWS credentials in the following order:

1. **AzGuard config file** (`~/.azguard/config.yaml`):
   ```yaml
   aws:
     access_key: "YOUR_ACCESS_KEY"
     secret_key: "YOUR_SECRET_KEY"
     region: "us-east-1"
   ```

2. **Environment variables:**
   ```bash
   export AWS_ACCESS_KEY_ID="YOUR_ACCESS_KEY"
   export AWS_SECRET_ACCESS_KEY="YOUR_SECRET_KEY"
   export AWS_DEFAULT_REGION="us-east-1"
   ```

3. **AWS CLI** (automatic fallback — if you've already run `aws configure`, AzGuard picks up those credentials)

### Required IAM Permissions

- `ce:GetCostAndUsage` — Cost Explorer queries
- `freetier:GetFreeTierUsage` — Free tier usage data

## Requirements

### Azure

- Azure subscription
- Azure CLI (`az`) authenticated

### AWS

- AWS account (free tier eligible)
- AWS credentials configured (see above)

## Other Install Methods

- **Scoop (Windows):** `scoop bucket add azguard https://github.com/cdobratz/scoop-azguard && scoop install azguard`
- **Direct:** Download from [GitHub Releases](https://github.com/cdobratz/AzGuard/releases)

For more commands and options, see the [full documentation](https://github.com/cdobratz/AzGuard).

