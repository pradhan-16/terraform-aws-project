# variable "ami" {


# }

variable "subnet_id" {

}

# variable "instance_type" {
#     default = "dev"

# }

# variable "ec2_instance" {
#   description = "Map of ec2 instance configuration"
#   type = map(object({
#     ami = string
#     instance_type = string
#     subnet_id = string
#     tags = map(string)
#   }))

#   default = {
#     "web-server" = {
#         ami = "ami-015cbce10f839bd0c"
#         instance_type = "t2.micro"
#         subnet_id = "subnet-0185a6e0d457f2dbe"
#         tags = {name = "web-server"}
#     },
#     "app-server" = {
#         ami = "ami-015cbce10f839bd0c"
#         instance_type = "t3.micro"
#         subnet_id = "subnet-0185a6e0d457f2dbe"
#         tags = {name = "app-server"}
#     }
    
    


#   }
# }



# variable "tags" {
#      type = map
#      default = {
#          Name = "HelloWorld"

       
#    }
# }
