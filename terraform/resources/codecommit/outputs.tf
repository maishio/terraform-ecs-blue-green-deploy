# AWS CodeCommit
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codecommit_repository

output "codecommit_repository" {
  description = "AWS CodeCommit Repository resource."
  value       = aws_codecommit_repository.this
}
