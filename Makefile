clean:
	rm -fr .terraform* terraform.tfstate*

plan:
	terraform plan --var="project_id=$(project_id)"

apply:
	terraform apply --var="project_id=$(project_id)"

destroy:
	terraform destroy --var="project_id=$(project_id)"