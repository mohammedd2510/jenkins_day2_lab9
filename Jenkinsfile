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
             sh 'sleep 13'
             sh 'ansible-playbook --private-key ${SSH_KEY} my_playbook.yml'
            }
        }
        }
    }
