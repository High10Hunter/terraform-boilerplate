output "hostname" {
  description = "Hostname of the RDS instance"
  value       = aws_db_instance.this.address
}

output "username" {
  description = "Username of the RDS instance"
  value       = aws_db_instance.this.username
}

output "password" {
  description = "Password of the RDS instance"
  value       = aws_db_instance.this.password
}

output "port" {
  description = "Port of the RDS instance"
  value       = aws_db_instance.this.port
}

output "name" {
  description = "Name of the RDS instance"
  value       = aws_db_instance.this.db_name
}
