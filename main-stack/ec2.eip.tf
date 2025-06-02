# https://registry.terraform.io/providers/hashicorp/aws/5.99.0/docs/resources/eip

resource "aws_eip" "this" {
  domain = "vpc"

  tags = {
    Name = var.vpc.nat_gateway_name
  }
}