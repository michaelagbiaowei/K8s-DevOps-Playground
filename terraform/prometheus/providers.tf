# Provider configuration block for helm
provider "helm" {
    kubernetes {
    # Path to the Kubernetes configuration file
    config_path = "~/.kube/config"

    # Context name within the Kubernetes configuration file
    config_context = "kind-my-cluster"
    }
}

