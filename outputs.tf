#outputs.tf
output "security_group_id" {
  value       = aws_security_group.mysql_sg.id
}

output "db_instance_endpoint" {
  value       = aws_db_instance.myinstance.endpoint
}

output "secret_pass_id" {
  value       =  aws_secretsmanager_secret.db-pass.id
}



