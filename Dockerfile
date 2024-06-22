FROM openjdk:17-jdk-slim-buster AS build


COPY . .
RUN chmod 700 mvnw

# mesma função do install, gerar o .jar
RUN ./mvnw clean package 

FROM openjdk:17-jdk-slim-buster
WORKDIR app
COPY --from=build target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]