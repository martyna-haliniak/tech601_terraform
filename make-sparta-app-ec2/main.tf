# TF script for making a sparta app EC2 instance on AWS
# (without the db)

provider "aws" {
  region = "eu-west-1"
}


resource "aws_instance" "first_app_instance" {

  # AMI to launch VM from (Sparta app)
  ami = var.app_ami_id

  # Instance type
  instance_type = var.instance_type

  # Key pair
  key_name = var.key_name

  # Do we want a public IP address? 
  associate_public_ip_address = true

  # Security group 
  vpc_security_group_ids = [var.app_security_group_id]

  # Name of resource (on aws)
  tags = {
    Name = "tech601-martyna-sparta-app-tf-instance"
  }

  # User data to run app
  user_data = file("run_app_only.sh")

}
