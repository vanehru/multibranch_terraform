pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('terraform Init') {
            steps {
                dir('./gitops') {
                    sh '/usr/local/bin/terraform init'
                }
            }
        }

        stage('terraform plan') {
            steps {
                dir('./gitops') {
                    sh '/usr/local/bin/terraform plan'
                }
            }
        }

        stage('Approval') {
            when { branch 'main' }
            steps {
                script {
                    waitUntil {
                        fileExists('dummyfile')
                    }
                }
            }
        }

        stage('Terraform apply') {
            steps {
                dir('./gitops') {
                    sh '/usr/local/bin/terraform apply -auto-approve'
                }
            }
        }
    }
}