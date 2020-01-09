
data "aws_iam_policy_document" "default_roles_001_assume" {
    for_each    = var.roles

    dynamic "statement" {
        for_each = lookup(each.value, "policy_statements_for_assume_role", null)

        content {
            actions         = lookup(statement.value, "actions", null)
            not_actions     = lookup(statement.value, "not_actions", null)
            effect          = lookup(statement.value, "effect", null)
            resources       = lookup(statement.value, "resources", null)
            not_resources   = lookup(statement.value, "not_resources", null)

            dynamic "condition" {
                for_each    = lookup(statement.value, "conditions", null)
                content {
                    test        = lookup(condition.value, "test", null)
                    variable    = lookup(condition.value, "variable", null)
                    values      = lookup(condition.value, "values", null)
                }
            }

            dynamic "principals" {
                for_each    = lookup(statement.value, "principals", null)
                content {
                    type        = lookup(principals.value, "type", null)
                    identifiers = lookup(principals.value, "identifiers", null)
                }
            }

             dynamic "not_principals" {
                for_each    = lookup(statement.value, "not_principals", null)
                content {
                    type        = lookup(not_principals.value, "type", null)
                    identifiers = lookup(not_principals.value, "identifiers", null)
                }
            }
        }
    }
}

data "aws_iam_policy_document" "default_roles_001__policy" {
    for_each    = var.roles

    dynamic "statement" {
        for_each = lookup(each.value, "policy_statements", null)

        content {
            actions         = lookup(statement.value, "actions", null)
            not_actions     = lookup(statement.value, "not_actions", null)
            effect          = lookup(statement.value, "effect", null)
            resources       = lookup(statement.value, "resources", null)
            not_resources   = lookup(statement.value, "not_resources", null)

            dynamic "condition" {
                for_each    = lookup(statement.value, "conditions", null)
                content {
                    test        = lookup(condition.value, "test", null)
                    variable    = lookup(condition.value, "variable", null)
                    values      = lookup(condition.value, "values", null)
                }
            }

            dynamic "principals" {
                for_each    = lookup(statement.value, "principals", null)
                content {
                    type        = lookup(principals.value, "type", null)
                    identifiers = lookup(principals.value, "identifiers", null)
                }
            }

             dynamic "not_principals" {
                for_each    = lookup(statement.value, "not_principals", null)
                content {
                    type        = lookup(not_principals.value, "type", null)
                    identifiers = lookup(not_principals.value, "identifiers", null)
                }
            }
        }
    }
}
