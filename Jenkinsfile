pipeline{
    agent any
    stages
    {
    stage('scm checkout') 
    {
    steps{ git 'https://github.com/yogesh18-github/maven-project'} 
    }
    
        

        stage('sonar analysis& create package')
{
    steps{
        
    withSonarQubeEnv(installationName: 'sonar' , credentialsId: 'sonar') {
        withMaven(globalMavenSettingsConfig: 'd8a895b9-da8c-493e-8acd-a0eaa241a450', jdk: 'java_home', maven: 'maven_home', mavenSettingsConfig: '853c3e24-e8ec-434b-8cce-8bcbf5de07fd') 
        { sh 'mvn package sonar:sonar'}
    
    }}}
        stage('Deployable to vm')
{
    parallel
	{

stage('Deployable to vm1')
{
    steps{sh 'echo deployed vm1}
}
stage('Deployable to vm2')
{
steps{sh 'echo deployed vm2}
 }
 
 }}
 

}
}
