FROM eclipse-temurin:17-jdk-alpine
ARG JAR_FILE=target/*.jar
COPY resources ./resources
COPY ${JAR_FILE} jira-1.0.jar
ENTRYPOINT ["java","-jar","/jira-1.0.jar"]