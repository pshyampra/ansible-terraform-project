resource "aws_instance" "bastion" {
   ami                    = "ami-0f5ee92e2d63afc18"
   instance_type          = "t2.medium"
   key_name        = "ke"
   vpc_security_group_ids = ["sg-024338d9ef0de667c",]
   subnet_id              = "subnet-067094b25bf34c1be"
   associate_public_ip_address = true
   tags = {
     Name = "bastion"
   }
 }
resource "aws_instance" "jenkins" {
   ami                    = "ami-0f5ee92e2d63afc18"
   instance_type          = "t2.medium"
   key_name        = "ke"
   vpc_security_group_ids = ["sg-04bcf8455a89da30f",]
   subnet_id              = "subnet-0d1a131051e0ee5ee"
   tags = {
     Name = "jenkins"
   }
 }
resource "aws_instance" "app" {
   ami                    = "ami-0f5ee92e2d63afc18"
   instance_type          = "t2.medium"
   key_name              = "ke"
   vpc_security_group_ids = ["sg-04bcf8455a89da30f",]
   subnet_id              = "subnet-00c524c62d4fea1f9"
    tags = {
     Name = "app"
   }
}
