# output "vpc_id" {
#   value = aws_vpc.main.id
# }

# output "ec2_public_ip" {
#   value = aws_instance.web.public_ip
# }

# output "ubuntu_ami_id" {
#   value = data.aws_ami.ubuntu.id
# }



# output "website_url" {
#   value = "http://${aws_instance.web.public_ip}"
# }

# output "rds_endpoint" {
#   value = aws_db_instance.mydb.endpoint
# }

# output "vpc_id" {
#   value = aws_vpc.main.id
# }





# ---------------------
# EC2 Website URL
# ---------------------
output "website_url" {
  description = "Public URL of the EC2 website"
  value       = "http://${aws_instance.web.public_ip}"
}

# ---------------------
# RDS Endpoint
# ---------------------
output "rds_endpoint" {
  description = "RDS DB Endpoint"
  value       = aws_db_instance.mydb.endpoint
}

# ---------------------
# VPC ID (Optional, for reference)
# ---------------------
output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

# ---------------------
# Public Subnets (Optional)
# ---------------------
output "public_subnets" {
  description = "List of Public Subnet IDs"
  value       = [aws_subnet.public_a.id, aws_subnet.public_b.id]
}

# ---------------------
# Private Subnets (Optional)
# ---------------------
output "private_subnets" {
  description = "List of Private Subnet IDs (RDS)"
  value       = [aws_subnet.private_a.id, aws_subnet.private_b.id]
}


