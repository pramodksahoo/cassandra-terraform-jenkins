                                            # Creating a Variable for ami
variable "ami_ID" {       
  type = string
  # default = "ami-001089eb624938d9f"  # By default It selects Amazon Linux 2 AMI
}
                                          
variable "ec2_instance_type" {          # Creating a Variable for instance_type
  type = string
  # default = "t2.micro"
}

variable "region" {    
  type = string
  # default = "us-east-2"
}

variable "Number_of_instances" { 
  description = "Number of EC2 instances to deploy"
  type        = number    
  default = 3    # By default It creates 3 Instances  
}
variable "access_key" {    
  type = string
}
variable "secret_key" {    
  type = string
}

variable "subnet_ids" {
  type = list(string)
  
}

variable "PemkeyName" {
  type = string
  }

variable "instance_name"{
type = string
#By default poject name will be considered as instance name
}

variable "vpc_id" {
  type = string
}
 
variable "sg_name" {
  type = string 
}
variable "aws_session_token" {
  description = "Temporary session token used to create instances"
  type = string
}
variable "project_name"{
  type = string
}
variable "environment"{
  type = string 
}

variable "user"{
  type = string
  description = "username. eg: centos, ec-user .."
}


variable security_groups {
  default = [{
    description = "cassandra security_group"
    #name = "sg"
    ingress_rules = [{
						from = 7000  #from is of type number
						to = 7000  #to is of type number
						protocol = "tcp"
						cidr = ["10.0.0.0/8"]
                    },
	    	    {
						from = 22  #from is of type number
						to = 22  #to is of type number
						protocol = "tcp"
						cidr = ["10.0.0.0/8"]
                    },
                    {
						from = 9042  #from is of type number
						to = 9042  #to is of type number
						protocol = "tcp"
						cidr = ["10.0.0.0/8"] 
                    }]
    egress_rules = [{
						from = 0  #from is of type number
						to = 0  #to is of type number
						protocol = "-1"
						 cidr = ["0.0.0.0/0"]
                  }]
  }]
}

