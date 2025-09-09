# # data "aws_instance" "ec2testserver" {
# #   instance_id = "i-0993103a24fcbf051"

# # }

# data "aws_ami" "example" {
#   executable_users = ["self"]
#   most_recent      = true
#   name_regex       = "^myami-\\d{3}"
#   owners           = ["self"]

#   filter {
#     name   = "name"
#     values = ["myami-*"]
#   }

#   filter {
#     name   = "root-device-type"
#     values = ["ebs"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
# }

# resource "aws_instance" "example" {
 
#   ami           = data.aws_instance.ec2testserver.ami
#   instance_type = "t2.micro"
#   subnet_id = var.subnet_id
#   vpc_security_group_ids = [aws_security_group.allow_tls.id]
  



# }


# resource "aws_security_group" "allow_tls" {
#   name        = "allow_tls_xyz"
#   description = "Allow TLS inbound traffic and all outbound traffic"
#   vpc_id      = "vpc-02c7ca62bc81aaaef"

# }

