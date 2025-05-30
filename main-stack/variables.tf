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

variable "queue" {
  type = list(object({
    name                      = string
    delay_seconds             = number
    max_message_size          = number
    message_retention_seconds = number
    receive_wait_time_seconds = number
  }))

  default = [{
    name                      = "terraform-example-queue-01"
    delay_seconds             = 90
    max_message_size          = 2048
    message_retention_seconds = 86400
    receive_wait_time_seconds = 10
    },
    {
      name                      = "terraform-example-queue-02"
      delay_seconds             = 90
      max_message_size          = 2048
      message_retention_seconds = 86400
      receive_wait_time_seconds = 10
  }]
}
