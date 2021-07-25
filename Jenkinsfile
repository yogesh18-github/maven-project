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
   
}
}
