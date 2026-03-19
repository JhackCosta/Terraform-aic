terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "sa-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0b6c6ebed2801a5cb"
  instance_type = "t3.micro"
  key_name = "terraform-wsl"
 # user_data = <<-EOF
 #               #!/bin/bash
 #           cd /home/ubuntu
 #           echo "<h1>Feito com Terraform</h1>" > index.html
 #           nohup busybox httpd -f -p 8080 &
 #               EOF
  tags = {
    Name = "Primeira estancia"
  }
}
