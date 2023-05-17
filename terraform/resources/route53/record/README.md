# Amazon Route53 Record Terraform Resource

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

| Name                                                                                                                  | Type     |
| --------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_route53_record.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |

## Inputs

| Name                                                   | Description                                   | Type           | Default | Required |
| ------------------------------------------------------ | --------------------------------------------- | -------------- | ------- | :------: |
| <a name="input_alias"></a> [alias](#input_alias)       | Dynamic block for create alias records.       | `list(any)`    | `[]`    |    no    |
| <a name="input_name"></a> [name](#input_name)          | Name of the record.                           | `string`       | n/a     |   yes    |
| <a name="input_records"></a> [records](#input_records) | A string list of records.                     | `list(string)` | `[]`    |    no    |
| <a name="input_ttl"></a> [ttl](#input_ttl)             | TTL of the record.                            | `number`       | `300`   |    no    |
| <a name="input_type"></a> [type](#input_type)          | Type of the record.                           | `string`       | n/a     |   yes    |
| <a name="input_zone_id"></a> [zone_id](#input_zone_id) | ID of the hosted zone to contain this record. | `string`       | n/a     |   yes    |

## Outputs

| Name                                                                          | Description                     |
| ----------------------------------------------------------------------------- | ------------------------------- |
| <a name="output_route53_record"></a> [route53_record](#output_route53_record) | Amazon Route53 record resource. |
