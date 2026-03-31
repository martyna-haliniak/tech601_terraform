# TF script for making a sparta app EC2 instance on AWS
# (without the db)

provider "aws" {
  region = "eu-west-1"
}


resource "aws_instance" "app_instance" {

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

  # Set order (DB VM first)
  depends_on = [aws_instance.db_instance]

  # Recreate app VM if user data changes (default = false)
  user_data_replace_on_change = true

  # User data to run app
  # user_data = file("run_app_only.sh") - doesn't work with the database VM
  user_data = <<-EOT
  #!/bin/bash
  export DB_HOST=mongodb://${aws_instance.db_instance.private_ip}:27017/posts
  cd /home/ubuntu/tech601-sparta-app/app
  npm install
  pm2 start app.js --name app
  EOT

}


resource "aws_instance" "db_instance" {

  # AMI
  ami = var.db_ami_id

  # Instance type
  instance_type = var.instance_type

  # Key pair
  key_name = var.key_name

  # Public IP?
  associate_public_ip_address = false

  # Security Group 
  vpc_security_group_ids = [var.db_security_group_id]

  # Name of resource
  tags = {
    Name = "tech601-martyna-sparta-app-db-tf-instance"
  }

}