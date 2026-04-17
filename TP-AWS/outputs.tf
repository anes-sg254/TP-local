output "instance_id" {
  description = "ID of the EC2 web instance"
  value       = aws_instance.example.id
}

output "database_instance_id" {
  description = "ID of the EC2 database instance"
  value       = aws_instance.database.id
}
output "bucket_id" {
  description = "Identifiant du bucket S3"
  value       = aws_s3_bucket.demo_bucket.id
}