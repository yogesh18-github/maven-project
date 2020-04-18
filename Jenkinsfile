pipeline {

agent any

    stages

    {
stage ("scm checkout")
{
git branch: 'master' , url: 'https://github.com/prakashk0301/maven-project'
}

stage ("package")
{
    steps {
        withMaven(jdk: 'localjdk-8', maven: 'localmaven') {
    sh 'mvn package'
}
    }
}
stage ("docker image build")
{

steps {
sh 'docker build -t pkw0301/mytomcat:0.0.1 .'

}
}
}

}
