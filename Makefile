.PHONY: install_go install_node install_docker install_kind install_terraform install_helm uplaod-docker

install_go:
	./scripts/go.sh

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

uplaod-docker:
	./scripts/uplaod-docker.sh
