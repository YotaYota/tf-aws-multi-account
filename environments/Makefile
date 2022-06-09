
TERRAFORM:= $(shell command -v terraform 2> /dev/null)

default:
	@echo "Creates a Terraform system from a template."
	@echo "The following commands are available:"
	@echo " - plan               : runs terraform plan for an environment"
	@echo " - apply              : runs terraform apply for an environment"
	@echo " - destroy            : will delete the entire project's infrastructure"

plan:
	@terraform fmt

	@echo "Pulling the required modules..."
	@terraform get

	@echo "Switching to the [$(value ENV)] environment ..."
	@terraform workspace select $(value ENV)

	@terraform plan  \
  	  -var-file="env_vars/$(value ENV).tfvars" \
		-out $(value ENV).plan

apply:
	@echo "Switching to the [$(value ENV)] environment ..."
	@terraform workspace select $(value ENV)

	@echo "Will be applying the following to [$(value ENV)] environment:"
	@terraform show -no-color $(value ENV).plan

	@terraform apply $(value ENV).plan
	@rm $(value ENV).plan

destroy:
	@echo "Switching to the [$(value ENV)] environment ..."
	@terraform workspace select $(value ENV)

	@terraform destroy \
		-var-file="env_vars/$(value ENV).tfvars"

