pipeline

{
agent any
stages 
{ 
stage ('scm checkout')
{
steps { git branch: 'master', url: 'https://github.com/prakashk0301/maven-project'
}}

stage ('build maven project & execute sonar')

{
 steps 
 { 

     withMaven(jdk: 'localjava', maven: 'localmaven') {
        withSonarQubeEnv(credentialsId: 'sonar') {
           sh 'mvn clean sonar:sonar package'
}
 }
 }
}
}


