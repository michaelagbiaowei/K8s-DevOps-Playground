# K8s-DevOps-Playground
This K8s-DevOps Playground project offers hands-on experience with building, deploying, and monitoring applications within Kubernetes clusters.

**File Structure**:

    |----assets
    |----k8s
    |      |----deployment.yml
    |      |----service.yml
    |     
    |----scripts  
    |      |----docker-engin.sh
    |      |----docker-upload.sh
    |      |----go.sh
    |      |----helm.sh
    |      |----kind.sh
    |      |----node.sh
    |      |----terraform.sh
    |
    |----terraform
    |      |----app
    |      |      |----main.tf
    |      |      |----provider.tf
    |      |      |----variables.tf
    |      |
    |      |----monitoring
    |             |----modules
    |             |      |----kube-prometheus
    |             |             |----main.tf
    |             |
    |             |----main.tf
    |             |----providers.tf
    |
    |----.dockerignore
    |----.gitignore