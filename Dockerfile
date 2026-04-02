FROM ubuntu:24.04

# Install OpenJDK 26
RUN apt-get update && \
    apt-get install -y wget gnupg software-properties-common && \
    wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | apt-key add - && \
    echo "deb https://packages.adoptium.net/artifactory/deb focal main" | tee /etc/apt/sources.list.d/adoptium.list && \
    apt-get update && \
    apt-get install -y temurin-26-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set JAVA_HOME for Gradle
ENV JAVA_HOME=/usr/lib/jvm/temurin-26-jdk-amd64

WORKDIR /app

COPY . /app

# Run tests with Java 26 preview features enabled
RUN ./gradlew test --no-daemon

CMD ["./gradlew", "runStringTemplate", "--no-daemon"]
