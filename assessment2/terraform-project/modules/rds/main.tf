resource "aws_db_instance" "default" {
  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  db_name           = var.db_name
  username          = var.db_username
  password          = var.db_password
  allocated_storage = 20
  skip_final_snapshot = false
  tags = {
    Name = "database"
  }
  lifecycle {
    prevent_destroy = true
  }
}


