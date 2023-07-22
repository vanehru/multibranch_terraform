provider "aws" {
    region = "ap-north-east-1"
}

# specify the EC2 details
resource "aws_instance" "example" {
    ami  =  var.ami
    instance_type = "t2.micro"
  
}