FROM openjdk:8-jdk-alpine3.9

# conseguir exportar relatorios e configurar timezone
RUN apk add ttf-dejavu tzdata

# Configurar timezone
RUN cp /usr/share/zoneinfo/Brazil/East /etc/localtime \
    && echo "Brazil/East" >  /etc/timezone

COPY build/algamoney-api-0.0.1-SNAPSHOT.jar /opt
COPY build/classes/application-docker.properties /opt

RUN apk del tzdata

ENTRYPOINT [ "java","-Xdebug","-Xrunjdwp:server=y,transport=dt_socket,address=8081,suspend=n","-jar","-Dspring.config.location=/opt/application-docker.properties","/opt/algamoney-api-0.0.1-SNAPSHOT.jar","--algamoney.origin-permitida=http://localhost:8000"]