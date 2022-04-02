pipeline
{
agent any
stages

{ stage ('scm checkout')
 { steps {git branch: 'master', url: 'https://github.com/prakashk0301/maven-project'}         //use pipeline syntax generator to generate script
  
}


 {stage ('code compile' )
  {steps {  withMaven(globalMavenSettingsConfig: 'null', jdk: 'LocalJDK', maven: 'LocalMaven', mavenSettingsConfig: 'null') {
    sh 'mvn compile'
}}}
}

}
}
