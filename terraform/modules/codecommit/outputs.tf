output "repository_name" {
  description = "Name of the repository."
  value       = module.codecommit.codecommit_repository.repository_name
}
