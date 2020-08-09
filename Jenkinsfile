pipeline
{
   agent any
   stages
   { 
       stage('scm checkout')
       {
           steps {
               git branch: 'master', url: 'https://github.com/prakashk0301/maven-project'
                 }
       }

       stage('please compile code')
       { steps {
           withMaven(jdk: 'locakjdk-1.8', maven: 'localmaven') {
            sh 'mvn compile'
}
       }

       }
      
           stage('please test code')
       { steps {
           withMaven(jdk: 'locakjdk-1.8', maven: 'localmaven') {
            sh 'mvn test'
}
       }

       }
        stage('please build code')
       { steps {
           withMaven(jdk: 'locakjdk-1.8', maven: 'localmaven') {
            sh 'mvn package'
}
       }

       }
      
      stage('send install tomcat playbook')
      { steps 
       {sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'ansible-playbook /etc/ansible/playbooks/install_tomcat.yml', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '//etc//ansible//playbooks', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'install_tomcat.yml')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])}
      
      
      }
      
 
}
}
