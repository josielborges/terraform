# https://registry.terraform.io/providers/hashicorp/aws/5.99.0/docs/resources/internet_gateway

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = var.vpc.internet_gateway_name
  }
}