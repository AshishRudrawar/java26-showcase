FROM eclipse-temurin:26-jdk

WORKDIR /app

COPY . /app

RUN ./gradlew test --no-daemon

CMD ["./gradlew", "run", "--no-daemon", "--args=\"string-template\""]
