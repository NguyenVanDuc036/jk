pipeline {
    agent any
    stages {
        stage('Authenticate') {
            steps {
                sh "echo -n ${env.DOCKER_TOKEN} | docker login -u ${env.DOCKER_USER} --password-stdin"
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

         stage('Deploy to Production') {
            steps {
                sshagent(credentials: ['dev-server']) {
                    sh '''
                        ssh ubuntu@172.31.30.143 "echo Hello"
                    '''
                }
            }
        }
    }
}
