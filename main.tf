provider "aws" {
    region="us-east-1"  
}
resource "aws_key_pair" "ec2-key"{
  key_name="connection"
  public_key=file("~/.ssh/id_rsa.pub")  
}

module "ec2_instance"{
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = var.ec2_name
  instance_count         = 2
  associate_public_ip_address= true  
  ami                    = var.ec2_ami
  instance_type          = var.type_of_instance
  key_name               = aws_key_pair.ec2-key.key_name 
  monitoring             = var.monitor_permission
  vpc_security_group_ids = var.security_group_id
  subnet_id              = var.subnet_id

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }

}
