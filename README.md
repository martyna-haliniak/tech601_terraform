# Terraform & Infrastructure as Code 

- [Terraform \& Infrastructure as Code](#terraform--infrastructure-as-code)
  - [What is Infrastructure as Code (IaC)?](#what-is-infrastructure-as-code-iac)
  - [Two Main Types of IaC](#two-main-types-of-iac)
    - [a) **Declarative (Functional)**: Ochestration](#a-declarative-functional-ochestration)
    - [b) **Imperative (Procedural)**: Config Management](#b-imperative-procedural-config-management)
  - [Why is Terraform so popular?](#why-is-terraform-so-popular)
  - [How does Terraform work?](#how-does-terraform-work)
  - [What is `terraform.tfstate`?](#what-is-terraformtfstate)
    - [Why it’s important and sensitive:](#why-its-important-and-sensitive)
- [Terraform Setup](#terraform-setup)


## What is Infrastructure as Code (IaC)?
**Infrastructure as Code (IaC)** is the practice of managing and provisioning infrastructure (servers, networks, storage, etc.) using **machine-readable configuration files** instead of manual processes.  
- Benefits: Consistency, repeatability, version control, and automation. (faster, standardised, collaborative)


## Two Main Types of IaC
There are **two main types** of IaC:

### a) **Declarative (Functional)**: Ochestration 
- You **define the desired state** of the infrastructure.
- Tool figures out **how to achieve it**.
- Example tools:
  - **Terraform**
  - **CloudFormation** (AWS)
- Pros: Easier to manage complex systems, idempotent (running it multiple times doesn’t change existing resources unnecessarily).

Example: this would e.g. build the EC2

Immutable: if changes it will delete and remake things rather than update.

### b) **Imperative (Procedural)**: Config Management
- You **define the exact steps** to create or change infrastructure.
- Tool executes **step by step commands**.
- Example tools:
  - **Ansible**
  - **Chef**
- Pros: More control over execution order, useful for configuration management.

Example: go into the EC2 VM and install nginx (dependencies, restarts, updates)

Mutable: Updates instead of replacing when changes are made

---



## Why is Terraform so popular?
- **Cloud-agnostic**: Works across AWS, Azure, GCP, and more.  
- **Declarative & Idempotent**: Only makes changes needed to reach desired state.  
- **Large community & ecosystem**: Lots of modules and support.  
- **Open-source**: Free to use and extend.  



## How does Terraform work?
1. Write **.tf configuration files** describing infrastructure.  
2. Run `terraform init` → initializes working directory, downloads providers.  
3. Run `terraform plan` → shows what changes Terraform will make.  
4. Run `terraform apply` → creates or updates resources to match configuration.  
5. Run `terraform destroy` → deletes all managed resources if needed.  

- Terraform uses **providers** to interact with cloud services.
- It uses a **graph-based approach** to understand resource dependencies.


## What is `terraform.tfstate`?
- `terraform.tfstate` is the **state file** that Terraform uses to track resources it manages.  
- It contains: IDs, metadata, and relationships of all resources.  

### Why it’s important and sensitive:
- Terraform needs it to know **what exists** in your infrastructure.  
- If lost or corrupted:
  - Terraform may **recreate existing resources** (can cause downtime or duplication).  
- Sensitive because it may contain **secrets, access keys, or private resource IDs**.  
- Best practices:
  - **Store remotely** (S3, Terraform Cloud, etc.)  
  - **Lock state** when multiple people are working on the same infrastructure.

---

**Tip:** Always version-control your `.tf` files, but **never commit the `terraform.tfstate`** with sensitive info.


# Terraform Setup 

