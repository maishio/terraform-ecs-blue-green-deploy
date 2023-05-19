# AWS CodeCommit Terraform Resource

## Requirements

| Name      | Version  |
| --------- | -------- |
| terraform | >= 1.4.0 |

## Providers

| Name | Version   |
| ---- | --------- |
| aws  | ~> 4.62.0 |

## Modules

No modules.

## Resources

| Name                                                                                                                                | Type     |
| ----------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_codecommit_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codecommit_repository) | resource |

## Inputs

| Name                                                                           | Description                                                                 | Type          | Default    | Required |
| ------------------------------------------------------------------------------ | --------------------------------------------------------------------------- | ------------- | ---------- | :------: |
| <a name="input_default_branch"></a> [default_branch](#input_default_branch)    | Default branch of the repository. The branch specified here needs to exist. | `string`      | `"master"` |    no    |
| <a name="input_description"></a> [description](#input_description)             | Description of the repository.                                              | `string`      | `null`     |    no    |
| <a name="input_repository_name"></a> [repository_name](#input_repository_name) | Name for the repository.                                                    | `string`      | n/a        |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                  | A mapping of tags to assign to the resource.                                | `map(string)` | `{}`       |    no    |

## Outputs

| Name                                                                                               | Description                         |
| -------------------------------------------------------------------------------------------------- | ----------------------------------- |
| <a name="output_codecommit_repository"></a> [codecommit_repository](#output_codecommit_repository) | AWS CodeCommit Repository resource. |
