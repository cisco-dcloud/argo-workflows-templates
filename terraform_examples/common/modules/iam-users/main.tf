#Get the created policies as data
data "aws_iam_policy" "all_policies" {
  count        = length(var.iamUsers)
  name         = var.iamUsers[count.index].policyName
  path_prefix  = "/dcloud-automation/"
}
#Create IAM users 
resource "aws_iam_user" "all_users" {
  count = length(var.iamUsers)
  name  = var.iamUsers[count.index].userName
}
#Create key/secret pairs for all users
resource "aws_iam_access_key" "all_users" {
  count = length(var.iamUsers)
  user  = aws_iam_user.all_users[count.index].name
}
#Attach policies to all users
resource "aws_iam_user_policy_attachment" "all_users" {
  count      = length(var.iamUsers)
  user       = aws_iam_user.all_users[count.index].name
  policy_arn = data.aws_iam_policy.all_policies[count.index].arn
}