# This module block is defining a module named "kube" that will use the source code located in the "./modules/kube-prometheus" directory.
module "kube" {
  source = "./modules/kube-prometheus"  # Specifies the source directory for the module.
}
