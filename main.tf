#main.tf
#defining the provider as aws
provider "aws" {
    region     = "${var.region}"
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
}

resource "random_password" "db_root_pass" {
  length           = 40
  special          = true
  min_special      = 5
  override_special = "!#$%^&*()-_=+[]{}<>:?"
}

resource "random_id" "id" {
  byte_length = 8
}

resource "aws_secretsmanager_secret" "db-pass" {
  name = "db-pass-${random_id.id.hex}"
}

#create a security group for RDS Database Instance
resource "aws_security_group" "mysql_sg" {
  name = "mysql_sg"
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



#create a RDS Database Instance
resource "aws_db_instance" "myinstance" {
  engine               = "mysql"
  identifier           = "posmack-tf"
  db_name              = "posmack"
  allocated_storage    =  20
  engine_version       = "8.0.35"
  instance_class       = "db.t3.micro"
  username             = "root"
  password             = random_password.db_root_pass.result
  parameter_group_name = "default.mysql8.0"
  vpc_security_group_ids = ["${aws_security_group.mysql_sg.id}"]
  skip_final_snapshot  = true
  publicly_accessible =  true
}


resource "aws_secretsmanager_secret_version" "db-pass-val" {
  secret_id = aws_secretsmanager_secret.db-pass.id
  secret_string = jsonencode(
    {
      username = aws_db_instance.myinstance.username
      password = aws_db_instance.myinstance.password
      engine   = "mysql"
      host     = aws_db_instance.myinstance.endpoint
    }
  )
}

