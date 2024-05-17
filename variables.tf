#variables.tf
variable "access_key" {
    description = "Access key to AWS console"
}
variable "secret_key" {
    description = "Secret key to AWS console"
}
variable "region" {
    description = "AWS region"
}

variable sql_files{
    description = "List of SQL files to execute"
    type = list(string)  
}