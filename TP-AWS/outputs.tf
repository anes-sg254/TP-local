output "bucket_id" {
  description = "Identifiant du bucket S3"
  value       = aws_s3_bucket.demo_bucket.id
}