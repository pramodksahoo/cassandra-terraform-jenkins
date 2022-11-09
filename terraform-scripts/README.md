
# Terraform-Script-To-Launch-EC2-Instances
This Terraform script launches required number of EC2 Instances to setup Cassandra cluster in specified subnets by using specified pemkey and security group.

### Prerequisite:

1. Install Terraform of version  v1.0.11 or above
2. git should be installed

# Instruction to run terraform.

1. Clone this repository
2. Run the command $cd Terraform-Script-To-Launch-EC2-Instances
3. **Update variables in terraform.tfvars** </br>
      variables value need to change   </br>
       - project_name  &nbsp;  #project_name and environment will be consider only if instance_name is empty</br>
       - environment   &nbsp;&nbsp; #instances will get name as project_name appended with environment only if instance_name empty </br>
       - ami_ID                  </br>
       - ec2_instance_type        </br>
       - region                    </br>
       - Number_of_instances        </br>
       - access_key                  </br>
       - secret_key                   </br>
       - aws_session_token             </br>
       - instance_name                  </br>
       - vpc_id                          </br>
       - subnet_ids                       </br>
       - security_group_id                 </br>
4. Run the command $terraform init 
5. Run the command $terraform plan
6. Run the command $terraform apply </br>
To destory the resources created Run the command $terraform destroy
