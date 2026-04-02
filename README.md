# Java 26 Showcase

`java26-showcase` is a sample repository for demonstrating key Java 26 language and library features.

## Setup

Install a JDK 26 toolchain (Adoptium, Amazon Corretto, etc.)

```bash
git clone https://github.com/AshishRudrawar/java26-showcase.git
cd java26-showcase
./gradlew test
```

## Features included

- String templates (preview)
- pattern matching enhancements
- enhanced virtual threads
- vector API / foreign function improvements

## Usage

- `./gradlew run --args='string-template'`
- `./gradlew run --args='virtual-thread'`

## Docker (no local JDK needed)

Build:

```bash
docker build -t java26-showcase .
```

Run (default string-template demo):

```bash
docker run --rm java26-showcase
```

Run a specific demo:

```bash
docker run --rm java26-showcase ./gradlew --no-daemon run --args='virtual-thread'
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT