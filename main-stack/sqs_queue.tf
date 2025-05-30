resource "aws_sqs_queue" "this" {
  count = length(var.queue) # Create multiple queues based on the length of the queue variable

  name                      = var.queue[count.index].name
  delay_seconds             = var.queue[count.index].delay_seconds
  max_message_size          = var.queue[count.index].max_message_size
  message_retention_seconds = var.queue[count.index].message_retention_seconds
  receive_wait_time_seconds = var.queue[count.index].receive_wait_time_seconds
}

# created after apply https://us-east-1.console.aws.amazon.com/sqs/v3/home?region=us-east-1#/queues