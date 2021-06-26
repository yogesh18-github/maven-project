FROM tomcat:latest
MAINTAINER prakash
COPY webapp/target/webapp.war /usr/local/tomcat/webapps
