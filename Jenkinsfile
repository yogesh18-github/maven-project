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
    
    stage ('publish artifact to ansible remote server')
    {steps 
     { sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible-master', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//etc//ansible//playbooks', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'webapp/target/webapp.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])}}
    
  }
}
        
