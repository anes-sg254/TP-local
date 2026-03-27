resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = tls_private_key.key.public_key_openssh
}

resource "local_file" "private_key" {
  content         = tls_private_key.key.private_key_pem
  filename        = "${path.module}/deployer-key.pem"
  file_permission = "0600"
}

resource "aws_instance" "web" {
  ami             = "ami-12345678"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.web.name]
  key_name        = aws_key_pair.deployer.key_name

  user_data = <<-EOF
              #!/bin/bash
              # Install and configure Nginx
              yum update -y
              amazon-linux-extras install -y nginx1
              systemctl start nginx
              systemctl enable nginx
              
              # Create a simple webpage
              echo "<h1>Hello from Terraform and LocalStack!</h1>" > /usr/share/nginx/html/index.html
              EOF

  tags = {
    Name = "nginx-server"
  }
}
