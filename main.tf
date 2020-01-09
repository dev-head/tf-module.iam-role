
resource "aws_iam_policy" "default_roles_001__policy" {
    for_each    = var.roles
    name        = format("%sRolePolicy", lookup(each.value, "name", null))
    path        = lookup(each.value, "path", null)
    policy      = data.aws_iam_policy_document.default_roles_001__policy[each.key].json
}

resource "aws_iam_role_policy_attachment" "default_roles_001__policy" {
    for_each    = var.roles
    role        = aws_iam_role.default_roles_001[each.key].name
    policy_arn  = aws_iam_policy.default_roles_001__policy[each.key].arn
}

resource "aws_iam_role" "default_roles_001" {
    for_each                = var.roles
    name                    = lookup(each.value, "name")
    path                    = lookup(each.value, "path", null)
    description             = lookup(each.value, "description", null)
    permissions_boundary    = lookup(each.value, "permissions_boundary", null)
    force_detach_policies   = false
    tags                    = merge({"Name": format("%s", lookup(each.value, "name"))}, var.tags)
    assume_role_policy      = data.aws_iam_policy_document.default_roles_001_assume[each.key].json
}
