variable "kube_config" {
  type    = string
  default = "~/.kube/config"
}

variable "version" {
    type = string
    default = ">= 0.13"
}

variable "context" {
    type = string
    default = "kind-my-cluster"
}