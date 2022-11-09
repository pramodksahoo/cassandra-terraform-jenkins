locals {
keyname = aws_key_pair.generated_key.key_name
}

resource "aws_instance" "launch_ec2_instances" {

  count = var.Number_of_instances     
  ami = var.ami_ID
  instance_type = var.ec2_instance_type
  
  subnet_id =  element(var.subnet_ids , count.index)
  vpc_security_group_ids = [module.security_group[0].id]
  key_name = local.keyname 
  
  tags = {
    Name = var.instance_name==""?"${var.project_name}_${var.environment}_cassandra_${count.index+1}":"${var.instance_name}-${count.index+1}"
         }
         
         depends_on =[
         tls_private_key.pk ,
         aws_key_pair.generated_key,
         module.security_group
         
         ]
 }

