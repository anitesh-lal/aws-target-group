variable "name" {
  type        = string
  default     = null
  description = "(Optional, Forces new resource) Name of the target group. If omitted, Terraform will assign a random, unique name."
}

variable "name_prefix" {
  type        = string
  default     = null
  description = "(Optional, Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with name. Cannot be longer than 6 characters."
}

variable "port" {
  type        = number
  default     = null
  description = "(May be required, Forces new resource) Port on which targets receive traffic, unless overridden when registering a specific target. Required when target_type is instance, ip or alb. Does not apply when target_type is lambda."
}

variable "protocol" {
  type        = string
  default     = null
  description = "(May be required, Forces new resource) Protocol to use for routing traffic to the targets. Should be one of GENEVE, HTTP, HTTPS, TCP, TCP_UDP, TLS, or UDP. Required when target_type is instance, ip or alb. Does not apply when target_type is lambda."
}

variable "proxy_protocol_v2" {
  type        = bool
  default     = false
  description = "(Optional) Whether to enable support for proxy protocol v2 on Network Load Balancers."
}

variable "target_type" {
  type        = string
  default     = "instance"
  description = "(May be required, Forces new resource) Type of target that you must specify when registering targets with this target group."
}

variable "vpc_id" {
  type        = string
  default     = null
  description = "(Optional, Forces new resource) Identifier of the VPC in which to create the target group. Required when target_type is instance, ip or alb. Does not apply when target_type is lambda"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Key-value map of user-defined tags that are attached to the target group."
}

variable "connection_termination" {
  type        = bool
  default     = false
  description = "(Optional) Whether to terminate connections at the end of the deregistration timeout on Network Load Balancers."
}

variable "deregistration_delay" {
  type        = string
  default     = "300"
  description = "(Optional) Amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused. The range is 0-3600 seconds. "
}

variable "health_check" {
  type        = number
  default     = 1
  description = "(Optional, Maximum of 1)"
}

variable "lambda_multi_value_headers_enabled" {
  type        = bool
  default     = false
  description = "(Optional) Whether the request and response headers exchanged between the load balancer and the Lambda function include arrays of values or strings. Only applies when target_type is lambda"
}

variable "load_balancing_algorithm_type" {
  type        = string
  default     = "round_robin"
  description = "(Optional) Determines how the load balancer selects targets when routing requests. Only applicable for Application Load Balancer Target Groups. The value is round_robin or least_outstanding_requests"
}

variable "preserve_client_ip" {
  type        = string
  default     = null
  description = "(Optional) Whether client IP preservation is enabled"
}

variable "protocol_version" {
  type        = string
  default     = null
  description = "(Optional, Forces new resource) Only applicable when protocol is HTTP or HTTPS. The protocol version. Specify GRPC to send requests to targets using gRPC. Specify HTTP2 to send requests to targets using HTTP/2. The default is HTTP1, which sends requests to targets using HTTP/1.1"
}

variable "slow_start" {
  type        = number
  default     = 0
  description = "(Optional) Amount time for targets to warm up before the load balancer sends them a full share of requests. The range is 30-900 seconds or 0 to disable. "
}

variable "health_check_enabled" {
  type        = bool
  default     = true
  description = "(Optional) Whether health checks are enabled."
}

variable "healthy_threshold" {
  type        = number
  default     = 3
  description = "(Optional) Number of consecutive health checks successes required before considering an unhealthy target healthy."
}

variable "health_check_interval" {
  type        = number
  default     = 30
  description = "(Optional) Approximate amount of time, in seconds, between health checks of an individual target. Minimum value 5 seconds, Maximum value 300 seconds. For lambda target groups, it needs to be greater as the timeout of the underlying lambda."
}

variable "health_check_matcher" {
  type        = string
  default     = null
  description = "(May be required) Response codes to use when checking for a healthy responses from a target. You can specify multiple values or a range of values. Required for HTTP/HTTPS/GRPC ALB. Only applies to Application Load Balancers (i.e., HTTP/HTTPS/GRPC) not Network Load Balancers (i.e., TCP)."
}

variable "health_check_path" {
  type        = string
  default     = "/"
  description = "(May be required) Destination for the health check request. Required for HTTP/HTTPS ALB and HTTP NLB. Only applies to HTTP/HTTPS."
}

variable "health_check_port" {
  type        = string
  default     = "traffic-port"
  description = " (Optional) Port to use to connect with the target. Valid values are either ports 1-65535, or traffic-port."

}

variable "health_check_protocol" {
  type        = string
  default     = "HTTP"
  description = "(Optional) Protocol to use to connect with the target. Defaults to HTTP. Not applicable when target_type is lambda"

}

variable "health_check_timeout" {
  type        = number
  default     = null
  description = "(Optional) Amount of time, in seconds, during which no response means a failed health check. For Application Load Balancers, the range is 2 to 120 seconds, and the default is 5 seconds for the instance target type and 30 seconds for the lambda target type. For Network Load Balancers, you cannot set a custom value, and the default is 10 seconds for TCP and HTTPS health checks and 6 seconds for HTTP health checks."
}

variable "unhealthy_threshold" {
  type        = number
  default     = 3
  description = "(Optional) Number of consecutive health check failures required before considering the target unhealthy. For Network Load Balancers, this value must be the same as the healthy_threshold."
}

variable "stickiness_enabled" {
  type        = bool
  default     = true
  description = "(Optional) Boolean to enable / disable stickiness."
}

variable "stickiness_cookie_duration" {
  type        = number
  default     = 86400
  description = "(Optional) Only used when the type is lb_cookie. The time period, in seconds, during which requests from a client should be routed to the same target. After this time period expires, the load balancer-generated cookie is considered stale. The range is 1 second to 1 week (604800 seconds). The default value is 1 day (86400 seconds)."
}

variable "stickiness_type" {
  type        = string
  default     = null
  description = "(Required) The type of sticky sessions. The only current possible values are lb_cookie, app_cookie for ALBs, and source_ip for NLBs."
}

variable "stickiness_cookie_name" {
  type        = string
  default     = null
  description = "(Optional) Name of the application based cookie. AWSALB, AWSALBAPP, and AWSALBTG prefixes are reserved and cannot be used. Only needed when type is app_cookie."
}