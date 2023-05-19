# AWS CodeCommit
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codecommit_repository

variable "default_branch" {
  description = "Default branch of the repository. The branch specified here needs to exist."
  type        = string
  default     = "master"
}

variable "description" {
  description = "Description of the repository."
  type        = string
  default     = null
}

variable "repository_name" {
  description = "Name for the repository."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
