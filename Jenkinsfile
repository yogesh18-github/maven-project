pipeline{
    agent any
    stages
    {
    stage('scm checkout') 
    {
    steps{ git 'https://github.com/yogesh18-github/maven-project'} 
    }
    stage('execute')
    {steps {withMaven(globalMavenSettingsConfig: 'd8a895b9-da8c-493e-8acd-a0eaa241a450', jdk: 'java_home', maven: 'maven_home', mavenSettingsConfig: '853c3e24-e8ec-434b-8cce-8bcbf5de07fd') {
        sh 'mvn clean package'
    }}}
        stage('Deployable to Dev package')
{
    steps{sshagent(['c002df63-2e69-4f97-9845-2daaf73a7013']) {
    sh 'scp -o StrictHostKeyChecking=no */target/webapp.war ec2-user@35.154.66.221:/var/lib/tomcat/webapps'
}}}

}
}
