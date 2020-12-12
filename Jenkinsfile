pipeline
{
agent any
stages
{
 stage ('scm checkout')
 { steps {
     git branch: 'master', url: 'https://github.com/prakashk0301/maven-project/'
         }
 }
 
 stage ('code compile')
 {
     steps {
             withMaven(jdk: 'localjava', maven: 'Localmaven') 
              {   sh 'mvn compile'  }

           }
 }


stage ('unit test framework')
{
    steps {
        withMaven(jdk: 'localjava', maven: 'Localmaven') 
         { sh 'mvn test' }

    }
}


stage ('create package')
{
    steps {
        withMaven(jdk: 'localjava', maven: 'Localmaven') 
         { sh 'mvn package' }

    }
}
 stage ('deploy to tomcat')

{ steps {

sshagent(['cicdtomcat']) {
   sh 'scp -o StrictHostKeyChecking=no **/*.war ec2-user@172.31.38.233:/var/lib/tomcat/webapps'
                         }
        }  
}



}
}
