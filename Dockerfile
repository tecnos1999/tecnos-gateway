# Use the official OpenJDK base image
FROM openjdk:17-jdk-slim

# Metadata as described above
LABEL maintainer="marketing.tecnos@gmail.com"
LABEL version="1.0"
LABEL description="Docker image for tecnos-gateway Spring Boot application"

# Set the current working directory inside the image
WORKDIR /app
EXPOSE 8080
# Copy maven executable to the image
COPY mvnw .
COPY .mvn .mvn

# Set executable permissions for the maven wrapper
RUN chmod +x mvnw

# Copy the pom.xml file to download dependencies
COPY pom.xml .

# Build all the dependencies in preparation to go offline.
# This is a separate step so the dependencies will be cached unless changes to pom.xml are made.
RUN ./mvnw dependency:go-offline -B

# Copy the project source
COPY src src

# Package the application
RUN ./mvnw package -DskipTests

# Specify the start command and entry point of the Spring Boot application
ENTRYPOINT ["java","-jar","/app/target/tecnos-gateway-0.0.1-SNAPSHOT.jar"]
