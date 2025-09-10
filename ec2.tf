# ---------------------
# # Key Pair (Commented Out)
# ---------------------
resource "aws_key_pair" "mykey" {
  key_name   = "terraform-key-${var.env_name}"
  public_key = file("~/.ssh/id_rsa.pub")  # अपने local machine की public key use करो
}

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
# EC2 Instance with Website (Primary)
# ---------------------
resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_a.id
  key_name               = aws_key_pair.mykey.key_name  # Commented Out
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
# Optional: Secondary EC2 (Commented Out)
# ---------------------
# resource "aws_instance" "web_b" {
#   ami                    = data.aws_ami.ubuntu.id
#   instance_type          = "t2.micro"
#   subnet_id              = aws_subnet.public_b.id
#   key_name               = aws_key_pair.mykey.key_name
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
