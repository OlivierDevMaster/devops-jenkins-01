# Build stage
FROM maven:3.8.6-openjdk-11-slim as builder

WORKDIR /build

# Copy pom.xml and source code
COPY pom.xml .
COPY src src/

# Build the application
RUN mvn clean package -DskipTests

# Runtime stage
FROM eclipse-temurin:11.0.31_11-jre-jammy

WORKDIR /app

# Copy the built JAR from builder stage
COPY --from=builder /build/target/my-project-1.0.0.jar app.jar

# Expose port (if needed)
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
