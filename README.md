# K8s-DevOps-Playground

## **Project Overview**

[kind](https://kind.sigs.k8s.io/docs/user/quick-start/) is a tool that helps you run Kubernetes on your computer by using special Docker containers as its building blocks. While it was originally made to test Kubernetes, you can also use it for your own projects when working on your computer or for continuous integration tasks.

**Project Task**

This project involves setting up a Kubernetes cluster using Kind, a local deployment script, and deploying a Node.js app. It also includes creating a Docker image for a simple "Hello World" Express app, storing the kubeconfig securely, and writing [kubectl terraform provider](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs) script to deploy the app to the Kind cluster. As a bonus, it sets up monitoring using the [kube-prometheus stack](https://github.com/prometheus-community/helm-charts/blob/main/charts/kube-prometheus-stack/README.md) stack with [terraform helm provider](https://registry.terraform.io/providers/hashicorp/helm/latest/docs).

**Prerequisites**
- Linux server (x86_64)
- go (v1.16+)

**Files in Repository**:

    |----assets
    |----k8s
    |      |----deployment.yml
    |      |----service.yml
    |     
    |----scripts  
    |      |----docker-engin.sh
    |      |----docker-upload.sh
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

## **Setup the Environment**

- Node (v20.6.1)
- Docker(v23.0.6)
- Kind (v0.11.1)
- Helm (v3.12.3)
- Terraform (v1.5.7)

Run `make install_all` form the root of the project to install the necessary dependencies and setting up the kubernetes kind cluster

## **Running app.py**

Standalone:

    $ node install express
    $ node app.py 

Run in Docker:

Replce the placeholders with your desired values

    $ docker build -t [IMAGE_NAME] .
    $ docker run -p [PORT]:3000 [IMAGE_NAME]


**Access Website**

Browser: `localhost:[PORT]`

Terminal: `curl localhost:[PORT]`


Push to [docker hub](https://hub.docker.com/): 

Edit the dockerpath and user variables in the `scripts/docker-upload.sh` file

`dockerpath=[IMAGE_NAME]`

`user=[DOCKER_USERNAME]`

    $ make docker_upload

## **Deploy manifest files to kubernetes kind cluster using [kubectl terraform provider](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs)**

Change the port property to your desired port in the `k8s/app/service.yml` file

      ports: 
        - name: app-deployment
        protocol: TCP
        port: 5000 # Change to desired  port

The port property specifies the port that the reverse proxy will listen on. In this case, the reverse proxy will listen on port 5000. When a user visits a website hosted by the reverse proxy, the reverse proxy will forward the request to the target server, which is listening on port 3000.

To see your website in the browser, you would enter the following URL:

http://localhost:5000

The reverse proxy will then forward the request to the target server, which is running on port 3000.

Here is an example of how a reverse proxy works:

                    +-----------------------+
                    | Reverse Proxy  5000   |
                    +-----------------------+
                                |
                                |
                    +------------+----------+
                    |           |           |
                    |           |           |
                    |  Target   |  Target   |
                    |  Server 1 |  Server 2 |
                    |           |           |
                    +------------+----------+


The reverse proxy listens on a single port (e.g., port 5000) and forwards requests to different target servers based on the rules that it is configured with. In this example, the reverse proxy might be configured to forward requests to different target servers based on the URL path.

Reverse proxies are often used to improve the performance and scalability of websites and web applications. They can also be used to improve security by hiding the target servers from the internet.

***Deploying with terraform***

Run the following commands from both `terraform/app` and `terraform/monitoring` directories to deploy the Node.js and kube-prometheus stacks into the kubernetes kind cluster

We need to run `terraform init` to install modules since its required by the configuration.

If we now run `terraform plan`, it should detect our changes.

To apply the changes, run `terraform apply`

**Deployment status checks**

Running deployments `kubectl get deploymets.app -n default --watch`

Running pods `kubectl get pods -n default --watch`

Running services `kubectl get svc -n default --watch`

## **Port Forwarding**

We can use port forwarding to reach our apps in the Kubernetes kind cluster. This helps with testing and fixing issues, so you can access your service on your computer without making it accessible to others on the internet.

**Accessing Node.js UI**

To access Node.js UI:

    $ kubectl port-forward svc/app-service 5000:3000 --namespace default

Open a browser and go to: http://localhost:5000/ to see the Node.js UI.

**Accessing Prometheus**

To access Prometheus:

    $ kubectl port-forward svc/kube-prometheus-stack-prometheus 9090:9090 --namespace default

Open a browser and go to: http://localhost:9090/ to see the Prometheus UI.

**Accessing Grafana**

To access Grafana:

    $ kubectl port-forward svc/kube-prometheus-stack-grafana 3000:80 --namespace default

Open a browser and go to: http://localhost:3000/ to see the Grafana UI.

**Accessing Alertmanager**

Finally, to access Alertmanager, use this command:

    $ kubectl port-forward svc/kube-prometheus-stack-alertmanager 9093:9093 --namespace default
Open a browser and go to: http://localhost:9093/ to see the Alertmanager UI.





 


    