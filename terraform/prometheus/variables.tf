variable "kube_config" {
  type    = string
  default = "~/.kube/config"
}
variable "namespace" {
  type    = string
  default = "monitoring"
}
variable "kube-version" {
  type = string
  default = "50.1.0"
}

variable "context" {
    type = string
    default = "kind-my-cluster"
}