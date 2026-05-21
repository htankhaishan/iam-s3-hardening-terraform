# Security Policy

This repository is public and must not contain secrets or real production identifiers.

## Do Not Commit

- AWS access keys or secret keys
- `.env` files
- `.tfvars` files with real values
- Terraform state files
- private keys such as `.pem`, `.key`, or `id_rsa`
- kubeconfig files
- passwords, API tokens, webhook URLs, or Slack URLs

Use placeholder values in documentation and keep real values in your local environment, a secure secret manager, or CI/CD secret storage.
