#Create EC2 instances. This block specifies the AWS EC2 instance  such as the instance type, AMI image ID, etc. You can specify the count parameter to create multiple instances.

resource "aws_instance" "Altschoolproject_in1" {
  ami             = "ami-00874d747dde814fa"
  instance_type   = "t2.micro"
  key_name        = var.ssh_key
  security_groups = [aws_security_group.Altschoolproject_instance_sg.id]
  subnet_id       = aws_subnet.Altschoolproject_subnet1.id
  availability_zone = "us-east-1a"
  tags = {
    Name   = "Altschoolproject1"
    source = "terraform"
  }
}

resource "aws_instance" "Altschoolproject_in2" {
  ami             = "ami-00874d747dde814fa"
  instance_type   = "t2.micro"
  key_name        = var.ssh_key
  security_groups = [aws_security_group.Altschoolproject_instance_sg.id]
  subnet_id       = aws_subnet.Altschoolproject_subnet2.id
  availability_zone = "us-east-1b"
  tags = {
    Name   = "Altschoolproject2"
    source = "terraform"
  }
}

resource "aws_instance" "Altschoolproject_in3" {
  ami             = "ami-00874d747dde814fa"
  instance_type   = "t2.micro"
  key_name        = var.ssh_key
  security_groups = [aws_security_group.Altschoolproject_instance_sg.id]
  subnet_id       = aws_subnet.Altschoolproject_subnet3.id
  availability_zone = "us-east-1c"
  tags = {
    Name   = "Altschoolproject3"
    source = "terraform"
  }
}

# create a key pair to generate secure key in PEM and OPENSSH PEM formats
resource "tls_private_key" "Altschoolproject_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name = var.ssh_key
  public_key = tls_private_key.Altschoolproject_key.public_key_openssh
}

resource "local_file" "ssh_key" {
  content = tls_private_key.Altschoolproject_key.private_key_pem
  filename = "${var.ssh_key}.pem"
  file_permission = "0400"
}

# Create a file to store the IP addresses of the instances
resource "local_file" "Ip_address" {
  filename = "/home/vagrant/terraformproject/host-inventory"
  content  = <<EOT
${aws_instance.Altschoolproject_in1.public_ip}
${aws_instance.Altschoolproject_in2.public_ip}
${aws_instance.Altschoolproject_in3.public_ip}
  EOT
}

# automatically run your ansible playbook
resource "null_resource" "ansible-playbook" {
  provisioner "local-exec" {
    command = "ansible-playbook --private-key ${var.ssh_key}.pem Altschoolproject.yml"
  }

  depends_on = [aws_instance.Altschoolproject_in1, aws_instance.Altschoolproject_in2, aws_instance.Altschoolproject_in3 ]
}