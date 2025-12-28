# Secure Azure Web App with Governance (Bicep)

## Overview
This repository contains the **Infrastructure as Code (IaC)** implementation of a secure Azure Web Application using **Bicep**.
It is the Bicep-based replication of a solution previously deployed **manually via the Azure Portal**, focusing on **security, identity, and governance**.

## Azure Services Used
- Azure App Service (Linux)
- App Service Plan (Free Tier – F1)
- System-Assigned Managed Identity
- Azure Key Vault (RBAC enabled)
- Azure Policy (governance enforcement)

## Security & Governance
- Managed Identity is used instead of secrets.
- Key Vault is configured with RBAC authorization.
- Azure Policy is used to enforce governance and mitigate RBAC propagation delays encountered during manual deployment.
- HTTPS-only access is enforced for the web application.

## Author
**Victor Olasehinde** 
