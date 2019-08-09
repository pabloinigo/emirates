pipeline {
    agent any
    stages {
       stage('build and Testing DEV'){
          steps{
            echo 'Build and Testing'
            sh 'chmod 755 emirates/mvnw'
            sh './mvnw -Pdev clean verify'
          }
       }
       stage('build and Testing'){
          steps{
            echo 'Build and Testing'
            sh 'chmod 755 emirates/mvnw'
            sh './mvnw verify'
          }
       }
    }
}
