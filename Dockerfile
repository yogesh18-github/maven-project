FROM tomcat:latest
MAINTAINER prakash
COPY target/webapp.war /usr/local/tomcat/webapps
