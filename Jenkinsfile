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
               withSonarQubeEnv(credentialsId: 'sonar', installationName: 'sonar')) 
                 { withMaven(jdk: 'JAVA_HOME', maven: 'MAVEN_HOME') 
                    {  sh 'mvn clean package sonar:sonar' }
                 }
                }
         }



    }

}