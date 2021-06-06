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


     stage ('deploy-to-tomcat')
     { steps { 
          sshagent(['tomcat-deploy']) {
          sh 'scp -o StrictHostKeyChecking=no */target/webapp.war ec2-user@172.31.1.201:/var/lib/tomcat/webapps'
             }

      }


 }
}
