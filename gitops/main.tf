provider "aws" {
  region = "ap-northeast-1"  # Change this to your desired AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-0d52744d6551d851e"  # Replace this with your desired AMI ID
  instance_type = "t2.micro"
  tags = {
    Name = "Example EC2 Instance"

  }
}
