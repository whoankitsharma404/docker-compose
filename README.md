# Docker Configuration

## Dockerfile Explanation

Below is an explanation of the Dockerfile used to containerize the Spring Boot application:

```dockerfile
FROM openjdk:18
WORKDIR /usr/src/myapp/
COPY . /usr/src/myapp
CMD [ "java", "-jar", "website-0.0.1-SNAPSHOT.jar" ]

```


# Maven and Docker Integration

## Maven Setup and Docker Deployment

Below is a detailed explanation of how Maven and Docker are integrated in this project:

```powershell
# Full path to Maven executable
$mvnPath = "C:\apache-maven-3.8.8-bin\apache-maven-3.8.8\bin\mvn.cmd"

# Navigate to the project directory
cd "C:\Users\ankit.sharma22\Desktop\web-site\15-07\website"

# Run Maven build
& $mvnPath clean install

# Check if the Maven build was successful
if ($LASTEXITCODE -ne 0) {
    Write-Error "Maven build failed."
    exit $LASTEXITCODE
}

# Copy the generated JAR to the Docker context
Copy-Item -Path "target\website-0.0.1-SNAPSHOT.jar" -Destination "C:\Users\ankit.sharma22\Desktop\docker-compose\boot" -Force

# Navigate to the directory containing docker-compose.yml
cd "C:\Users\ankit.sharma22\Desktop\docker-compose\"

# Build and run the Docker containers
docker-compose up --build

```

## Docker Compose Configuration
## Below is the Docker Compose configuration (docker-compose.yml) used to define and orchestrate your application's Docker containers:

```
version: '3.8'
services:
  app:
    build: ./boot
    depends_on:
      - db
    image: website-image
    container_name: website
    ports:
      - "9999:9999"
    environment:
      SPRING_DATASOURCE_URL: jdbc:postgresql://db:5432/website_db?createDatabaseIfNotExists=true
      SPRING_DATASOURCE_USERNAME: postgres
      SPRING_DATASOURCE_PASSWORD: postgres
      SPRING_JPA_HIBERNATE_DDL_AUTO: update


  db:
    image: postgres:latest
    container_name: postgres_db
    ports:
      - "5432:5432"
    environment:
      POSTGRES_DB: website_db
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
    volumes:
      - ./postgres_data:/var/lib/postgresql

```



