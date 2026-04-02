plugins {
    `java-library`
    application
}

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(26))
    }
}

application {
    mainClass.set("com.example.java26.StringTemplateDemo")
}

repositories {
    mavenCentral()
}

tasks.compileJava {
    options.compilerArgs.add("--enable-preview")
}

tasks.test {
    useJUnitPlatform()
    jvmArgs("--enable-preview")
}

tasks.run.configure {
    jvmArgs("--enable-preview")
}

// Task to run StringTemplateDemo
tasks.register("runStringTemplate", JavaExec::class) {
    group = "demo"
    description = "Run String Template Demo"
    mainClass.set("com.example.java26.StringTemplateDemo")
    classpath = sourceSets["main"].runtimeClasspath
    jvmArgs("--enable-preview")
}

// Task to run VirtualThreadDemo
tasks.register("runVirtualThread", JavaExec::class) {
    group = "demo"
    description = "Run Virtual Thread Demo"
    mainClass.set("com.example.java26.VirtualThreadDemo")
    classpath = sourceSets["main"].runtimeClasspath
    jvmArgs("--enable-preview")
}

// Task to run PatternSwitchDemo
tasks.register("runPatternSwitch", JavaExec::class) {
    group = "demo"
    description = "Run Pattern Switch Demo"
    mainClass.set("com.example.java26.PatternSwitchDemo")
    classpath = sourceSets["main"].runtimeClasspath
    jvmArgs("--enable-preview")
}
