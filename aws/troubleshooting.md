AWS EKS Terraform Module + Git Troubleshooting – Step-by-Step
1. Set Up EKS with Terraform
Wrote a main.tf with the terraform-aws-modules/eks/aws module.
Specified EKS version 20.8.4 and tried to use manage_aws_auth_configmap and aws_auth_users in the module block (as in older module versions).
2. Ran Into Terraform Errors
Got "unsupported argument" errors for manage_aws_auth_configmap and aws_auth_users.
Discovered that in version 20+, those arguments must go in a separate aws-auth submodule, not the main EKS module.
3. Tried to Use the New aws-auth Submodule
Added a new module "aws_auth" block using the submodule syntax:
// START GENAI
module "aws_auth" {
  source  = "terraform-aws-modules/eks/aws//modules/aws-auth"
  version = "20.8.4"
  ...
}

Still got "unsupported argument" errors for eks_cluster_name and map_users.
4. Investigated Module Download Issues
Checked inside the downloaded submodule files.
Discovered the files were from an old version of the module, even though version 20.8.4 was requested.
Confirmed this by manually downloading the module ZIP and inspecting the files—they did NOT have the expected variables.
5. Root Cause Identified
The environment (AWS CloudShell, or its network/proxy) was serving old, cached, or corrupted versions of the Terraform module from GitHub.
This prevented the use of new module features and inputs.
6. Workarounds and Next Steps
Tried fully clearing caches, re-initializing Terraform, and even manually downloading the module—still got the old files.
Decided to try again later, or from a different machine/network, as the issue is likely a proxy/CDN cache outside your control.
As an interim solution, suggested manually updating the aws-auth config map in the AWS EKS Console if immediate access is needed.
7. Git Workflow Issue and Solution
When pushing to GitHub, got an error:
Updates were rejected because the remote contains work that you do not have locally.
Fixed by running:

Problem Solution/Action
Terraform EKS module "unsupported arg"  Use aws-auth submodule for user mapping in v20+
Module still "unsupported arg"  Discovered module cache/proxy serving old files
Module files old after clean/re-init    Confirmed environment/network issue
Git push rejected by remote Pulled latest changes, resolved conflicts, pushed again

