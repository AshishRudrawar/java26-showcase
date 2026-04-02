plugins {
    `java-library`
}

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(26))
    }
}

repositories {
    mavenCentral()
}

tasks.test {
    useJUnitPlatform()
}
