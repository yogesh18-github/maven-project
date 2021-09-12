pipeline
{
  agent any
  stages
  {
    stage('scm checkout')
    { steps { git branch: 'master', url: 'https://github.com/prakashk0301/maven-project.git' } }

    stage('Code build && Execute Unit Test case')
    { parallel 
     { 
       stage ('Execute Unit Test case')
       { steps { withMaven(jdk: 'JAVA_HOME', maven: 'MAVEN_HOME') 
                { sh 'mvn test' } 
               } 
       }
       
       stage ('Code build')
       { steps 
        { withMaven(jdk: 'JAVA_HOME', maven: 'MAVEN_HOME')      
           { sh 'mvn package' } }
            
       }
       
     } 
    }
  }
}
