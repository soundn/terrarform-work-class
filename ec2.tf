resource "aws_instance" "app_server2" {
  ami                         = var.ami
  vpc_security_group_ids      = [aws_security_group.web_sg2.id]
  subnet_id                   = data.aws_subnet.default.id
  associate_public_ip_address = true
  instance_type               = var.instance_type
  user_data                   = <<-EOF
              #!/bin/bash
              
              # Deploy a Static Website on Ubuntu 24 with Nginx

              # Exit immediately if a command exits with a non-zero status
              set -e

              # 1. Update System Packages
              apt update

              # 2. Install Nginx
              apt install nginx -y

              # 3. Clone the Website Code
              git clone https://github.com/GerromeSieger/Static-Site.git

              # 4. Deploy the Website
              cp -r Static-Site/* /var/www/html

              # 5. Restart Nginx
              systemctl restart nginx

              echo "Static website deployment completed."
              EOF



  tags = {
    Name = "StaticWeb-terraform"
  }
}