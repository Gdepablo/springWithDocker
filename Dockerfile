FROM maven:alpine as build
COPY pom.xml .
FROM openjdk:17-jdk-alpine
RUN mvn clean package

RUN java-jar target/docker-message-server-1.0.0.jar
COPY target/docker-message-server-1.0.0.jar .
ENTRYPOINT ["java","-jar","/message-server-1.0.0.jar"]
# El entrypoint no permite sobreescritura, el CMD sí
#Para ejecutar en unix se hace con
#sudo docker build -t docker-java-jar:latest
#Queda investigar bien que es lo de docker java jar
#el image no es necesario (o sea docker image build...)
#Guias: stackoverflow y baeldung
#Revisar el POM con las versiones porque está dando error al ejecutar por un tema de que estas ejecutando algo viejo con un compilador
#mas reciente
