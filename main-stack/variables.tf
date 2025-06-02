variable "authentication" {
  type = object({
    assume_role_arn = string
    region          = string
  })
  default = {
    assume_role_arn = "arn:aws:iam::717013025567:role/MiniAWSDevOpsCourseRole"
    region          = "us-east-1"
  }
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "production"
    Project     = "mini-aws-devops-course"
  }
}

variable "vpc" {
  type = object({
    name                     = string
    internet_gateway_name    = string
    cidr_block               = string
    public_route_table_name  = string
    private_route_table_name = string
    nat_gateway_name         = string
    public_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
    private_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
  })
  default = {
    name                     = "mini-aws-devops-course-vpc"
    internet_gateway_name    = "mini-aws-devops-course-internet-gateway"
    cidr_block               = "10.0.0.0/24"
    public_route_table_name  = "mini-aws-devops-course-public-route-table"
    private_route_table_name = "mini-aws-devops-course-private-route-table"
    nat_gateway_name         = "mini-aws-devops-course-nat-gateway"
    public_subnets = [
      {
        name                    = "mini-aws-devops-course-vpc-public-subnet-1a"
        cidr_block              = "10.0.0.0/26"
        availability_zone       = "us-east-1a"
        map_public_ip_on_launch = true
      },
      {
        name                    = "mini-aws-devops-course-vpc-public-subnet-1c"
        cidr_block              = "10.0.0.64/26"
        availability_zone       = "us-east-1c"
        map_public_ip_on_launch = true
      }
    ]
    private_subnets = [
      {
        name                    = "mini-aws-devops-course-vpc-private-subnet-1a"
        cidr_block              = "10.0.0.128/26"
        availability_zone       = "us-east-1a"
        map_public_ip_on_launch = false
      },
      {
        name                    = "mini-aws-devops-course-vpc-private-subnet-1c"
        cidr_block              = "10.0.0.192/26"
        availability_zone       = "us-east-1c"
        map_public_ip_on_launch = false
      }
    ]
  }
}

# variable "eip" {
#   type = object({
#     name = string
#   })
#   default = {
#     name = "mini-aws-devops-course-eip"
#   }
# }