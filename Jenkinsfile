pipeline{
    agent any
    stages{
        stage('Git version check'){
            steps{
                sh 'git version'
            }
        }
        stage('docker version check'){
            steps{
                sh 'docker -v'
            }
        }
        stage('maven version check'){
            steps{
                sh 'mvn -version'
            }
        }
        stage('Kubernetes version check'){
            steps{
              withKubeConfig([credentialsId: '554b9064-5a65-44a7-9479-1979bbb60bb0']) {
              sh 'minikube kubectl version'
           }
            }
        }
        stage('maven build'){
        steps{
        sh 'mvn package'
        }
        }
    }
}