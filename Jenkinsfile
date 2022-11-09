pipeline {
  agent any
  tools {
      terraform "terraform"
  }
  options {
        ansiColor('xterm')
    }
      
  parameters
    {
   string(name: 'TF_VAR_access_key' ,defaultValue: 'ASIAYHJRINSEKDLRZPHS')
   string(name: 'TF_VAR_secret_key' ,defaultValue: 'ODtTCSRgfrXAezGVm0oK55hFevpn9lGie3WQ5Yb3')
   string(name: 'TF_VAR_aws_session_token' ,defaultValue: 'IQoJb3JpZ2luX2VjEIr//////////wEaCXVzLWVhc3QtMSJHMEUCIQDqUg1aQqWxtzOdXxjLJtwKvz/oGEJjQSW2Obo8sdaxQgIgK3p6VZzKnwDfYwIdThQrsnx1hxwvJp0jlbdgvgdk38kqpQMI0///////////ARABGgw1NjU0MjgzODI4NTYiDFd41zlJA4WVFPBfYir5Argghi71jPGXA5+NxG1A0xgzstihV7P29xVc3+hdKhiboFisNaLK3549DhkKlRM3B7cHU7jxkz6Y5WPIFEUurxhYZNzhJifpHuMqhV1iKsNs0D+584kUHbJ8PZjFdSPP+MfaNywuIQJb32pJzHqhJqSSnkwgqu0n3h9+SD1RocaHNUJ4ZUwBtRIArvkt4acHFeF2kYgf+8aZbWZV2NkSvysSPjlKlQo70ho7RL7FU0pFLT6fwrT8qpRpS1uRjLN7kkXEZ7G+PpVAlr+bhR2NgOJw+Ni9gP8gTdFxo48FSdDchSkpz0UmXOeRDbyvphPw1iKLX5vqzf5JiE/JhIn8lss32Uflf34Br1ASiRSAvV2QKf3varxvRIbMm2ncQ5FVjRXH67/Cv4WJ+h5qe5DWQ6u19YW5GPlGmCqsRQzCDwSk5rBjfmzytAwVoMRP6fdzS7Z+LEju2BhUrzdas718xBjdwGFslvRc8x4C7R7B2slUNAsI0TMtMh2HMNOThJcGOqYBvyOaPl0IbnlECB1YVC+zNQfMyA73361T38iQsxquq9nE5gx1a3uCoFEZNB24C/K1B1PKzUW5YB+y2p58IEZAiVtsdtU1YjrqdHiVLorfgTtE1R+bVTWTdua9ZGBGwk1+H8EMpeDn64IkZbtSt1VQL2k8VLoHKuV25SzQVfuroit/oydtfnbEyq6yPRDsVvBk69pLa5L+azSi1NxUzjiwxnT1OVp3yw==')
   string(name: 'ec2_user' ,defaultValue: 'centos')
   string(name: 'ami_id' ,defaultValue: 'ami-0eab3a90fc693af19')
   string(name: 'region' ,defaultValue: 'eu-west-2')  
   string(name: 'key_name' ,defaultValue: 'cassandra-nlpivr-cert-eu-west-2')  
   string(name: 'sg_name' ,defaultValue: 'nlpivr-cert-cassandra-sg')    
   string(name: 'instance_name' ,defaultValue: 'nlpivr-cert-cassandra')
   string(name: 'vpc_id' ,defaultValue: 'vpc-07408232aaa860849')  
   string(name: 'subnet_id1' ,defaultValue: 'subnet-0dbf1ae10bffebc3b')
   string(name: 'subnet_id2' ,defaultValue: 'subnet-0d7f04c221b9da08e')
   string(name: 'subnet_id3' ,defaultValue: 'subnet-0b7fd6ce35c021b5f')   
      
                 
  booleanParam(name: 'terraform_apply', defaultValue: false, description: 'Select to Run terraform apply command')
  booleanParam(name: 'terraform_destroy', defaultValue: false, description: 'Select to Run terraform destroy command') 
      
   string(name: 'cassandra_user' ,defaultValue: 'cassandra')    
   string(name: 'clustername' ,defaultValue: 'uk cert cluster')
   string(name: 'cassandra_dc' ,defaultValue: 'cert_dc')   
    }

  stages {

    stage('Git Checkout') {
      steps {
        git branch: 'main', credentialsId: 'svc-usjenkins-devops', url: 'git@github.worldpay.com:Docet-USA/Cassandra.git'
      }
    }
 stage('Copy Var') {
      steps{
            sh 'ls -lart'    
            sh "pwd"
            echo "cd terraform-scripts"
            dir('terraform-scripts') {
                  sh "pwd"

                  sh 'echo "access_key = \\"${TF_VAR_access_key}\\"" >> ./terraform.tfvars'
                  sh 'echo "secret_key = \\"${TF_VAR_secret_key}\\"" >> ./terraform.tfvars'
                  sh 'echo "aws_session_token = \\"${TF_VAR_aws_session_token}\\"" >> ./terraform.tfvars'
                  sh 'echo "user = \\"${ec2_user}\\"" >> ./terraform.tfvars' 
                  sh 'echo "ami_ID = \\"${ami_id}\\"" >> ./terraform.tfvars'     
                  sh 'echo "region = \\"${region}\\"" >> ./terraform.tfvars'  
                  sh 'echo "PemkeyName = \\"${key_name}\\"" >> ./terraform.tfvars' 
                  sh 'echo "instance_name = \\"${instance_name}\\"" >> ./terraform.tfvars'
                  sh 'echo "sg_name = \\"${sg_name}\\"" >> ./terraform.tfvars' 
                  sh 'echo "vpc_id = \\"${vpc_id}\\"" >> ./terraform.tfvars'
                  sh 'echo "subnet_ids = [\\"${subnet_id1}\\",\\"${subnet_id2}\\",\\"${subnet_id2}\\"]" >> ./terraform.tfvars'

               
                  
                     
            }
            sh "pwd"
            echo "cd ansible-scripts"
            dir('ansible-scripts') {
                  sh "pwd"

                  sh 'echo "user: ${cassandra_user}" >> ./vars/main.yml'
                  sh 'echo "clustername: ${clustername}" >> ./vars/main.yml'
                  sh 'echo "cassandra_dc: ${cassandra_dc}" >> ./vars/main.yml'
                     
            }
            
     
}
   }
    stage('Terraform Init') {
      steps {
      ansiColor('xterm') {
         sh "pwd"
        dir('terraform-scripts') {
          sh "pwd"
          sh label: '', script: 'terraform init'
        }
        sh "pwd"
      }
      }
    }
   
    stage('Terraform apply') {
       when{
       expression { params.terraform_apply}
     }
      steps {
         ansiColor('xterm') {
         sh "pwd"
        dir('terraform-scripts') {
     sh label: '', script: 'terraform apply --auto-approve'
        }
        sh "pwd"
         }
      }
    }
    
    
    stage('Terraform destroy') {
       when{
       expression { params.terraform_destroy}
     }
      steps {
         ansiColor('xterm') {
         sh "pwd"
        dir('terraform-scripts') {
     sh label: '', script: 'terraform destroy --auto-approve'
        }
        sh "pwd"
         }
      }
    }
    
    
   stage('ansible playbook')
    {
      when{
       expression { params.terraform_apply}
     }
      steps {
        sh "pwd"
      sh 'cd ansible-scripts'
    dir('ansible-scripts') {
      sh "pwd"
      //sh 'chmod 400 ../../pem-keys/*.pem'
      sh 'chmod 400 ../../../pem-keys/"${key_name}".pem'
      sh 'ansible-playbook -i hosts.ini main.yml'   
    }
    sh "pwd"
        
     
     
      }
    }
   
    
  }
}
