# Define a Terraform variable named "kube_config" with a string type.
# This variable is used to specify the path to the Kubernetes configuration file.
variable "kube_config" {
  type    = string
  default = "~/.kube/config"  # Set the default value to the default Kubernetes config path (~/.kube/config).
}

# Define a Terraform variable named "context" with a string type.
# This variable is used to specify the name of the Kubernetes context.
variable "context" {
    type = string
    default = "kind-my-cluster"  # Set the default value to "kind-my-cluster".
}
