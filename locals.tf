# locals {
#    common_tags = {
#       Project = "xyz"
#       creationdate = "date-${formatdate("DDMMYY",timestamp())}"
#    }

# }

# locals {

#      ec2_instance = {
#         web_server = {
#             ami = "ami-015cbce10f839bd0c"
#             instance_type = "t2.micro"
#             subnet_id = "subnet-0185a6e0d457f2dbe"
#             tags = {name = "web-server"}
#         },
#         app_server = {
#             ami = "ami-015cbce10f839bd0c"
#             instance_type = "t3.micro"
#             subnet_id = "subnet-0185a6e0d457f2dbe"
#              tags = {name = "app-server"}
#         }
#      }
# }