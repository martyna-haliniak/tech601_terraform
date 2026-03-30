# TF scripts for making an EC2 instance on AWS

# Where to create this resource
provider "aws" {
  # Which region to create it in 
  region = "eu-west-1"

  # terafform init - download required dependencies for that cloud service provider
}


# Which service?
resource "aws_instance" "first_app_instance" { # (name inside tf script only)

  # Which AMI?
  ami = var.app_ami_id

  # What instance type?
  instance_type = var.instance_type

  # Do we want a public IP address?  (disabled by default - need to enable it)
  associate_public_ip_address = var.associate_public_ip

  # Name of resource (on aws)
  tags = {
    Name = "tech601-martyna-tf-instance"
  }
}


# Run from make-ec2:
    # terraform fmt - check format?
    # terraform plan
    # terraform apply
    # terraform destroy