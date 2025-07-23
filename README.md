
// START GENAI
# Multi-Cloud HA Demo

## What does this project do?

This project demonstrates a simple, highly available web application deployed on both AWS (EKS) and GCP (GKE) Kubernetes clusters. The application is exposed via cloud load balancers, and DNS failover (using AWS Route53) ensures users are always directed to a healthy endpoint, even if one provider goes down.

## Tech Stack

- **AWS EKS:** Managed Kubernetes cluster on AWS
- **GCP GKE:** Managed Kubernetes cluster on Google Cloud
- **Terraform:** Infrastructure as Code for provisioning clusters and resources
- **Kubernetes:** For container orchestration and app deployment
- **AWS Route53:** DNS failover and health checks
- **GitHub Actions:** (Optional) CI/CD automation

## Why this approach?

- **High Availability:** Deploying across multiple clouds reduces the risk of downtime due to a single provider outage.
- **Resilience:** DNS-based health checks and failover keep the service available even if a region or provider fails.
- **Modern DevOps Practice:** Demonstrates use of IaC, managed K8s, and CI/CD, mirroring real-world SRE/DevOps workflows.

// END GENAI
