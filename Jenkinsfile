pipeline
{
agent any
stages
{ 
 
 stage('scm checkout')
 { steps { git branch: 'master', url: 'https://github.com/prakashk0301/maven-project.git' } }


 stage ('run unit test framework')
 { steps { withMaven(jdk: 'JAVA_HOME', maven: 'MAVEN_HOME') 
   {
    sh 'mvn test'
    }
 } }

  stage ('create package & ')
 { steps { withMaven(jdk: 'JAVA_HOME', maven: 'MAVEN_HOME') 
   
     {
         sh 'mvn package'
     }
 } }
 
stage ('Create docker image from Dockerfile ')
 {steps { sh 'docker build -t pkw0301/oct-dockerci:latest .' }}

 
stage ('Push doccker image ')
  { steps { withDockerRegistry(credentialsId: 'DockerHubReg', url: 'https://index.docker.io/v1/') {
      sh 'docker push pkw0301/oct-dockerci:latest'
} }}
 
}
}


