# Imagem base da nossa image
# Ja tem o JDK 17 e já vem com o sistema operacional por padrão
# Linux + Java 17
FROM openjdk:17-jdk-slim-buster

# Autor da imagem, opcional
LABEL authors="andre"

# Caminho de execução da aplicação
WORKDIR /app

# Copia o arquivo app.jar para dentro da pasta build
# Renomeia o "aula2-0.0.1-SNAPSHOT" para "app"
COPY target/aula2-0.0.1-SNAPSHOT.jar app.jar

#Variável de ambiente para o programa
# server-port é algo que o Spring entende e usa para definir a porta da aplicação
# SERVER-PORT subistitui o server.port=8081 no application.properties
ENV SERVER-PORT=8082

# Expõe o programa na porta 8082
# Qualquer container com essa imagem irá rodar na porta 8082
EXPOSE 8082

# Comando de execução da aplicação que esta na pasta /app
# é o mesmo comando que eu executaria na minha máquina para rodar uma aplicação java pelo jar
ENTRYPOINT java -jar app.jar