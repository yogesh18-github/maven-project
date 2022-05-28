pipeline
{
  agent any
  stages
  {
    stage ('scm checkout')
    {
      steps
      { git branch: 'master', url: 'https://github.com/prakashk0301/maven-project' }
    }
    
    stage ('code build')
    { steps
     { withMaven(globalMavenSettingsConfig: 'null', jdk: 'JDK_HOME', maven: 'MVN_HOME', mavenSettingsConfig: 'MyGlobalSettings') 
      { sh 'mvn package' }
     }
    }
    
  }
}
        
