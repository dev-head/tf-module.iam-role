
variable "aws_region" {
    description = "AWS Region"
    type        = string
}

variable "aws_profile" {
    description = "Optional AWS Profile"
    type        = string
    default     = ""
}

variable "tags" {
    description = "Required tags for resources."
    type = object({
        Project         = string,
        Environment     = string,
        ManagedBy       = string
    })
}

variable "roles" {
    description = "Configuration of one ore more IAM role configurations."
    type = map(object({
        name                    = string
        description             = string
        max_session_duration    = number
        permissions_boundary    = string
        policy_statements_for_assume_role   = list(object({
            actions         = list(string)
            not_actions     = list(string)
            effect          = string
            resources       = list(string)
            not_resources   = list(string)
            principals      = list(object({
                type        = string
                identifiers = list(string)
            }))
            not_principals  = list(object({
                type        = string
                identifiers = list(string)
            }))
            conditions  = list(object({
                test        = string
                variable    = string
                values      = list(string)
            }))
        }))
        policy_statements   = list(object({
            actions         = list(string)
            not_actions     = list(string)
            effect          = string
            resources       = list(string)
            not_resources   = list(string)
            principals      = list(object({
                type        = string
                identifiers = list(string)
            }))
            not_principals  = list(object({
                type        = string
                identifiers = list(string)
            }))
            conditions  = list(object({
                test    = string
                variable = string
                    values  = list(string)
            }))
        }))
    }))
}
