pipeline
{
agent any
stages
{ 
 
 stage('scm checkout')
 { steps { git branch: 'master', url: 'https://github.com/prakashk0301/maven-project.git' } }


 stage ('run unit test framework')
 { steps { withMaven(jdk: 'JAVA_HOME', maven: 'MAVEN_HOME') 
   {
    sh 'mvn test'
    }
 } }

  stage ('create package & ')
 { steps { withMaven(jdk: 'JAVA_HOME', maven: 'MAVEN_HOME') 
   
     {
         sh 'mvn package'
     }
 } }
 
stage('send artifacts to /etc/ansible/playbooks folder')
      { steps
       {sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//etc//ansible//playbooks', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'webapp/target/*.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])}
       
      }
 
 
 stage('send playbook to /etc/ansible/playbooks folder && run playbook on ansible master server remotelly')
 { steps {sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'ansible-playbook /etc/ansible/playbooks/deploy_ansible.yaml', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//etc//ansible//playbooks', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'deploy_ansible.yaml')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])} 
 }
 
 
}
}


