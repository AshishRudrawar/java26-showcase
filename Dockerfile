FROM eclipse-temurin:26-jdk

WORKDIR /app

COPY . /app

RUN ./gradlew --no-daemon test

CMD ["./gradlew", "run", "--no-daemon", "--args='string-template'"]
