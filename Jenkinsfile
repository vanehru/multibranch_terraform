pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        TERRAFORM_BINARY = sh(returnStdout: true, script: 'which terraform').trim()
    }

    stages {
        // ... your stages here ...
        stage('terraform Init') {
            steps {
                dir('./gitops') {
                    sh "${TERRAFORM_BINARY} init"
                }
            }
        }

        stage('terraform plan') {
            steps {
                dir('./gitops') {
                    sh "${TERRAFORM_BINARY} plan"
                }
            }
        }

        stage('Terraform apply') {
            steps {
                dir('./gitops') {
                    sh "${TERRAFORM_BINARY} apply -auto-approve"
                }
            }
        }
    }
}
