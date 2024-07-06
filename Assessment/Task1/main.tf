provider "aws" {
  region = "ap-south-1" # Change to your preferred region
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}
#For public access creating IG , Route Table
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.public.id
}

resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a" # Change to your preferred AZ
  map_public_ip_on_launch  = true  
}

#Security which allow ssh access in inbound rules
resource "aws_security_group" "allow_ssh_http" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 11211
    to_port     = 11211
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
#It will create instance 
resource "aws_instance" "web" {
  ami           = "ami-01376101673c89611" # Change to your preferred AMI through AWS catalog
  instance_type = "t2.micro"
  subnet_id              = aws_subnet.subnet.id #using above output of subnet
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]  #using above output of security group

  key_name = "Test123" # Change to your key pair

  tags = {
    Name = "Terraform-Instance"
  }

  provisioner "local-exec" {
    command = <<EOF
        echo "[all]
        ${aws_instance.web.public_ip} ansible_user=ec2-user ansible_ssh_private_key_file=/home/shivam_yadav/Rapimoney_DevOps/Assignment-----/1/keys/Test123.pem" > inventory  
        
    EOF
  } #above we have to pass the pem file path and it will automatically create inventory file
}

output "instance_ip" {
  value = aws_instance.web.public_ip
}
