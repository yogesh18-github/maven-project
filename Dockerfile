FROM tomcat
MAINTAINER prakash
COPY webapp/target/webapp.war /usr/local/tomcat/webapps
