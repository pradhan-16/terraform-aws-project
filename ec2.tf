# ---------------------
# Fetch Ubuntu AMI (22.04 LTS)
# ---------------------
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]  # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

# ---------------------
# EC2 Instance with Website
# ---------------------
resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  
  # Deploy EC2 in first public subnet (ap-south-1a)
  subnet_id              = aws_subnet.public_a.id

  vpc_security_group_ids = [aws_security_group.sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y apache2
              echo "<h1>Welcome to ${var.env_name} Website 🚀</h1>" > /var/www/html/index.html
              systemctl enable apache2
              systemctl start apache2
              EOF

  tags = {
    Name        = "${var.env_name}-ec2"
    Environment = var.env_name
  }
}

# ---------------------
# Optional: You can add a second EC2 in other public subnet (ap-south-1b) if needed for high availability
# ---------------------
# resource "aws_instance" "web_b" {
#   ami                    = data.aws_ami.ubuntu.id
#   instance_type          = "t2.micro"
#   subnet_id              = aws_subnet.public_b.id
#   vpc_security_group_ids = [aws_security_group.sg.id]
#
#   user_data = <<-EOF
#               #!/bin/bash
#               apt update -y
#               apt install -y apache2
#               echo "<h1>Welcome to ${var.env_name} Website - Secondary 🚀</h1>" > /var/www/html/index.html
#               systemctl enable apache2
#               systemctl start apache2
#               EOF
#
#   tags = {
#     Name        = "${var.env_name}-ec2-b"
#     Environment = var.env_name
#   }
# }
