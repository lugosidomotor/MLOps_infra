# 💻 🔗 Related Repo
https://github.com/lugosidomotor/MLOps_app

# ⚠️ Disclaimer

This project is a Minimal Viable Homework (MVH) implementation. It contains the bare minimum sophistication required to fulfill the assignment's specifications. The infrastructure and code provided here are intentionally simplified and may not reflect best practices or production-ready solutions. This project's sole purpose is to demonstrate a basic understanding of the concepts and to meet the minimum requirements of the assigned task.

## Known Areas for Improvement

- **Modules:** Refinement and better organization.
- **Finetuned Details:** Enhanced precision and accuracy in implementation.
- **Private Endpoints:** Improved security measures.
- **Security:** Strengthened protocols and practices.
- **Networking:** Optimization and more robust configuration.
- **Separate Deploy and Delete:** Clearer separation of deployment and deletion processes.
- **Separate Plan and Apply:** Distinct and streamlined planning and application phases.
- **Versioning:** More effective version control based on Helm.
- **Helm:** Better utilization and management of Helm charts.
- **Different Repos for Charts:** Improved organization with separate repositories for charts.
- **More Elegant Deployment:** Instead of local execution.
- **App of Apps ArgoCD Strategy:** Adoption of the Argo strategy for managing multiple applications.

# 🚀 How to Use:

1. Create a SP:
```bash
az ad sp create-for-rbac --name "gitHubAction" --role="Contributor" --scopes="/subscriptions/YOUR_SUBSCRIPTION_ID"
```

2. Convert the output into the following format:
```bash
{
  "clientId": "************************",
  "subscriptionId": "************************",
  "clientSecret": "************************",
  "tenantId": "************************"
}
```
3. Upload it as `AZURE_CREDENTIALS` Repository secret

4. Upload the tenantId as `AZURE_TENAND_ID` Repository secret

5. Trigger the workflow manually from the Actions tab in the GitHub repository
![](pics/usage.jpg)


# ⚒️ Terraform Key Components

- Azure Kubernetes Service (AKS)
- Azure Storage Account
- ArgoCD

# 🔄 GitHub Actions Workflow

This repository includes a GitHub Actions workflow for deploying and destroying the Terraform infrastructure.

### Workflow: Deploy/Destroy Terraform

- **Trigger**: Manual (workflow_dispatch)
- **Inputs**:
  - `terraform-action`: Choose between 'apply' or 'destroy'
  - `azure-region`: Azure region (default: 'germanywestcentral')
  - `company`: Company name (default: 'spatially')
  - `environment`: Environment name (default: 'dev')

### Key Steps:

1. Checkout repository
2. Install Terraform
3. Azure Login
4. Ensure Resource Group exists
5. Check/Create Azure Storage Account
6. Initialize Terraform
7. Format and Validate Terraform files
8. Plan Terraform changes
9. Apply or Destroy based on input

### Additional Features:

- Publishes Terraform plan as an artifact
- Creates a pull request for any automated formatting changes
- Uses Azure backend for storing Terraform state


