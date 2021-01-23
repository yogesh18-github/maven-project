pipeline
{
    agent any
    stages
    {
       stage ('scm checkout')
        {
            steps { git branch: 'master', url: 'https://github.com/prakashk0301/maven-project' }
        }

        stage ('code test')
        {
            steps { withMaven(jdk: 'JAVA_HOME', maven: 'MAVEN_HOME') {
    // comment a line
            sh 'mvn test'
                  }                                                 }
        }
        stage ('build the code , execute sonar and generate artifacts')
        { steps 
               {
               withSonarQubeEnv(credentialsId: 'sonar', installationName: 'sonar')
                 { withMaven(jdk: 'JAVA_HOME', maven: 'MAVEN_HOME') 
                    {  sh 'mvn clean package sonar:sonar' }
                 }
                }
         }

         stage ('deploy artifacts/packages to dev/tomcat server')
         {
           steps { sshagent(['ci-cd']) {
             sh 'scp -o StrictHostKeyChecking=no */target/*.war ec2-user@172.31.38.129:/var/lib/tomcat/webapps'
         } }

         }



    }

}