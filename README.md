# Docker Configuration

## Dockerfile Explanation

Below is an explanation of the Dockerfile used to containerize the Spring Boot application:

```dockerfile
FROM openjdk:18
WORKDIR /usr/src/myapp/
COPY . /usr/src/myapp
CMD [ "java", "-jar", "website-0.0.1-SNAPSHOT.jar" ]
