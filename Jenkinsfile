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
    stage('Copy playbook from workpsace to ansible master && run playbook to deploy artifact from ansible master to dev remote server')
     {
       steps {sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible-master', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//etc//ansible//playbooks', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'webapp/target/webapp.war'), sshTransfer(cleanRemote: false, excludes: '', execCommand: 'ansible-playbook /etc/ansible/playbooks/dev-deploy.yaml', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//etc//ansible//playbooks', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'dev-deploy.yaml')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])}
       
     }

  }
}
