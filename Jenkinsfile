pipeline{
    agent any
    stages
    {
    stage('scm checkout') 
    {
    steps{ git 'https://github.com/yogesh18-github/maven-project'} 
    }
        stage('execute unit test framwork ') 
    {
        steps{ withMaven(globalMavenSettingsConfig: 'd8a895b9-da8c-493e-8acd-a0eaa241a450', jdk: 'java_home', maven: 'maven_home', mavenSettingsConfig: '--- Use system default settings or file path ---') {
            sh 'mvn test'
        }}
    }
    
    }
    }

