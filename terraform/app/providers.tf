# Terraform configuration block
terraform {
  # Specify the minimum required Terraform version
  required_version = var.version

  # Declare required providers and their versions
  required_providers {
    kubectl = {
      # Provider name: kubectl
      source  = "gavinbunney/kubectl"  # Provider source, in this case, the community-maintained 'kubectl' provider
      version = ">= 1.7.0"         # Minimum provider version required
    }
  }
}

# Provider configuration block for Kubernetes
provider "kubernetes" {
  # Path to the Kubernetes configuration file
  config_path   = var.kube_config

  # Context name within the Kubernetes configuration file
  config_context = var.context
}
