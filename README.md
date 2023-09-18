# K8s-DevOps-Playground

**Prerequisites**
- Linux server
- go
- Node
- Docker
- Kind
- Helm
- Terraform

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
    |----LICENSE
    |----main.js
    |----Makefile
    |----package-lock.json
    |----packag.json
    |----README.md

    