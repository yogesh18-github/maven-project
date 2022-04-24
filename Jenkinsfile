pipeline
{
agent any
stages

{ stage ('scm checkout')
 { steps {git branch: 'master', url: 'https://github.com/prakashk0301/maven-project'}         //use pipeline syntax generator to generate script
 }


  stage ('code compile' )
  {steps {  withMaven(globalMavenSettingsConfig: '9ab3b61d-297c-42b6-9d77-2211ad67619d', jdk: 'LocalJDK', maven: 'LocalMaven') 
   { sh 'mvn package'}
   }}
 
 stage ('docker image build')
 {steps 
  { sh 'docker build -t pkw0301/devopsdockerci:v1 .'}}
 
 
 stage ('push docker image')
 {steps 
  {withDockerRegistry(credentialsId: 'dockerHubAccount', url: 'https://index.docker.io/v1/') 
  {
    sh 'docker push pkw0301/devopsdockerci:v1'
}}}
 

}
}
