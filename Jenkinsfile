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
 
 
 stage('dev-deployment')
{steps 
  { sshagent (credentials: ['deploy-dev']) 
    {
       sh 'scp -o StrictHostKeyChecking=no */target/*.war ec2-user@172.31.34.209:/var/lib/tomcat/webapps/'
  }}}
 


}
}
