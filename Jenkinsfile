pipeline
{
agent any
stages
{
 stage ('scm checkout')
 { steps {
     git branch: 'master', url: 'https://github.com/prakashk0301/maven-project/'
         }
 }
 
 stage ('code compile')
 {
     steps {
             withMaven(jdk: 'localjava', maven: 'Localmaven') 
              {   sh 'mvn compile'  }

           }
 }




}
}
