pipeline
{

agent any
stages
{
  stage ('scm checkout')
{
    steps {
            git branch: 'master', url: 'https://github.com/prakashk0301/maven-project'
        }
}

{ 
    stage('compile source code')
{ 
    steps {
             withMaven(jdk: 'localjdk-8', maven: 'localmaven') {
             sh 'mvn compile'
}
    }
}

}

}

}
