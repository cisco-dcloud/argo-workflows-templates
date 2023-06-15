#Get policie from Github
# data "http" "github" {
#   count        = length(var.policies)
#   url = "https://raw.githubusercontent.com/cisco-dcloud/tf-projects-for-content/main/policies/aws/${var.policies[count.index].policy}?ref=${var.policy_github_branch}"
#   request_headers = {
#     Accept = "application/vnd.github+json"
#   }
# }

#Create policies from downloaded files
resource "aws_iam_policy" "all_policies" {
  count  = length(var.policies)
  name   = var.policies[count.index].policyName
  #policy = data.http.github[count.index].response_body
  policy = file("${path.module}/../../policies/${var.policies[count.index].policy}")
  path   = "/dcloud-automation/"
}
