pipeline {
    agent any
    stages {
       stage('build and Testing DEV'){
          steps{
            echo 'Build and Testing'
            sh 'chmod 755 mvnw'
            sh './mvnw -Pdev clean verify'
          }
       }
       stage('SonarQube DEV'){
          steps{
            echo 'SonarQube DEV'
            sh './mvnw -Pdev clean verify sonar:sonar'
          }
       }
       stage('create jar in Prod'){
          steps{
            echo 'create jar in Prod'
            sh './mvnw -Pprod clean verify'
          }
       }
       stage('create Docker image'){
          steps{
            echo 'create docker image'
            sh './mvnw -Pprod verify jib:dockerBuild'
          }
       }
    }
}
