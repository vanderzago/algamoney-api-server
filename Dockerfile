FROM openjdk:8-jdk-alpine3.9

COPY build/algamoney-api-0.0.1-SNAPSHOT.jar /opt

ENTRYPOINT [ "java","-jar","-Dspring.profiles.active=docker","/opt/algamoney-api-0.0.1-SNAPSHOT.jar"]