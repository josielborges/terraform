# https://registry.terraform.io/providers/hashicorp/aws/5.99.0/docs/resources/vpc

resource "aws_vpc" "this" {
  cidr_block = var.vpc.cidr_block

  tags = {
    Name = var.vpc.name
  }
}

