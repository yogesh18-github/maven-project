pipeline{
    agent any
    stages
    {
    stage('scm checkout') 
    {
    steps{ git 'https://github.com/yogesh18-github/maven-project'} 
    }
        stage('execute unit test framwork ') //
    {
    steps{withMaven(globalMavenSettingsConfig: '--- Use system default settings or file path ---', jdk: 'java_home', maven: 'maven_home', mavenSettingsConfig: '--- Use system default settings or file path ---') {
        {'mvn test'}
    }} //
    }
    }
    }

