pipeline
{
  agent any
  stages
  {
    stage('scm checkout')
    { steps { git branch: 'master', url: 'https://github.com/prakashk0301/maven-project.git' } }

    stage('build the code')
    { steps { withMaven(jdk: 'JAVA_HOME', maven: 'MAVEN_HOME') 
      { sh 'mvn package' }  
    
    }}

//terraform and ansible stages need to be invoked to automate instance and instance configuration
    stage('deploy to dev')
     {
      steps 
       {
        sshagent(['tomcat-pipeline']) 
        { sh 'scp -o StrictHostKeyChecking=no */target/*.war ec2-user@172.31.3.82:/usr/share/tomcat/webapps' }  
   }

}

  }
}
