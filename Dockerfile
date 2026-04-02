FROM gradle:9.4.1-jdk26

WORKDIR /app

COPY . /app

RUN gradle test --no-daemon

CMD ["gradle", "run", "--no-daemon", "--args=\"string-template\""]
