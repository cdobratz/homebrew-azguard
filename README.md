# homebrew-azguard

Homebrew tap for [AzGuard](https://github.com/cdobratz/AzGuard)  One command to make sure your Azure and AWS free tiers don't surprise you with a bill.

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
# Quick status check
azguard status

# Scan for free tier overages
azguard scan

# Add a budget alert
azguard budget add 50

# Find idle and orphaned resources
azguard resources

# Poll for new billable resources
azguard watch

# Block a billable command that would exceed a session budget
azguard guard --budget 25 -- aws ec2 run-instances --instance-type t3.micro

# Interactive cleanup guide
azguard cleanup

# Fetch latest costs and show the current month
azguard cost fetch
azguard cost current
```

## Commands

### Azure

| Command | Description |
|---------|-------------|
| `azguard status` | Quick overview of your Azure free tier status |
| `azguard scan` | Scan for Azure free tier overages |
| `azguard resources` | Find idle and orphaned resources, with a monthly cost estimate |
| `azguard watch` | Poll for new billable resources and alert |
| `azguard guard` | Block billable commands that exceed a session budget |
| `azguard budget add [amount]` | Add a budget alert ($1-$100) |
| `azguard budget list` | List all budget alerts |
| `azguard budget remove [name]` | Remove a budget alert |
| `azguard budget presets` | Show preset budget options |
| `azguard cost fetch` | Fetch and store costs from Azure |
| `azguard cost current` | Show current month costs |
| `azguard cost history` | Show cost history |
| `azguard cost forecast` | Show cost forecast |
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

Never store AWS access keys, secret keys, or session tokens in the AzGuard config file. AzGuard reads cloud secrets from the AWS CLI (profiles and IAM Identity Center SSO) or from environment variables. The same rule applies to an Azure client secret: do not put `client_secret` in the file.

Config file: `~/.azguard/config.yaml`

```yaml
azure:
  auth_method: cli  # or service_principal
  subscription_id: YOUR_SUB_ID
  # Do not put client_secret in this file.

aws:
  region: us-east-1  # optional, uses AWS CLI default
  # Do not put access keys in this file.

storage:
  path: ~/.azguard/data.db
```

### AWS CLI profiles

A configured AWS CLI profile is the usual setup. AzGuard asks the AWS CLI for credentials with `aws configure export-credentials`. That uses the default profile, or the profile named by `AWS_PROFILE`.

```bash
aws configure
export AWS_PROFILE=your-profile
```

### Environment variables

These environment variables override the OS keychain. Set only the ones you use. `AWS_SESSION_TOKEN` is for temporary credentials. `AWS_DEFAULT_REGION` applies when the config file does not set `aws.region`.

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_SESSION_TOKEN`
- `AWS_DEFAULT_REGION`

`AZURE_CLIENT_SECRET` is the Azure equivalent. Do not copy that value into the config file.

### IAM Identity Center (SSO)

Sign in with the AWS CLI, then run AzGuard. The CLI export above picks up the SSO session for the default profile or for `AWS_PROFILE`.

```bash
aws sso login
aws sso login --profile your-profile
```

If a config file still has `access_key`, `secret_key`, `session_token`, or `client_secret`, the next start copies those values into the OS keychain (service name `azguard`) and removes them from the file. When the keychain is unavailable, the file is left as it is.

### Required IAM Permissions

- `ce:GetCostAndUsage` — Cost Explorer queries
- `freetier:GetFreeTierUsage` — Free tier usage data

## Requirements

### Azure

- Azure subscription
- Azure CLI (`az`) authenticated

### AWS

- AWS account (free tier eligible)
- AWS credentials from an AWS CLI profile, IAM Identity Center (SSO), or environment variables (see above)

## Other Install Methods

- **Scoop (Windows):** `scoop bucket add azguard https://github.com/cdobratz/scoop-azguard && scoop install azguard`
- **Direct:** Download from [GitHub Releases](https://github.com/cdobratz/AzGuard/releases)

For more commands and options, see the [full documentation](https://github.com/cdobratz/AzGuard).
