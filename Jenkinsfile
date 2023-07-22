pipeline {
    agent any

    environment {
		AWS_ACCESS_KEY_ID = crdebtials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = crdebtials('AWS_SECRET_ACCESS_KEY')
        
        
    }

    stages{
        
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('terraform Init'){
            steps{
                dir('./gitops') {
                    sh '/usr/local/bin/terraform init'
                }
            }
        }

        stage('terraform plan'){
            steps{
                dir('./gitops') {
                    sh '/usr/local/bin/terraform plan'
                }
            }
        }

        stage('Approval'){
            when { branch 'main' }
            steps{
                script{
                    waituntil{
                        fileExists('dummyfile')
                    }
                }
            }
        }

        stage('Terraform apply'){
            steps{
                dir('./gitops') {
                    sh '/usr/local/bin/terraform apply -auto-approve'
                }
            }
        }        
    
            
    }


}


