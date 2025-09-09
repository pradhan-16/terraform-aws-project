# resource "aws_vpc" "testvpc" {
#   cidr_block       = "192.168.4.0/24"
#   instance_tenancy = "default"
#   enable_dns_support = true
#   enable_dns_hostnames = true

#   tags = local.common_tags
# }

# resource "aws_subnet" "testsubnet" {
#   vpc_id     = aws_vpc.testvpc.id
#   cidr_block = "192.168.4.0/27"
#   map_public_ip_on_launch = true
#   availability_zone = "eu-central-1a"

#   tags = local.common_tags
# }

# output "public_subnet_id" {
#     value = aws_subnet.testsubnet.id
# }

# resource "aws_instance" "web" {
#    count =      2
#    ami           = var.ami
#    instance_type = var.environment == "development" ? "t2.small" : "t2.large"
#    subnet_id = aws_subnet.testsubnet.id
   

#     tags = {
#         Name = "HelloWorld-${count.index}"
#     }
# }