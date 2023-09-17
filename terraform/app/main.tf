# This Terraform configuration file defines two resources of type "kubectl_manifest" to manage Kubernetes resources.
# It uses the content of YAML files for Kubernetes Deployment and Service configurations.

# Resource block for managing a Kubernetes Deployment using kubectl_manifest.
resource "kubectl_manifest" "app-deployment" {
  # The "yaml_body" argument specifies the YAML content for the Kubernetes resource.
  # It reads the content from the deployment.yml file located in a specific path.
  # The ${path.module} variable refers to the current module's directory, and ".." is used to navigate up one level.
  yaml_body = file("${path.module}/../../k8s/deployment.yml")
}

# Resource block for managing a Kubernetes Service using kubectl_manifest.
resource "kubectl_manifest" "app-service" {
  # The "yaml_body" argument specifies the YAML content for the Kubernetes resource.
  # It reads the content from the service.yml file located in a specific path.
  # The ${path.module} variable refers to the current module's directory, and ".." is used to navigate up one level.
  yaml_body = file("${path.module}/../../k8s/service.yml")
}
