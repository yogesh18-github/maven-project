FROM tomcat
LABEL app=web
COPY webapp/target/webapp.war /usr/local/tomcat/webapps/
