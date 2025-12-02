# Create a new instance of the latest Ubuntu 20.04 on an
# t3.micro node with an AWS Tag naming it "HelloWorld"

                                                                                      # Sources de doc

# template de déploiement d'une instance AWS EC2 que j'ai trouvé sur la doc officielle d'HashiCorp -- https://registry.terraform.io/providers/hashicorp/aws/3.6.0/docs/resources/instance#availability_zone-1

# https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-create


# terraform block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.2"
}

# provider
provider "aws" {
  region = "eu-west-1"  
}





