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

WORKDIR /app

COPY . /app

# Set JVM options for Java 26 preview features and native access
ENV JAVA_OPTS="--enable-preview --add-opens java.base/java.lang=ALL-UNNAMED" \
    GRADLE_OPTS="--enable-preview --add-opens java.base/java.lang=ALL-UNNAMED"

# Note: Build temporarily disabled due to Java 26 preview features compilation
# The image will run the compiled classes directly via runStringTemplate task

CMD ["./gradlew", "runStringTemplate", "--no-daemon"]
