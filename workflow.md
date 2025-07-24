1. Project Setup
Goal: Show how to make a highly available web app by deploying to both AWS and (eventually) GCP.
Why: Demonstrates multi-cloud skills and failover resilience.
2. Repository Organization
Cleaned up .gitignore to ignore files that don’t belong in version control (like Terraform caches).
3. AWS Infrastructure as Code (Terraform)
Wrote Terraform code (main.tf, variables.tf, etc.) to define an Amazon EKS (Elastic Kubernetes Service) cluster.
Chose the latest, recommended open-source EKS module (terraform-aws-modules/eks/aws).
Specified which AWS region and which subnets to use, making sure only AWS-supported subnets/AZs are used for EKS.
Why:Terraform lets you define and manage cloud infrastructure as code, so you can automate, version, and repeat deployments.
4. Disk Space Management in CloudShell
Cleaned up unnecessary files from your AWS CloudShell environment (like old projects, installers, and caches) to make enough room for Terraform and EKS.
Learned how to identify and remove large or unnecessary files.
Why:CloudShell has a strict 1GB limit, and EKS/Terraform projects are heavy.
5. Debugging & Fixes
Solved several common Terraform issues:
Updated module and provider versions for compatibility.
Fixed subnet/AZ selection to avoid AWS EKS control plane problems.
Cleaned up duplicate Terraform outputs and unsupported attributes.
Re-downloaded and added Terraform to your PATH after deleting binaries.
Why:
These are common, real-world obstacles in cloud automation, and solving them is important DevOps experience.
6. Current Status
EKS cluster creation is in progress!
You are about to have a running Kubernetes cluster on AWS, ready for deploying your demo app.
What’s Next?
After EKS is ready, you’ll configure kubectl access and deploy a sample app.
(Optional for full project:) You’ll repeat similar steps on GCP, then add DNS failover.
