# terraform {
#   backend "s3" {
#     encrypt        = "true"
#     key            = "onprem_vm.tfstate"
#     region         = "eu-west-1"
#     dynamodb_table = "terraform_locking"
#   }
# }
