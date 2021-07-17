pipeline
{
 agent any
 stages{

     stage('scm checkout')
     {steps {  git branch: 'master', url: 'https://github.com/prakashk0301/maven-project' }    }

     stage ('code Build')
     { steps {  withMaven(jdk: 'JDK_HOME', maven: 'Maven_Home') 
          { sh 'mvn clean package' }  }  }
  
     stage ('ci-cd')
  { steps { sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible-controller', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//etc//ansible//playbooks', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'webapp/target/*.war'), sshTransfer(cleanRemote: false, excludes: '', execCommand: 'ansible-playbook /etc/ansible/playbooks/ci-cd-playbook.yml', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//etc//ansible//playbooks', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'ci-cd-playbook.yml')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)]) }
  }  
 }}
