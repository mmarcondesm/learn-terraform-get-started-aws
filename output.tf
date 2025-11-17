output "instance_hostname" {
  description = "Private DNS name of the EC2 instance."
  value       = aws_instance.app_server.private_dns
}
output "s3_account_public_access_block_id" {
  description = "AWS account ID"
  value = try(aws_s3_account_public_access_block.this[0].id, "")
}
