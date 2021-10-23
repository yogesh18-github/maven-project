pipeline
{
  agent any
  stages
  {
    stage('scm checkout')
    { steps { git branch: 'master', url: 'https://github.com/prakashk0301/maven-project.git' } }

    
    
    stage ('copy k8s manifest file')
      {steps { sshagent(['k8s-ssh']) 
        {sh 'sudo scp -o StrictHostKeyChecking=no k8s-deployment.yaml ubuntu@172.31.26.178:/home/ubuntu'}
} }

    }}
