variable "region" {
    default = "us-east-1"
  }

  variable "cluster_name" {
      default = "eks-ha-demo"
    }


      variable "desired_capacity" {
          default = 1
        }
        variable "node_instance_type" {
            default = "t3.micro"
          }

