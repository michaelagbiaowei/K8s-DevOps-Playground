.PHONY: install_node install_docker install_kind install_terraform install_helm uplaod-docker

install_all: install_node install_docker install_kind install_terraform install_helm

install_node:
	./scripts/node.sh

install_docker:
	./scripts/docker-engine.sh

install_kind:
	./scripts/kind.sh

install_terraform:
	./scripts/terraform.sh

install_helm:
	./scripts/helm.sh

uplaod_docker:
	./scripts/uplaod-docker.sh
