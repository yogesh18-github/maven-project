FROM tomcat
LABEL  name=prakash
COPY webapp/target/webapp.war /usr/local/tomcat/webapps