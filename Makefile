.PHONY: install_node install_docker install_kind install_terraform install_helm docker_upload

install_all: install_node install_docker install_kind install_helm install_terraform 

install_node:
	./scripts/node.sh

install_docker:
	./scripts/docker-engine.sh

install_kind:
	./scripts/kind.sh

install_helm:
	./scripts/helm.sh

install_terraform:
	./scripts/terraform.sh

docker_upload:
	./scripts/uplaod-docker.sh
