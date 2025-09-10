# ---------------------
# DB Subnet Group (use private subnets from vpc.tf)
# ---------------------
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "${var.env_name}-db-subnet-group"
  subnet_ids = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id
  ]

  tags = {
    Name = "${var.env_name}-db-subnet-group"
  }
}

# ---------------------
# RDS Instance (MySQL)
# ---------------------
resource "aws_db_instance" "mydb" {
  identifier              = "${var.env_name}-rds"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20

  username                = "admin"
  password                = "Admin12345!"   # (best practice: use Secrets Manager/SSM)
  
  skip_final_snapshot     = true
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.sg.id]
  publicly_accessible     = true   # ✅ keep true only for testing (not best practice in prod)

  tags =
