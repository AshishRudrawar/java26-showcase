FROM ubuntu:24.04

# Install OpenJDK 26 and Gradle
RUN apt-get update && \
    apt-get install -y wget gnupg software-properties-common && \
    wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | apt-key add - && \
    echo "deb https://packages.adoptium.net/artifactory/deb focal main" | tee /etc/apt/sources.list.d/adoptium.list && \
    apt-get update && \
    apt-get install -y temurin-26-jdk && \
    wget -q https://services.gradle.org/distributions/gradle-8.10.2-bin.zip -P /tmp && \
    unzip -d /opt/gradle /tmp/gradle-8.10.2-bin.zip && \
    ln -s /opt/gradle/gradle-8.10.2/bin/gradle /usr/local/bin/gradle && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

WORKDIR /app

COPY . /app

RUN gradle test --no-daemon

CMD ["gradle", "run", "--no-daemon", "--args=\"string-template\""]
