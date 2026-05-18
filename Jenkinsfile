pipeline {
    agent any

    stages {
        stage('GIT CHECKOUT') {
            steps {
               git branch: 'main',
               url: 'https://github.com/OlivierDevMaster/devops-jenkins-01.git'
                // Run the build on a Unix agent. You must have Maven installed.
                // sh 'mvn clean && mvn compile && mvn test'
            }
        }
        
        stage('Build the application') {
            steps {
                sh 'mvn clean install'
            }
        }
        
        stage('Unit Test Execution') {
            steps{
                sh 'mvn test'
            }
        }
        
        stage('Build the docker image') {
            steps {
                sh 'docker build -t olivierdocker1/devops-tp-02 .'
            }
        }
        
        stage('Deploy to docker hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'c4b59f87-820a-4ed3-8951-6cdf0e68f025', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                   sh 'docker login -u $USERNAME -p $PASSWORD'
                }
                sh 'docker push olivierdocker1/devops-tp-02'
            }
        }
    }
}
