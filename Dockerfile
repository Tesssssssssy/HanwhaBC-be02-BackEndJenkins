FROM openjdk:11-jdk-slim-stretch
ADD target/campingOnTop-0.0.1-SNAPSHOT.jar /api-0.0.1-SNAPSHOT.jar
EXPOSE 8080
CMD ["java", "-jar", "/api-0.0.1-SNAPSHOT.jar"]