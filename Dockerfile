FROM openjdk:8-jdk-alpine3.9

COPY build/algamoney-api-0.0.1-SNAPSHOT.jar /opt
COPY build/classes/application-docker.properties /opt

ENTRYPOINT [ "java","-Xdebug","-Xrunjdwp:server=y,transport=dt_socket,address=8081,suspend=n","-jar","-Dspring.config.location=/opt/application-docker.properties","/opt/algamoney-api-0.0.1-SNAPSHOT.jar"]