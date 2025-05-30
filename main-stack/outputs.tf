output "sqs_queue_urls" {
  value = aws_sqs_queue.this[*].id
}
