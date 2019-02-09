FROM openjdk:11-jdk
RUN mkdir -p /usr/local/ConfigServer
WORKDIR /usr/local/ConfigServer

ARG JAR_FILE=foo
ADD target/${JAR_FILE} /usr/local/ConfigServer/service.jar

EXPOSE 8080
ADD src/main/docker/run.sh run.sh
ADD src/main/resources/config/licensingservice/licensingservice.yml properties/licensingservice.yml
RUN chmod +x run.sh
CMD ./run.sh
