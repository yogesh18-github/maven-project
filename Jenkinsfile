pipeline
{
agent any
stages
{
  stage('scm checkout')
    { steps {  git branch: 'master', url: 'https://github.com/prakashk0301/maven-project/'

            }
    }

   stage('compile source code')
   {   steps {  
           withMaven(jdk: 'localjava', maven: 'localmaven') {
               sh 'mvn compile'
}  }
   } 
    
    stage('build source code')
     {  steps {  
            withMaven(jdk: 'localjava', maven: 'localmaven') {
             sh 'mvn package'
              }
         }
      } 

    stage ('deploy to tomcat')
     {
       steps {
          sshagent(['tomcatdev']) {
             sh 'scp -o StrictHostKeyChecking=no **/*.war  ec2-user@172.31.45.198:/var/lib/tomcat/webapps' 
                                  }
             }
      }       
}
}
