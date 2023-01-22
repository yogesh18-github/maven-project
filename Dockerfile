FROM ubuntu
LABEL "Website.env"="Dev"
RUN apt-get update && \
apt-get install wget -y && \
apt-get install openjdk-8-jdk -y &&\
apt-get install gzip -y && \
wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.85/bin/apache-tomcat-8.5.85.tar.gz && \
tar  xvzf apache-tomcat-8.5.85.tar.gz
WORKDIR /apache-tomcat-8.5.85/webapps
COPY wget /var/lib/jenkins/workspace/oct-pipeline-maven/webapp/target/webapp.war /usr/local/tomcat/webapps/
CMD ["/apache-tomcat-8.5.85/bin/catalina.sh", "run"]
