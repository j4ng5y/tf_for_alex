.PHONY: fmt
fmt:
	terraform fmt

.PHONY: plan-test
plan-test:
	terraform plan -var-file="envs/test.tfvars" -out=test.plan

.PHONY: deploy-test
deploy-test: test.plan
	terraform apply -auto-approve test.plan
	rm -f test.plan

.PHONY: plan-prod
plan-prod:
	terraform plan -var-file="envs/prod.tfvars" -out=prod.plan

.PHONY: deploy-prod
deploy-prod: prod.plan
	terraform apply -auto-approve prod.plan
	rm -f prod.plan

.PHONY: destroy-test
destroy-test:
	terraform destroy -var-file="envs/test.tfvars" -auto-approve

.PHONY: destroy-prod
destroy-prod:
	terraform destroy -var-file="envs/prod.tfvars" -auto-approve