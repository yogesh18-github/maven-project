pipeline
{
 agent any
 stages{

     stage('scm checkout')
     {steps {  git branch: 'master', url: 'https://github.com/prakashk0301/maven-project' }    }

     stage ('unit test framework')
     { steps {  withMaven(jdk: 'jdk-1.8', maven: 'my_maven') 
          { sh 'mvn test' }  }  }

     stage ('code Build')
     { steps {  withMaven(jdk: 'jdk-1.8', maven: 'my_maven') 
          { sh 'mvn clean package' }  }  }

     stage ('Docker build and Push')
      { steps {
         withDockerRegistry(credentialsId: 'DockerHubAccount', url: 'https://index.docker.io/v1/') 
          {
          sh 'docker build -t pkw0301/devops-april-tomcat:latest .'
          sh 'docker push pkw0301/devops-april-tomcat:latest'
          } 
         } 
      }
  
     
 }
}
