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

variable "remote_backend" {
  type = object({
    s3_bucket = object({
      bucket_name = string
    })

    dynamodb_table = object({
      name         = string
      billing_mode = string
      hash_key     = string
    })
  })

  default = {
    s3_bucket = {
      bucket_name = "mini-aws-devops-course-remote-backend"
    }

    dynamodb_table = {
      name         = "mini-aws-devops-course-remote-backend-locks"
      billing_mode = "PAY_PER_REQUEST"
      hash_key     = "LockID"
    }
  }
}
