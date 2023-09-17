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
    |----Dockerfile
    |----LICENSE
    |----main.js
    |----Makefile
    |----package-lock.json
    |----packag.json
    |----README.md

**Step 1**

 **Setting up a Kubernetes Cluster with Kind**

Install Docker if not already installed:

    $  make install_doacker

Install kind and deploy a new kubernetes kind cluster called "my-cluster"

    $ make install_kind

**Step 2**

**Deploying a Sample Node.js App with Terraform**

Create a Node.js app (e.g., main.js) and a Dockerfile for it.

Dockerize the Node.js app and push it to Docker Hub:

    docker build -t kind-app .

    docker run -p 8080:3000 kind-app:latest 

    make upload_docker

