 project_name = "cassandra"
 environment = "cert"
 #ami_ID = "ami-0f2b4fc905b0bd1f1"  #we usually use this ami id for cassandra
 #user = "centos"  
 ec2_instance_type = "t3.2xlarge"
 #region = ""
 #PemkeyName = "sample-testing"  # name of the new pem key to be created for ec2 machines 
 Number_of_instances = 3           #three nodes are preffered for cassandra cluster in different availability zone for high availabilty
 #instance_name = ""               #if instance name empty it creates instances and assignes the name in this format: Project_name_environment_count
 #vpc_id = "vpc-0802b1796e7acbeeb"
 #subnet_ids = ["subnet-04f3bf0a0b3f5f862","subnet-00117160a96500355","subnet-0fca17a9f9158a955"]
 #security_group_id =  "sg-04c9128499824e1c5"




