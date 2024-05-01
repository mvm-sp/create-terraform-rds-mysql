# create-terraform-rds-mysql
Terraform sample to create a RDS mysql 

To use this repository in this branch, clone it to your PC

Then:
* Create terraform.tfvars file and Configure your credentials and region 
```terraform
#terraform.tfvars
region = "us-east-2"
access_key = "<YOUR AWS CONSOLE ACCESS ID>"
secret_key = "<YOUR AWS CONSOLE SECRET KEY>"
```
* Check the aws_db_instance parameters on main.tf file
* Run `terraform init --upgrade` command
* Run `terraform plan` command
* Run `terraform apply` command

After all your tests you can run `terraform destroy` to clear this resource on your AWS account
