resource "aws_db_subnet_group" "this" {
  name       = "${local.base_name}-rds-subnet-group"
  subnet_ids = var.subnet_ids

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_db_instance" "this" {
  identifier                          = "${local.base_name}-rds"
  allocated_storage                   = var.allocated_storage
  engine                              = var.engine
  engine_version                      = var.engine_version
  instance_class                      = var.instance_class
  db_name                             = var.db_name
  username                            = var.username
  password                            = var.password
  iam_database_authentication_enabled = var.database_authentication_enabled
  skip_final_snapshot                 = "true"
  publicly_accessible                 = "true"
  backup_retention_period             = var.backup_retention_period
  backup_window                       = "07:00-07:30"
  allow_major_version_upgrade         = "true"
  apply_immediately                   = "true"
  # deletion_protection                 = true
  # disable deletion protection before running destroy infrastructure 
  # deletion_protection = false

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = var.security_group_ids

  depends_on = [aws_db_subnet_group.this]
  lifecycle {
    ignore_changes = [password]
  }
}
