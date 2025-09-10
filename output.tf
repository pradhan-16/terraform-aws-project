output "vpc_id" {
  value = aws_vpc.main.id
}

output "ec2_public_ip" {
  value = aws_instance.web.public_ip
}

output "ubuntu_ami_id" {
  value = data.aws_ami.ubuntu.id
}
