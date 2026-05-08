# Stage 1 - Build the Spring Boot application
FROM maven:3.9.9-eclipse-temurin-17 AS builder

# Set working directory
WORKDIR /app

# Copy Maven configuration
COPY pom.xml .

# Copy source code
COPY src ./src

# Build the application and generate JAR
RUN mvn clean package -DskipTests

# Stage 2 - Create lightweight runtime image
FROM eclipse-temurin:17-jre-alpine

# Set working directory
WORKDIR /app

# Copy generated JAR from builder stage
COPY --from=builder /app/target/ConfigServer-0.0.1-SNAPSHOT.jar app.jar

# Expose Spring Boot port
EXPOSE 8888

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]