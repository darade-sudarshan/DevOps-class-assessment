resource "aws_secretsmanager_secret" "db_password2" {
  
  name = "dbPassword2"
}

resource "aws_secretsmanager_secret_version" "db_password2_version" {
  secret_id     = aws_secretsmanager_secret.db_password2.id
  secret_string = jsonencode({ password = "dbAdmin123Sudarshan" })
}

resource "aws_db_instance" "main" {
  identifier         = "mydbinstance"
  engine             = "mysql"
  instance_class     = "db.t3.micro"
  allocated_storage  = 20
  db_name            = "appdatabase"
  username           = "admin"
  password           = jsondecode(aws_secretsmanager_secret_version.db_password2_version.secret_string).password
  db_subnet_group_name = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  skip_final_snapshot = false

  tags = {
    Name = "sudarshan-db-instance"
  }
}

resource "aws_db_subnet_group" "main" {
  name        = "sudarshan1-db-subnet-group"
  subnet_ids  = [aws_subnet.private1.id,aws_subnet.private2.id]
  tags = {
    Name = "sudarshan-db-subnet-group"
  }
}
