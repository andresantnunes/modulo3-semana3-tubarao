FROM openjdk:17-jdk-slim AS build

COPY pom.xml mvnw ./
COPY .mvn .mvn
RUN ./mvnw dependency:resolve

COPY src src

# mesma função do install, gerar o .jar
RUN ./mvnw package 

FROM openjdk:17-jdk-slim
WORKDIR app
COPY --from=build target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]