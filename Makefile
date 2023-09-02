
TAGS ?= all
ENVIRONMENT ?= dev
# OPTIONS ?=


ifeq ($(DEPLOY), true)
	OPTIONS =
else
	OPTIONS=-C
endif


.PHONY: init
init:
	terraform init -backend-config="access_key=${aws_access_key}" -backend-config="secret_key=${aws_secret_key}"

.PHONY: workspace
workspace:
	terraform workspace select '$(ENVIRONMENT)' || terraform workspace new '$(ENVIRONMENT)'

.PHONY: plan
plan:
	terraform plan

.PHONY: destroy
destroy:
	terraform workspace select '$(ENVIRONMENT)' && terraform destroy -auto-approve

.PHONY: apply
apply:
	terraform workspace select '$(ENVIRONMENT)' && terraform apply -auto-approve

.PHONY: validate
validate:
	terraform validate

.PHONY: key
key:
	terraform output -raw private_key > ansible/key.pem

.PHONY: activate
activate:
	poetry shell

.PHONY: env
env:
	poetry shell && poetry install && pre-commit install -y

.PHONY: play
play:
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ansible/inventory --private-key ansible/key.pem ansible/playbook.yml -D -t '$(TAGS)'

.PHONY: clean
clean:
	rm -rf ./.terraform \
	; rm -f .terraform.lock.hcl *.tfstate.* terraform*.out terraform*.plan terraform*.log

.PHONE: auto
auto:
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ansible/inventory --private-key ansible/key.pem ansible/playbook.yml -D -t '$(TAGS)' $(OPTIONS)
