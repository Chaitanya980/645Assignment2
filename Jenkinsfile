
pipeline {
    agent any

    environment {
        DOCKER_USERNAME = 'chaitanyachaudhari07'  // Your Docker Hub username
        DOCKER_IMAGE = 'chaitanyachaudhari07/survey-web-app'  // Your Docker image name
        DOCKER_TAG = 'latest'  // Use the latest tag or you can customize
        DOCKERFILE_PATH = 'Dockerfile'  // Path to Dockerfile in your repository
        DEPLOYMENT_YAML_PATH = 'deployment.yaml'  // Path to your Kubernetes deployment YAML
        SERVICE_YAML_PATH = 'service.yaml'  // Path to your Kubernetes service YAML
        DOCKER_CREDENTIALS_ID = 'docker_cred'  // Jenkins credentials ID for Docker Hub
    }

    stages {
        stage('Clone Repository') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([string(credentialsId: DOCKER_CREDENTIALS_ID, variable: 'DOCKER_CREDENTIALS')]) {
                        // Login to Docker Hub
                        sh "echo $DOCKER_CREDENTIALS | docker login --username ${DOCKER_USERNAME} --password-stdin"

                        // Push Docker image to Docker Hub
                        docker.image("${DOCKER_IMAGE}:${DOCKER_TAG}").push()
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Deploy Kubernetes deployment and service using kubectl
                    sh "kubectl apply -f ${DEPLOYMENT_YAML_PATH}"
                    sh "kubectl apply -f ${SERVICE_YAML_PATH}"
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}