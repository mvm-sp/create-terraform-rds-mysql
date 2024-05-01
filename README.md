# create-terraform-rds-mysql
Terraform sample to create a RDS mysql 

To use this repository, clone it to your PC

Then:
* Configure your credentials and region on terraform.tfvars file
* Check the aws_db_instance parameters on main.tf file
* Run `terraform init` command
* Run `terraform plan` command
* Run `terraform apply` command

After all your tests you can run `terraform destroy` to clear this resource on your AWS account
