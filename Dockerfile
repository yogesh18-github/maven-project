FROM maven:3.6.3-jdk-8 as build
WORKDIR /app
COPY . .
RUN mvn package

FROM tomcat:8
COPY --from=build /app/webapp/target/webapp.war /usr/local/tomcat/webapps
CMD ["catalina.sh", "run", "webapp.war"]
