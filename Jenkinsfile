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
            { sh 'mvn package' } } }
            
              
     } 
    }
    
    stage ('docker build & create docker image')
    { steps { sh 'docker build -t pkw0301/docker-cicd:01 .'}}
    
    
    stage ('docker push')
    {steps { // This step should not normally be used in your script. Consult the inline help for details.
      withDockerRegistry(credentialsId: 'DockerHub', url: 'https://index.docker.io/v1/') 
      {
    sh 'docker push pkw0301/docker-cicd:01'
           } 
    }}
  }
}
