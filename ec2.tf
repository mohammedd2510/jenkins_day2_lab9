resource "aws_instance" "my-ec2" {
  ami           =  var.Ami_id
  instance_type = "t2.micro"  # Change to your desired instance type
  subnet_id     = var.aws_subnet_id
  associate_public_ip_address = true  # Enable public IP

  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "my-ec2"
  }
  key_name = "key"
  provisioner "local-exec" {
    command = <<EOT
      cat <<EOF > my_inventory.ini
[my_ec2]
${aws_instance.my-ec2.public_ip} 
    EOT
  }  

}

output "ec2_public_ip" {
  value = aws_instance.my-ec2.public_ip
  description = "The public IP address of the EC2 instance"
}