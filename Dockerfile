FROM tomcat:latest
WORKDIR /app
COPY pom.xml .
COPY webapp ./webapp
RUN mvn clean package -DskipTests
