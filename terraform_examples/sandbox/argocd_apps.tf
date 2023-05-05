resource "random_string" "releasename" {
  length           = 5
  special          = false
  upper            = false
  numeric          = false
  
}

locals {
  branch           = "main"
  replicas         = "1"
  tags             = "latest"
  helm_charts_path = "./"
  syncPolicy =  {
    automated = {
      prune    = true
      selfHeal = true
    }
  }
  apps = {
    webconsole_sandbox = {
      release     = "webconsole-${random_string.releasename.result}"
      image       = "vitalykumov/hw-console:latest"
      name        = "webconsole-${random_string.releasename.result}"
      yamlRoot    = "webconsole"
      path        = "webconsole/"
      value_files = ["values.yaml"]
      parameters  = [        {
          name  = "webConsole.ingress.hosts[0].host"
          value = aws_route53_record.webconsole.name
        }]
      values      = <<EOT
webConsole:
  ingress:
    annotations: 
      nginx.ingress.kubernetes.io/auth-url: "https://auth.${local.internal_domain}/oauth/authorize"
      nginx.ingress.kubernetes.io/auth-signin: "https://auth.${local.internal_domain}/oauth/signin?rd=https://${aws_route53_record.webconsole.name}$escaped_request_uri"
    EOT
    }
  }
}

#############################################
#
#   LOCAL APPS
#
#############################################
resource "kubectl_manifest" "apps" {
  for_each = local.apps
  yaml_body = yamlencode({
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name      = each.value.name
      namespace = "infra"
    }
    spec = {
      project = "default"
      source = {
        path           = "${local.helm_charts_path}${each.value.path}"
        repoURL        = "https://github.com/cisco-dcloud/gde-helm-charts.git"
        targetRevision = local.branch
        helm = {
          valueFiles  = each.value.value_files
          parameters  = each.value.parameters
          values      = each.value.values
          releaseName = each.value.release
        }
      }
      destination = {
        server    = "https://kubernetes.default.svc"
        namespace = kubernetes_namespace.sandbox.id
      }
      syncPolicy = local.syncPolicy
    }
  })
  depends_on = [
    kubernetes_namespace.sandbox
  ]
}
