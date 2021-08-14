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

   stage('create docker image & push to dockerhub')   
   {  steps { sh 'docker build -t pkw0301/june-docker:v1 .'}

   }
   
}
}
