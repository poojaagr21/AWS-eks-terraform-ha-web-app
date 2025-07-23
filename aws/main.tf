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
                      source          = "terraform-aws-modules/eks/aws"
                        version         = "20.8.4"

                          cluster_name    = var.cluster_name
                            cluster_version = "1.27"
                              vpc_id          = data.aws_vpc.default.id
                                subnet_ids      = data.aws_subnets.default.ids

                                  node_groups = {
                                        default = {
                                                desired_capacity = var.desired_capacity
                                                      max_capacity     = 2
                                                            min_capacity     = 1

                                                                  instance_type    = var.node_instance_type
                                                                      }
                                                                        }
                                                                      }
