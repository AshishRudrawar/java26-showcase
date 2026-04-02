# String Template Demo

## Overview

This demo showcases **Text Block Literals** and **String Formatting**, which are foundational features introduced in Java 13 and enhanced in later versions. While Java 26 introduces String Templates as a preview feature, this demo uses stable text blocks to demonstrate similar functionality in a compatible way.

## What are Text Block Literals?

Text block literals (introduced in Java 13) allow you to write multi-line strings more conveniently without needing escape sequences for quotes and newlines. They start with `"""` and end with `"""`.

## Code Explanation

```java
package com.example.java26;

public class StringTemplateDemo {
    public static void main(String[] args) {
        String name = "Java 26";
        // Using text blocks and simple string concatenation for now
        String message = """
            Hello, %s! Samples from Java 26.
            This showcases text block literals introduced in Java 13."""
            .formatted(name);
        System.out.println(message);
    }
}
```

### Key Components:

1. **Text Block Declaration**:
   ```java
   String message = """
       Hello, %s! Samples from Java 26.
       This showcases text block literals introduced in Java 13."""
   ```
   - The text block preserves line breaks and indentation
   - No need for `\n` or concatenation for multi-line strings

2. **String Formatting**:
   ```java
   .formatted(name)
   ```
   - Uses `String.formatted()` method (introduced in Java 15)
   - Replaces `%s` placeholder with the value of `name`
   - Similar to `String.format()` but more fluent

## How to Run

### Local Development
```bash
./gradlew runStringTemplate
```

### Docker
```bash
docker run --rm java26-showcase ./gradlew --no-daemon runStringTemplate
```

## Expected Output

```
Hello, Java 26! Samples from Java 26.
This showcases text block literals introduced in Java 13.
```

## Why This Matters

- **Readability**: Text blocks make multi-line strings much more readable
- **Maintainability**: No more escaped quotes or manual concatenation
- **Compatibility**: Works across Java versions (13+)
- **Foundation**: Prepares for Java 26's String Templates preview feature

## Future: Java 26 String Templates

In Java 26 (preview), you could write:
```java
String message = STR."Hello, \{name}! Samples from Java 26.";
```

This demo uses stable features to achieve similar results while maintaining compatibility.