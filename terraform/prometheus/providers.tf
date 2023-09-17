# Provider configuration block for helm
provider "helm" {
    kubernetes {
    # Path to the Kubernetes configuration file
    config_path = var.kube_config

    # Context name within the Kubernetes configuration file
    config_context = var.context
    }
}

