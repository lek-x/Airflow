.PHONY: plan destroy apply validate key init activate env

init:
	terraform init -backend-config="access_key=${aws_access_key}" -backend-config="secret_key=${aws_secret_key}"

plan:
	terraform plan

destroy:
	terraform destroy -auto-approve

apply:
	terraform apply -auto-approve

validate:
	terraform validate

key:
	terraform output -raw private_key > my_ssh.key

activate:
	poetry shell

env:
	poetry shell && poetry install && pre-commit install -y
