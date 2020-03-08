FROM openjdk:8-jdk-alpine3.9

LABEL maintainer="Vander Zago"

# conseguir exportar relatorios e configurar timezone
RUN apk --no-cache add ttf-dejavu tzdata curl

# Configurar timezone
RUN cp /usr/share/zoneinfo/Brazil/East /etc/localtime \
    && echo "Brazil/East" >  /etc/timezone

COPY build/algamoney-api-0.0.1-SNAPSHOT.jar /opt
COPY build/classes/application-docker.properties /opt
COPY sh/ /opt

RUN dos2unix /opt/*.sh

CMD /opt/init.sh $FRONT_URL