resource "helm_release" "kube-prometheus" {
  name       = "kube-prometheus-stack"
  # namespace  = "monitoring"
  version    = "50.1.0"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
}