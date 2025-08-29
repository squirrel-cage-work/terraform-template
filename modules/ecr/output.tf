output "ecr_repository_url" {
    description = "The Url of ECR"
    value       = aws_ecr_repository.this.repository_url
}