
# Write a Terraform Project consuming terraform code from one module to deploy an AKS and X namespaces inside of the cluster based on terraform variable “namespaces” [type list(string)] [ Part1, Task 3 ]

In this project, we will be creating AKS cluster with 3 name spaces provided as list in terraform.tfvars file.

## Below resources will be created using this terraform configuration:-
- Resource Group
- Service Principle
- AKS cluster using the SPN
- 3 Namespaces
- Azure key vault to store the client secret
- Secret uploaded to key vault
- Kubeconfig for AKS

## Pre-requisites

- kubectl cli installed
- Azure CLI installed and logged in


## Usage/Examples

### 1) login to the CLI
```shell
az login --use-device-code
```
### 2) set alias
```shell
alias tf=terraform
```
### 3) initialize the providers
```shell
tf init
```
### 4) Run the plan
```shell
tf plan
```
### 5) Apply the changes
```shell
tf apply --auto-approve
```

# Azure DevOps pipeline to deploy a terraform project to 3 different environments [Part1, Task 4]

I have created Azure Pipeline yml file in this repo which will have code to deploy current terraform project into 3 environments. It uses templates for job which will accept parameter from stage and reuse same code in templates folder to deploy to different environments. I will present it in our interview.

Pipeline job can be found here https://dev.azure.com/shahzeb799/TestApi/_build?definitionId=3&_a=summary but i would need to add indiviuals as readers.

# GitOps - a new emerging DevOps Technology [ Part2 ]

GitOps is a software development methodology and operational model that utilizes Git as the single source of truth for defining infrastructure and application delivery. In GitOps, all aspects of the system, including infrastructure configurations, application code, and deployment manifests, are stored in a Git repository. Changes made to this repository trigger automated workflows that update the target environment to match the desired state specified in the repository.

# Pros of GitOps

- Infrastructure as Code (IaC): GitOps promotes the use of infrastructure as code, enabling teams to manage infrastructure configurations in a version-controlled manner. This enhances reproducibility, consistency, and scalability of infrastructure deployments.

- Version Control: Leveraging Git for configuration management provides versioning capabilities, enabling teams to track changes, revert to previous states, and collaborate effectively.

- Automated Continuous Delivery: By using Git as the source of truth and leveraging automation tools like CI/CD pipelines, GitOps facilitates continuous delivery practices, allowing teams to deploy changes rapidly and reliably.

- Simplified Rollbacks: GitOps makes it easier to roll back changes by reverting commits in the Git repository, providing a straightforward mechanism to restore the system to a known good state in case of issues.

- Increased Collaboration: With all configurations and code stored in a central repository, collaboration among team members becomes more efficient. Changes are visible to everyone, fostering transparency and knowledge sharing.

- Immutable Infrastructure: GitOps encourages treating infrastructure as immutable, where changes are made by updating definitions in the Git repository rather than directly modifying running systems. This promotes consistency and reduces configuration drift.

# Cons of GitOps

- Complexity: Implementing GitOps involves setting up robust CI/CD pipelines, automation scripts, and integrating with infrastructure management tools. Managing this complexity effectively can be challenging, especially for smaller teams or those new to DevOps practices.

- Potential Overhead: Maintaining a GitOps workflow requires ongoing management of Git repositories, CI/CD pipelines, and automation scripts. While this overhead can lead to efficiency gains in the long run, it may initially require additional time and effort.

- Security Concerns: Storing infrastructure configurations and deployment scripts in a version-controlled repository raises security considerations. Access controls, encryption, and best practices for managing secrets must be implemented to mitigate risks.

## Sample Project for GitOps

I have created a sample .net API which returns weatherdata to user via browser. This project consists of 3 parts:

- [Infrastructure provisioning](https://github.com/shahzeb79/terraform) using Terraform via AzureDevops Pipeline
- CI of [.Net app](https://github.com/shahzeb79/TestApi) via AzureDevops
- CD of [.Net app](https://github.com/shahzeb79/Kube_Manifest_TestApi/tree/main) to kubernetes provisioned in 1st step via ArgoCD

This whole prcess is controlled via code in github repor. Any changes to application source code will trigger CI pipeline in Azure Devops which will deploy final container to Docker registry. CI pipeline will also update our deployment manifests in another github repo. The update of manifests in deployment repo will automatically trigger ArgoCD job that will deploy our containers to kubernetes. I will show this in demo on interview day.