FROM tomcat
LABEL app=web
COPY /var/lib/jenkins/workspace/jan-docker-ci/webapp/target/webapp.war /usr/local/tomcat/webapps
