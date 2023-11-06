.ONESHELL:
.PHONY: help
help: ## Display help message
	@grep -E '^[0-9a-zA-Z_-]+\.*[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: install
install: ## Setup the troubleshooting lab environment with the correct config.
	cd correct_config
	ansible-galaxy collection install arista.avd arista.cvp --force
	export ARISTA_AVD_DIR=$$(ansible-galaxy collection list arista.avd --format yaml | head -1 | cut -d: -f1)
	pip3 config set global.disable-pip-version-check true
	pip3 install -r $${ARISTA_AVD_DIR}/arista/avd/requirements.txt
	export LABPASSPHRASE=`cat /home/coder/.config/code-server/config.yaml| grep "password:" | awk '{print $$2}'`
	make deploy-cvp

.PHONY: deploy-fixes
deploy-fixes: ## Deploy the correct config/solution for the troubleshooting lab.
	cd correct_config
	export LABPASSPHRASE=`cat /home/coder/.config/code-server/config.yaml| grep "password:" | awk '{print $$2}'`
	make deploy-cvp

.PHONY: deploy-scenario-cvp
deploy-scenario-cvp: ## Deploy the troubleshooting scenario with cvp for the troubleshooting lab.
	cd config_issues
	export LABPASSPHRASE=`cat /home/coder/.config/code-server/config.yaml| grep "password:" | awk '{print $$2}'`
	make deploy-cvp

.PHONY: deploy-scenario
deploy-scenario: ## Deploy the troubleshooting scenario for the troubleshooting lab.
	cd config_issues
	export LABPASSPHRASE=`cat /home/coder/.config/code-server/config.yaml| grep "password:" | awk '{print $$2}'`
	make deploy