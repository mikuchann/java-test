# https://spring.io/guides/gs/spring-boot-docker/
#FROM openjdk:8-jdk-alpine
FROM 172.16.58.154:31104/library/openjdk:11.0-jre
VOLUME /tmp
ARG jar_file
ARG http_port=8080

# Copy jar from current directory
COPY ${jar_file} app.jar

#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]

EXPOSE ${http_port}

