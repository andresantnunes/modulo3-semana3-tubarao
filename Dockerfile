FROM openjdk:17-jdk-slim AS build

COPY pom.xml mvnw ./
COPY .mvn .mvn

RUN apt-get update
RUN apt-get install maven
RUN mvn dependency:resolve

COPY src src

# mesma função do install, gerar o .jar
RUN mvn package 

FROM openjdk:17-jdk-slim
WORKDIR app
COPY --from=build target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]