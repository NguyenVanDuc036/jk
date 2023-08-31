pipeline {
    agent any
    stages {
        stage('Authenticate') {
            steps {
               withDockerRegistry(credentialsId: 'dockerhub', url: 'https://index.docker.io/v1/') {}
            }
        }

         stage('Build and Push') {
            steps {
                script {
                    def image = docker.build("nguyenduc036/test_jenkins")
                    image.push()
                    image.push("latest")
                }
            }
        }
    }
}
