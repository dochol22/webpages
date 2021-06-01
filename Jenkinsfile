pipeline {
    agent any
    environment {
        DOCKER_IMAGE_NAME = "dochol22/webpages"
    }
    stages {
        stage('Build Docker Image') {
            when {
                branch 'master'
            }
            steps {
                script {
                    app = docker.build(DOCKER_IMAGE_NAME)
                    app.inside {
                      echo "Hello world!"
                    }
                }
            }
        }
      stage('Push Docker Image') {
            when {
                branch 'master'
            }
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_api_key') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
      stage('DeployToProduction') {
            when {
                branch 'master'
            }
            environment { 
                CANARY_REPLICAS = 0
            }
            steps {
                input 'Deploy to Production?'
                milestone(1)
                //kubernetesDeploy(
                //    kubeconfigId: 'kubeconfig',
                //    configs: 'train-schedule-kube-canary.yml',
                //    enableConfigSubstitution: true
                //)
                kubernetesDeploy(
                    kubeconfigId: 'kubeconfig',
                    configs: 'k8s_deploy.yml',
                    enableConfigSubstitution: true
                )
            }
        }
    }
}
