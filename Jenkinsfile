pipeline
{
agent any
stages
{
  stage ('scm checkout') {
    steps {
            git branch: 'master', url: 'https://github.com/prakashk0301/maven-project'
        }
}
  stage('compile source code')
{ 
    steps {
             withMaven(jdk: 'localjdk-8', maven: 'localmaven') {
             sh 'mvn compile'
          }
       }
   }
   stage ('test') {
       steps {
           withMaven(jdk: 'localjdk-8', maven: 'localmaven') {
           sh 'mvn test'
}
       }
   }
    stage ('build my job')
    {
        steps {
            withMaven(jdk: 'localjdk-8', maven: 'localmaven') {
                sh 'mvn package'
            }
        }
    }
    stage ('tomcat dev deployment') 
    {
        steps {
            sshagent(['deploytomcat']) {
    sh 'scp -o StrictHostKeyChecking=no */target/*.war ec2-user@172.31.44.18:/var/lib/tomcat/webapps'
}
        }
    }
}
}
