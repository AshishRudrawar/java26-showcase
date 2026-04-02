# Pattern Switch Demo

## Overview

This demo showcases **Pattern Matching in Switch Expressions**, a feature introduced in Java 14 as a preview and enhanced in Java 17 and later versions. Pattern matching allows for more expressive and concise conditional logic by combining type checking and value extraction.

## What is Pattern Matching in Switch?

Pattern matching in switch expressions allows you to:
- Test the type of a value
- Extract components from the value
- Perform conditional logic more concisely

This replaces verbose instanceof checks and casting with a more declarative approach.

## Code Explanation

```java
package com.example.java26;

public class PatternSwitchDemo {
    public static void main(String[] args) {
        Object value = 123;
        String result = switch (value) {
            case Integer i -> "Integer " + i;
            case String s -> "String " + s;
            default -> "Unknown";
        };
        System.out.println(result);
    }
}
```

### Key Components:

1. **Switch Expression**:
   ```java
   String result = switch (value) {
   ```
   - Switch can now be used as an expression (returns a value)
   - No need for break statements; each case implicitly returns

2. **Type Patterns**:
   ```java
   case Integer i -> "Integer " + i;
   ```
   - `Integer i` is a type pattern
   - Checks if `value` is an Integer and binds it to variable `i`
   - If match succeeds, `i` contains the Integer value

3. **String Patterns**:
   ```java
   case String s -> "String " + s;
   ```
   - Similar to Integer pattern but for String type
   - `s` contains the String value if the pattern matches

4. **Default Case**:
   ```java
   default -> "Unknown";
   ```
   - Handles any type not covered by previous cases
   - Required when switch is exhaustive (covers all possible types)

## How to Run

### Local Development
```bash
./gradlew runPatternSwitch
```

### Docker
```bash
docker run --rm java26-showcase ./gradlew --no-daemon runPatternSwitch
```

## Expected Output

```
Integer 123
```

## Why This Matters

- **Type Safety**: Compiler ensures exhaustive checking
- **Conciseness**: Eliminates boilerplate instanceof and casting code
- **Readability**: More declarative and easier to understand
- **Null Safety**: Patterns handle null values appropriately

## Traditional vs. Pattern Matching

### Traditional Approach:
```java
String result;
if (value instanceof Integer) {
    Integer i = (Integer) value;
    result = "Integer " + i;
} else if (value instanceof String) {
    String s = (String) value;
    result = "String " + s;
} else {
    result = "Unknown";
}
```

### Pattern Matching Approach:
```java
String result = switch (value) {
    case Integer i -> "Integer " + i;
    case String s -> "String " + s;
    default -> "Unknown";
};
```

## Advanced Patterns

Pattern matching supports more complex patterns:

- **Record Patterns** (Java 19+): Deconstruct record values
- **Nested Patterns**: Match nested structures
- **Guarded Patterns**: Add additional conditions

Example with records (future enhancement):
```java
case Point(var x, var y) when x > 0 -> "Positive X: " + x;
```

## Benefits

- **Reduced Boilerplate**: Less repetitive code
- **Better Type Safety**: Compiler catches more errors
- **Improved Readability**: Intent is clearer
- **Future-Proof**: Foundation for more advanced pattern matching features