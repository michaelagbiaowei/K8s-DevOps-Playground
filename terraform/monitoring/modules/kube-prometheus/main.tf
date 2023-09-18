# Define a Helm release resource named "kube-prometheus" 
resource "helm_release" "kube-prometheus" {
  name       = "kube-prometheus-stack"  # Set the name of the Helm release
  version    = "50.1.0"  # Specify the version of the Helm chart to be installed
  repository = "https://prometheus-community.github.io/helm-charts"  # Set the Helm chart repository URL
  chart      = "kube-prometheus-stack"  # Specify the name of the Helm chart to install
}
