FROM openjdk:17-jdk-slim-buster AS build

COPY pom.xml ./
COPY mvnw ./
COPY .mvn .mvn

RUN ./mvnw dependency:resolve

COPY src src

# mesma função do install, gerar o .jar
RUN ./mvnw mvn package 

FROM openjdk:17-jdk-slim-buster
WORKDIR app
COPY --from=build target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]