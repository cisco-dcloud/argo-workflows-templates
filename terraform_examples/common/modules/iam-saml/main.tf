
data "aws_caller_identity" "current" {} # used for accesing Account ID and ARN

#Create SAML Provider
resource "aws_iam_saml_provider" "cat-idp" {
  name                   = "idp.cat-dcloud.com"
  saml_metadata_document = file("${path.module}/idp.cat-dcloud.com.xml")
}

#Create SAML roles
resource "aws_iam_role" "all_saml_roles" {
  count              = length(var.samlRoles)
  name               = var.samlRoles[count.index].roleName
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::${data.aws_caller_identity.current.id}:saml-provider/idp.cat-dcloud.com"
      },
      "Action": "sts:AssumeRoleWithSAML",
      "Condition": {
        "StringEquals": {
          "SAML:aud": "https://signin.aws.amazon.com/saml"
        }
      }
    }
  ]
}
EOF
}


#Get the created policies as data
data "aws_iam_policy" "all_policies" {
  count       = length(var.samlRoles)
  name        = var.samlRoles[count.index].policyName
  path_prefix = "/dcloud-automation/"
}

resource "aws_iam_role_policy_attachment" "all_policies" {
  count      = length(var.samlRoles)
  role       = aws_iam_role.all_saml_roles[count.index].id
  policy_arn = data.aws_iam_policy.all_policies[count.index].arn
}

