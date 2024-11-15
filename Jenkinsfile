pipeline {
    agent any
    environment{
           AWS_CREDENTIALS = credentials('aws_credentials') // Just referencing the credentials
    }
    tools {
        terraform 'terraform'
    }
    stages {
        stage('Terraform Init') {
            steps {
                sh 'terraform init'    
            }
            }
        stage('Terraform apply') {
            steps {
                sh 'terraform apply --auto-approve'
                }
            }
        stage('Ansible Playbook'){
            steps{
             sh 'sudo chmod 400 key.pem'
             sh 'sleep 10'
             sh 'ansible-playbook my_playbook.yml'
            }
        }
        }
    }
