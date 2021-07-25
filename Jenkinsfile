pipeline
{
agent any
stages
{
   stage('scm checkout')
   { steps {  git branch: 'master', url: 'https://github.com/prakashk0301/maven-project'  }  }


   stage('execute unit test')
   { steps {  withMaven(jdk: 'MY_JDK', maven: 'MY_MAVEN') 
      { sh 'mvn test' }   
   } }

   stage('code build && generate artifacts')
   { steps { withMaven(jdk: 'MY_JDK', maven: 'MY_MAVEN') 
      { sh 'mvn clean package' }  
   } }

   stage('deploy to dev tomcat')
   { steps {  sshagent(['tomcatdeploy']) 
     { sh 'scp -o StrictHostKeyChecking=no */target/*.war ec2-user@3.68.85.167:/var/lib/tomcat/webapps' }
   } }
   
}
}
