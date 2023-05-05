#######################################################
# NAMESPACE
#######################################################

resource "kubernetes_namespace" "sandbox" {
  metadata {
    name = "${var.sandbox_ns}-${random_string.releasename.result}"
  }
}
