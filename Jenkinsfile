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
        sh 'cd /home/kartik/kubernetes-devops-security'
        sh 'mvn package'
        archive 'target/*.jar'
        }
        }
        stage('cleaning package'){
            steps{
                sh 'mvn clean package -DskipTests=true'
                archiveArtifacts 'target/*.jar'
        }
    }
    stage('unit testing'){
        steps{
            sh 'mvn test'
        }
    }
    stage('Report analysis generation'){
        steps{
            sh 'mvn test'
        }
        post{
            always{
                junit 'target/surefire-reports/*.xml'
//                jacoco 'target/jacoco.exec'
            }
        }
    }
//    stage('pit mutation stage'){
//        steps{
//            sh 'mvn org.pitest:pitest-maven:mutationCoverage'
//        pitmutationStatsFile: 'target/pit-reports/**/mutations.xml'
//    }}
    stage('Docker build'){
        steps{
            sh 'docker build -t kumarkartikmk57/jenjen:$BUILD_ID .'
        }
    }
    stage('Docker push'){
        steps{
            sh 'docker push kumarkartikmk57/jenjen:$BUILD_ID'
        }
    }
    stage('removing older builds'){
        steps{
            sh 'sh /home/kartik/docrm.sh'
        }
    }
    stage('kubernetes deployment'){
        steps{
            withKubeConfig([credentialsId: '554b9064-5a65-44a7-9479-1979bbb60bb0']) {
              sh 'minikube kubectl set image deployment/myapp jenkins=kumarkartikmk57/jenjen:$BUILD_ID'
           }
        }
    }
}
}