terraform {
  required_version = ">= 1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.40"
    }
  }
}

provider "aws" {
  region = var.region
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

module "eks" {


source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

    cluster_name    = var.cluster_name
      cluster_version = "1.27"
        vpc_id          = data.aws_vpc.default.id

subnet_ids = [
      "subnet-04ef454bfee375b08", # us-east-1a
          "subnet-056a984e5eaf147b8", # us-east-1b
              "subnet-05eb9c6f881227976", # us-east-1c
                  "subnet-02e7976bf0115344d", # us-east-1d
                      "subnet-045d02480f5b4ead5", # us-east-1f
                        ]
 enable_irsa = true

  eks_managed_node_groups = {
    demo = {
      desired_size = var.desired_capacity
      max_size     = 2
      min_size     = 1

      instance_types = [var.node_instance_type]
    }
  }
}


