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
 
stage ('publish artifact to ansible')
 { steps { sh "sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '/etc/ansible/playbooks', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'webapp/target/webapp.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])" }}
 
}
}


