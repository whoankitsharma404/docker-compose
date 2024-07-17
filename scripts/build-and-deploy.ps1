# Full path to Maven executable
$mvnPath = "C:\apache-maven-3.8.8-bin\apache-maven-3.8.8\bin\mvn.cmd"

# Navigate to the project directory
cd "C:\Users\ankit.sharma22\Desktop\web-site\15-07\website"

# Set path of maven 

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


