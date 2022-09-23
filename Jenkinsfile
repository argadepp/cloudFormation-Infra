pipeline {
    agent any

    

    environment {

    }

     parameters {
         booleanParam(name: 'Refresh', defaultValue: false, description: 'Refresh this Job')

        choice(name: 'environment', choices: ['dev', 'qa', 'stage', 'stage-or', 'prod','toolchain'], description: '')

        choice(name: 'application_account', choices: ['travel', 'pci','toolchain','travelclient','partners'], description: '')
     }
    stages {
        stage('Build') {
            steps {
                git 'https://github.com/argadepp/cloudFormation-Infra.git'
                
            }
        }
   
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
