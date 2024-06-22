FROM openjdk:17-jdk-slim-buster AS build

COPY pom.xml mvnw ./
COPY .mvn .mvn

RUN apt-get update -y
RUN apt-get install -y maven
RUN mvn dependency:resolve

COPY src src

# mesma função do install, gerar o .jar
RUN mvn package 

FROM openjdk:17-jdk-slim-buster
WORKDIR app
COPY --from=build target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]