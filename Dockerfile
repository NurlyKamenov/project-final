FROM openjdk:17
ARG JAR_FILE=target/*.jar
COPY resources ./resources
COPY ${JAR_FILE} jira-1.0.jar
ENTRYPOINT ["java","-jar","-Dspring.profiles.active=prod","/jira-1.0.jar"]