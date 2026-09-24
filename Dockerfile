FROM tomcat:latest
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY webapp ./webapp
RUN mvn clean package -DskipTests
