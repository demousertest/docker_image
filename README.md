task 4:- Jenkinsfile Implementation
- upload all the files(dockerfile, script files and folders) in git account using git bash or terminal.
- open the jenkins in chrome and create a new job by clicking on new item and provide the job name and select pipeline then click on ok to create a new pipeline for docker image
- write description and eg:- python docker image
- write docker pipeline script for connecting git account, building images, upload image and run image


- Pipeline code


pipeline {
    agent any 
    environment {
        //once you sign up for Docker hub, use that user_id here
        registry = "hemantmahawer/pythondockerimage"
        //- update your credentials ID after creating credentials for connecting to Docker Hub
        registryCredential = "c83ff856-59c0-40a8-b44b-9b27441ae573"
        dockerImage = ''
    }
    
    stages {
        stage('Cloning Git') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/demousertest/docker_image.git']]])       
            }
        }
    
    // Building Docker images
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry
        }
      }
    }
    
     // Uploading Docker images into Docker Hub
    stage('Upload Image') {
     steps{    
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
            }
        }
      }
    }
    
 
    
    // Running Docker container, make sure port 8096 is opened in 
    stage('Docker Run') {
     steps{
         script {
            bat "docker run %registry%"
         }
      }
    }
  }
}



Task 5: Docker Tasks
- puch the docker image into docker hub using the command "docker push dockerId/app_name:version"
eg: - docker push hemantmahawer/reverse_function:v1.0
- remove the docker image from local system using the command "docker rmi dockerId/app_name:version"
eg: - docker rmi hemantmahawer/reverse_function:v1.0
- pull the docker image from dockerhub to local system using the command "docker pull dockerId/app_name:version"
eg: - docker pull hemantmahawer/reverse_function:v1.0