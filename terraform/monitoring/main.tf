module "kube" {
  source = "./modules/kube-prometheus"
  # kube-version = var.kube-version
}

# resource "kubernetes_namespace" "monitoring" {
#   metadata {
#     name = "monitoring"
#   }
# }
