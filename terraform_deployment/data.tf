# data image of ubuntu
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

#on choisit le vpc par défaut de la région eu-west-1
#doc officielle d'HashiCorp sur laquelle je me suis appuyé : https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc#argument-reference
data "aws_vpc" "default" {
  default = true
}

#après avoir choisit un vpc par défaut, on va choisir le subnet par défaut contenu dans ce même vpc, via .id : https://blog.pesky.moe/posts/2025-01-16-default-network/
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}
