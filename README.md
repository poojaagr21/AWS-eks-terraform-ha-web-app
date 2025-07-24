## Overview

This project demonstrates how to provision a highly available [AWS EKS (Elastic Kubernetes Service)](https://aws.amazon.com/eks/) cluster using [Terraform](https://www.terraform.io/) and deploy a sample "Hello World" application to it.

**Note:**  
While multi-cloud high-availability is a valuable topic, this project focuses on AWS EKS only for clarity, reliability, and due to environment constraints (e.g., AWS CloudShell disk space limits). Multi-cloud expansion is possible in the future.

## Project Goals

- Automate EKS cluster creation using Terraform.
- Deploy a Kubernetes application (Hello World) on AWS.
- Expose the app via an AWS LoadBalancer and test connectivity.
- Document the setup, troubleshooting, and outcomes.

## Tech Stack

- AWS EKS (Kubernetes)
- Terraform (Infrastructure as Code)
- AWS CLI & kubectl

## Quick Start

1. **Provision EKS with Terraform:**  
   - See [`main.tf`](./main.tf) and [`variables.tf`](./variables.tf) for configuration.
   - Run:
     ```sh
     terraform init
     terraform apply -auto-approve
     ```

2. **Configure kubectl:**
   ```sh
   aws eks update-kubeconfig --region <your-region> --name <your-cluster-name>
   kubectl get nodes
