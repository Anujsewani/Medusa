resource "aws_db_instance" "medusa_db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "16.4"
  instance_class       = "db.t3.micro"
  db_name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  publicly_accessible  = true
  skip_final_snapshot = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name = aws_db_subnet_group.medusa_subnet_group.name
}

resource "aws_db_subnet_group" "medusa_subnet_group" {
  name       = "medusa-db-subnet-group"
  subnet_ids = aws_subnet.medusa_subnet[*].id
}

