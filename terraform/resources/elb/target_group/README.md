# ELB (Elastic Load Balancing) Target Group Terraform Resource

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

| Name                                                                                                                    | Type     |
| ----------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_lb_target_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |

## Inputs

| Name                                                                                                                                    | Description                                                                                                                               | Type          | Default          | Required |
| --------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ------------- | ---------------- | :------: |
| <a name="input_deregistration_delay"></a> [deregistration_delay](#input_deregistration_delay)                                           | The amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused.           | `number`      | `300`            |    no    |
| <a name="input_health_check_enabled"></a> [health_check_enabled](#input_health_check_enabled)                                           | Whether health checks are enabled. Defaults to `true`.                                                                                    | `bool`        | `true`           |    no    |
| <a name="input_health_check_healthy_threshold"></a> [health_check_healthy_threshold](#input_health_check_healthy_threshold)             | Number of consecutive health check successes required before considering a target healthy. Defaults to `3`.                               | `number`      | `3`              |    no    |
| <a name="input_health_check_interval"></a> [health_check_interval](#input_health_check_interval)                                        | Time between health checks. Defaults to `30`.                                                                                             | `number`      | `30`             |    no    |
| <a name="input_health_check_matcher"></a> [health_check_matcher](#input_health_check_matcher)                                           | Response codes to use when checking for a healthy responses from a target.                                                                | `string`      | `null`           |    no    |
| <a name="input_health_check_path"></a> [health_check_path](#input_health_check_path)                                                    | Destination for the health check request.                                                                                                 | `string`      | `null`           |    no    |
| <a name="input_health_check_port"></a> [health_check_port](#input_health_check_port)                                                    | Port the load balancer uses when performing health checks on targets.                                                                     | `string`      | `"traffic-port"` |    no    |
| <a name="input_health_check_protocol"></a> [health_check_protocol](#input_health_check_protocol)                                        | Protocol the load balancer uses when performing health checks on targets. Defaults to `HTTP`.                                             | `string`      | `"HTTP"`         |    no    |
| <a name="input_health_check_timeout"></a> [health_check_timeout](#input_health_check_timeout)                                           | Amount of time to wait when receiving a response from the health check, in seconds. Defaults to `5`.                                      | `number`      | `5`              |    no    |
| <a name="input_health_check_unhealthy_threshold"></a> [health_check_unhealthy_threshold](#input_health_check_unhealthy_threshold)       | Number of consecutive health check failures required before considering a target unhealthy. Defaults to `3`.                              | `number`      | `3`              |    no    |
| <a name="input_lambda_multi_value_headers_enabled"></a> [lambda_multi_value_headers_enabled](#input_lambda_multi_value_headers_enabled) | Whether the request and response headers exchanged between the load balancer and the Lambda function include arrays of values or strings. | `bool`        | `false`          |    no    |
| <a name="input_name"></a> [name](#input_name)                                                                                           | Name of the target group.                                                                                                                 | `string`      | n/a              |   yes    |
| <a name="input_port"></a> [port](#input_port)                                                                                           | Port on which targets receive traffic, unless overridden when registering a specific target.                                              | `number`      | `null`           |    no    |
| <a name="input_protocol"></a> [protocol](#input_protocol)                                                                               | Protocol to use for routing traffic to the targets.                                                                                       | `string`      | `null`           |    no    |
| <a name="input_proxy_protocol_v2"></a> [proxy_protocol_v2](#input_proxy_protocol_v2)                                                    | Whether to enable support for proxy protocol v2 on Network Load Balancers. Defaults to `false`.                                           | `bool`        | `false`          |    no    |
| <a name="input_slow_start"></a> [slow_start](#input_slow_start)                                                                         | Amount time for targets to warm up before the load balancer sends them a full share of requests.                                          | `number`      | `0`              |    no    |
| <a name="input_stickiness_cookie_duration"></a> [stickiness_cookie_duration](#input_stickiness_cookie_duration)                         | Time period, in seconds, during which requests from a client should be routed to the same target. Defaults to `86400`.                    | `number`      | `86400`          |    no    |
| <a name="input_stickiness_enabled"></a> [stickiness_enabled](#input_stickiness_enabled)                                                 | Whether sticky sessions are enabled.                                                                                                      | `bool`        | `false`          |    no    |
| <a name="input_stickiness_type"></a> [stickiness_type](#input_stickiness_type)                                                          | Type of sticky sessions.                                                                                                                  | `string`      | `"lb_cookie"`    |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                                                                                           | A mapping of tags to assign to the resource.                                                                                              | `map(string)` | `{}`             |    no    |
| <a name="input_target_type"></a> [target_type](#input_target_type)                                                                      | Type of target that you must specify when registering targets with this target group.                                                     | `string`      | `"instance"`     |    no    |
| <a name="input_vpc_id"></a> [vpc_id](#input_vpc_id)                                                                                     | VPC ID.                                                                                                                                   | `string`      | `null`           |    no    |

## Outputs

| Name                                                                                | Description |
| ----------------------------------------------------------------------------------- | ----------- |
| <a name="output_elb_target_group"></a> [elb_target_group](#output_elb_target_group) | n/a         |
