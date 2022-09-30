FUNCTIONS_PATH = ./functions
ZIP_PATH = ./lambdas_archives

all: zip_lambdas init deploy

zip_lambdas:
	$(foreach file, $(wildcard $(FUNCTIONS_PATH)/*), zip -j $(ZIP_PATH)/$(basename $(notdir $(file))).zip $(file);)

init:
	terraform init

deploy:
	terraform validate
	terraform apply -var-file="config.tfvars"
	terraform output > variables.out
	terraform output -json ingest_api_key > ingest.json

destroy:
	terraform destroy -var-file="config.tfvars"