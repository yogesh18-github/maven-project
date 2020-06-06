pipeline
{
agent any
stages
{
  stage('scm checkout')
    { steps {  git branch: 'master', url: 'https://github.com/prakashk0301/maven-project/'

            }
    }

   stage('compile source code')
   {   steps {  
           withMaven(jdk: 'localjava', maven: 'localmaven') {
               sh 'mvn compile'
}  }
   } 
    
    stage('build source code')
     {  steps {  
            withMaven(jdk: 'localjava', maven: 'localmaven') {
             sh 'mvn package'
              }
         }
      } 

    stage ('jenkins-ansible-integration')
     {
       steps {
          sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'ansible-playbook /etc/ansible/playbooks/tomcat-install.yml', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//etc//ansible//playbooks', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'tomcat-install.yml')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
             }
      }       
}
}
