aws_region = "us-east-1"

tags    = {
    Project         = "example"
    Environment     = "PROD"
    ManagedBy       = "terraform"
}

roles  = {

    vmimport    = {
        name                            = "vmimport"
        description                     = "This vmimport role is used to manage AMI imports."
        max_session_duration            = 12
        permissions_boundary            = ""
        policy_statements_for_assume_role   = [
            {
                effect          = "Allow"
                actions         = ["sts:AssumeRole"]
                principals      = [{type = "Service",  identifiers = ["vmie.amazonaws.com"]}]
                conditions      = [{ test = "StringEquals", variable = "sts:Externalid", values = ["vmimport"] }]
                not_actions     = [], not_principals  = [], resources = [], not_resources = []
            }
        ]

        policy_statements   = [
            {
                effect          = "Allow"
                actions         = ["s3:GetBucketLocation", "s3:GetObject", "s3:ListBucket"]
                resources       = ["arn:aws:s3:::example--ami-sources", "arn:aws:s3:::example--ami-sources/import/*"]
                not_actions     = [], not_resources   = [], principals = [], not_principals  = [], conditions = []
            },
            {
                effect          = "Allow"
                actions         = ["s3:GetBucketLocation", "s3:GetObject", "s3:ListBucket", "s3:PutObject", "s3:GetBucketAcl"]
                resources       = ["arn:aws:s3:::example--ami-sources", "arn:aws:s3:::example--ami-sources/export/*"]
                not_actions     = [], not_resources   = [], principals = [], not_principals  = [], conditions = []
            },
            {
                effect          = "Allow"
                actions         = ["ec2:ModifySnapshotAttribute", "ec2:CopySnapshot", "ec2:RegisterImage", "ec2:Describe*"]
                resources       = ["*"]
                not_actions     = [], not_resources   = [], principals = [], not_principals  = [], conditions = []
            }
        ]
    }
}