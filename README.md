# AWS Terraform module for LoadBalancer Target Group

Terraform module which creates LoadBalancer Target Group resources on AWS.

## Usage

```hcl
module "tg" {
  source = "../../"

  name        = "tf-example-lb-tg"
  port        = 443
  protocol    = "tcp"
  target_type = var.target_type
  vpc_id      = var.vpc_id
  tags        = var.tags

}

  # amongst others. Omitted for brevity. Check Inputs.
  
}
```

## Constraints

If using "name_prefix", cannot be longer than 6 characters.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.10.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.74.2 |

## Modules

No sub modules.

## Resources

| Name | Type |
|------|------|
| [aws_lb_target_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the target group. If omitted, Terraform will assign a random, unique name. | `string` | `null` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Creates a unique name beginning with the specified prefix. Conflicts with name. Cannot be longer than 6 characters. | `string` | `null` | no |
| <a name="input_port"></a> [port](#input\_port) | Port on which targets receive traffic, unless overridden when registering a specific target. Required when target_type is instance, ip or alb. Does not apply when target_type is lambda. | `number` | `null` | maybe |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | Protocol to use for routing traffic to the targets. Should be one of GENEVE, HTTP, HTTPS, TCP, TCP_UDP, TLS, or UDP. Required when target_type is instance, ip or alb. Does not apply when target_type is lambda. | `string` | `null` | maybe |
| <a name="input_proxy_protocol_v2"></a> [proxy\_protocol\_v2](#input\_proxy\_protocol\_v2) | Whether to enable support for proxy protocol v2 on Network Load Balancers. | `bool` | `false` | no |
| <a name="input_target_type"></a> [target\_type](#input\_target\_type) | Type of target that you must specify when registering targets with this target group. | `string` | `instance` | maybe |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Identifier of the VPC in which to create the target group. Required when target_type is instance, ip or alb. Does not apply when target_type is lambda. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Key-value map of user-defined tags that are attached to the secret. | `map(string)` | `{}` | no |
| <a name="input_connection_termination"></a> [connection\_termination](#input\_connection\_termination) | Whether to terminate connections at the end of the deregistration timeout on Network Load Balancers. | `bool` | `false` | no |
| <a name="input_deregistration_delay"></a> [deregistration\_delay](#input\_deregistration\_delay) | Amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused. The range is 0-3600 seconds. | `string` | `300` | no |
| <a name="input_lambda_multi_value_headers_enabled"></a> [lambda\_multi\_value\_headers\_enabled](#input\_lambda\_multi\_value\_headers\_enabled) | Whether the request and response headers exchanged between the load balancer and the Lambda function include arrays of values or strings. Only applies when target_type is lambda. | `bool` | `false` | no |
| <a name="input_load_balancing_algorithm_type"></a> [load\_balancing\_algorithm\_type](#input\_load\_balancing\_algorithm\_type) | Determines how the load balancer selects targets when routing requests. Only applicable for Application Load Balancer Target Groups. The value is round_robin or least_outstanding_requests. | `string` | `round_robin` | no |
| <a name="input_preserve_client_ip"></a> [preserve\_client\_ip](#input\_preserve\_client\_ip) | Whether client IP preservation is enabled. | `string` | `null` | no |
| <a name="input_protocol_version"></a> [protocol\_version](#input\_protocol_version) | Only applicable when protocol is HTTP or HTTPS. The protocol version. Specify GRPC to send requests to targets using gRPC. Specify HTTP2 to send requests to targets using HTTP/2. The default is HTTP1, which sends requests to targets using HTTP/1.1. | `string` | `null` | no |
| <a name="input_slow_start"></a> [slow\_start](#input\_slow\_start) | Amount time for targets to warm up before the load balancer sends them a full share of requests. The range is 30-900 seconds or 0 to disable. | `number` | `0` | no |
| <a name="input_health_check_enabled"></a> [health\_check\_enabled](#input\_health\_check\_enabled) | Whether health checks are enabled.. | `bool` | `true` | no |
| <a name="input_healthy_threshold"></a> [healthy\_threshold](#input\_healthy\_threshold) | Number of consecutive health checks successes required before considering an unhealthy target healthy. | `number` | `3` | no |
| <a name="input_health_check_interval"></a> [health\_check\_interval](#input\_health\_check\_interval) | Approximate amount of time, in seconds, between health checks of an individual target. Minimum value 5 seconds, Maximum value 300 seconds. For lambda target groups, it needs to be greater as the timeout of the underlying lambda. | `number` | `30` | no |
| <a name="input_health_check_matcher"></a> [health\_check\_matcher](#input\_health\_check\_matcher) | Response codes to use when checking for a healthy responses from a target. You can specify multiple values or a range of values. Required for HTTP/HTTPS/GRPC ALB. Only applies to Application Load Balancers (i.e., HTTP/HTTPS/GRPC) not Network Load Balancers (i.e., TCP). | `string` | `null` | maybe |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | Destination for the health check request. Required for HTTP/HTTPS ALB and HTTP NLB. Only applies to HTTP/HTTPS. | `string` | `/` | maybe |
| <a name="input_health_check_port"></a> [health\_check\_port](#input\_health\_check\_port) | Port to use to connect with the target. Valid values are either ports 1-65535, or traffic-port. | `string` | `traffic-port` | no |
| <a name="input_health_check_protocol"></a> [health\_check\_protocol](#input\_health\_check\_protocol) | Protocol to use to connect with the target. Defaults to HTTP. Not applicable when target_type is lambda. | `string` | `HTTP` | no |
| <a name="input_health_check_timeout"></a> [health\_check\_timeout](#input\_health\_check\_timeout) | Amount of time, in seconds, during which no response means a failed health check. For Application Load Balancers, the range is 2 to 120 seconds, and the default is 5 seconds for the instance target type and 30 seconds for the lambda target type. For Network Load Balancers, you cannot set a custom value, and the default is 10 seconds for TCP and HTTPS health checks and 6 seconds for HTTP health checks. | `number` | `null` | no |
| <a name="input_stickiness_enabled"></a> [stickiness\_enabled](#input\_stickiness\_enabled) | Boolean to enable / disable stickiness. | `bool` | `true` | no |
| <a name="input_stickiness_cookie_duration"></a> [stickiness\_cookie\_duration](#input\_stickiness\_cookie\_duration) | Only used when the type is lb_cookie. The time period, in seconds, during which requests from a client should be routed to the same target. After this time period expires, the load balancer-generated cookie is considered stale. The range is 1 second to 1 week (604800 seconds). | `number` | `86400` | no |
| <a name="input_stickiness_type"></a> [stickiness\_type](#input\_stickiness\_type) | The type of sticky sessions. The only current possible values are lb_cookie, app_cookie for ALBs, and source_ip for NLBs. | `string` | `null` | yes |
| <a name="input_stickiness_cookie_name"></a> [stickiness\_type](#input\_stickiness\_type) | Name of the application based cookie. AWSALB, AWSALBAPP, and AWSALBTG prefixes are reserved and cannot be used. Only needed when type is app_cookie. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_output"></a> [output](#output\_output) | Target Group attributes |