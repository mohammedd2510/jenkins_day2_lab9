pipeline {
    agent any
    environment{
           AWS_CREDENTIALS = credentials('aws_credentials') // Just referencing the credentials
           SSH_KEY = credentials('ssh_credentials') // Load the secret text
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
             sh 'echo $SSH_KEY'   
             sh 'sudo chmod 400 key.pem'
             sh 'sleep 13'
             sh 'ansible-playbook my_playbook.yml'
            }
        }
        }
    }
