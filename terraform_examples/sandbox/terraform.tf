terraform {
  required_version = "~> 1.4.5"

  required_providers {
    aws = {
      version = "~> 4.53.0"
    }
    random = {
      version = "~> 3.4.3"
    }
    kubernetes = {
      version = "~> 2.17.0"
    }
    helm = {
      version = "~> 2.8.0"
    }
    local = {
      version = "~> 2.3.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }
  }
}
