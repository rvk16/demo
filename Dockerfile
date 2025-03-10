# Use a more lightweight JRE image instead of JDK
FROM eclipse-temurin:17-jre-jammy

WORKDIR /app

# Add metadata labels
LABEL app="demo-app"

# Copy the JAR file
COPY target/demo-0.0.1-SNAPSHOT.jar app.jar

# Expose the port
EXPOSE 8080

# Add healthcheck
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:8080/actuator/health || exit 1

# Run with explicit memory settings
ENTRYPOINT ["java", "-jar", "app.jar"]