# Java 26 Showcase

`java26-showcase` is a sample repository for demonstrating key Java language and library features, with a focus on modern Java development practices. This project showcases stable features that work across Java versions while preparing for Java 26 enhancements.

## Setup

Install a JDK 26 toolchain (Adoptium, Amazon Corretto, etc.)

```bash
git clone https://github.com/AshishRudrawar/java26-showcase.git
cd java26-showcase
./gradlew test
```

## Features Demonstrated

This project includes three comprehensive demos showcasing modern Java features:

### 1. Text Block Literals & String Formatting
- **Demo**: `StringTemplateDemo`
- **Features**: Multi-line strings, formatted output
- **Documentation**: [docs/StringTemplateDemo.md](docs/StringTemplateDemo.md)

### 2. Virtual Threads
- **Demo**: `VirtualThreadDemo`
- **Features**: Lightweight concurrency, high-throughput applications
- **Documentation**: [docs/VirtualThreadDemo.md](docs/VirtualThreadDemo.md)

### 3. Pattern Matching in Switch
- **Demo**: `PatternSwitchDemo`
- **Features**: Type-safe conditional logic, expressive switch expressions
- **Documentation**: [docs/PatternSwitchDemo.md](docs/PatternSwitchDemo.md)

## Usage

### Local Development

Run individual demos:
```bash
./gradlew runStringTemplate    # Text blocks demo
./gradlew runVirtualThread     # Virtual threads demo
./gradlew runPatternSwitch     # Pattern matching demo
```

Run tests:
```bash
./gradlew test
```

### Docker (No Local JDK Required)

Build the image:
```bash
docker build -t java26-showcase .
```

Run demos:
```bash
# String Template Demo (default)
docker run --rm java26-showcase

# Virtual Thread Demo
docker run --rm java26-showcase ./gradlew --no-daemon runVirtualThread

# Pattern Switch Demo
docker run --rm java26-showcase ./gradlew --no-daemon runPatternSwitch
```

## Project Structure

```
java26-showcase/
├── src/main/java/com/example/java26/
│   ├── StringTemplateDemo.java     # Text blocks demonstration
│   ├── VirtualThreadDemo.java      # Virtual threads showcase
│   └── PatternSwitchDemo.java      # Pattern matching example
├── src/test/java/com/example/java26/
│   └── SampleTests.java            # Basic unit tests
├── docs/                           # Detailed documentation
│   ├── StringTemplateDemo.md
│   ├── VirtualThreadDemo.md
│   └── PatternSwitchDemo.md
├── Dockerfile                      # Containerized build
└── build.gradle.kts               # Gradle build configuration
```

## Java Version Compatibility

- **Minimum**: Java 21 (for virtual threads)
- **Recommended**: Java 26 (full feature support)
- **CI/CD**: Tested with Java 26 in GitHub Actions

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

This project is licensed under the MIT License - see [LICENSE](LICENSE) for details.

## License

MIT