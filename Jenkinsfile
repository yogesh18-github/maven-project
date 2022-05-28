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
     { withMaven(globalMavenSettingsConfig: '193254ea-0e8f-4a50-ab38-d01a7d57b6bb', jdk: 'JDK_HOME', maven: 'MVN_HOME') 
      { sh 'mvn package' }
     }
    }
    
  }
}
        
