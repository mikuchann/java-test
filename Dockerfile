# https://spring.io/guides/gs/spring-boot-docker/
#FROM openjdk:8-jdk-alpine
FROM 172.16.58.154:31104/library/openjdk:11.0-jre
VOLUME /tmp
ARG jar_file
ARG http_port=8080

# Copy jar from current directory
COPY ${jar_file} app.jar

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]

EXPOSE ${http_port}

curl -X GET http://10.119.21.110:31929/hehe -H 'Authorization: bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiIwZVAwUUNTM1JuU2hEZHk5RUpXTXpWRUZ6ZzZBcGFMNyJ9.g7PLfiNnrg-63CvYeiaHCcIRxRFfqBk217YJOJMkBgAJedIwNlll8-wj2U_M0wIhg7zmryuqwfG-mqO3DI0LJRlylcAeVJ1n_f2QOokxy0kusfcdM8s-u9Wv0c6R-mDyMBU_EKXkaktVr-bIkPIuNgADbgQH7IbqENHPqT5YRRTKp6Ol68zfNbYA_w8oFLLvD9Zvd44BgYZx87071vR97bJ5z6NbGJlyFyZMUXY1Q3gVTpEtnmu_e3MYun7AxeJQR8dEoZn_EsdF_1WjNjGvvjA_P_lwqjgwCSLXSLz9Uqyo0ZLlZSI0vKrnZay_RyfYqNuFqLUjWABmUhwSeLFgbA'
git clone https://github.com/kubernetes-incubator/external-storage.git
cp -R external-storage/nfs-client/deploy/ $HOME
cd deploy
