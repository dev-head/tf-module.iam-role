
output "default_roles_001" {
    value = [for instance in aws_iam_role.default_roles_001:
        format("[%s]::[%s]::[%s]::[%s]::[%s]", instance.arn, instance.create_date, instance.id, instance.name, instance.description)
    ]
}