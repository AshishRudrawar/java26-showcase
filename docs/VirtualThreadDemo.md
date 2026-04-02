# Virtual Thread Demo

## Overview

This demo showcases **Virtual Threads**, a major concurrency enhancement introduced in Java 21 as a preview feature and stabilized in later versions. Virtual threads allow for lightweight concurrency, enabling millions of concurrent tasks without the overhead of traditional platform threads.

## What are Virtual Threads?

Virtual threads are lightweight threads managed by the JVM that can dramatically increase concurrency without the resource costs of platform threads. They are particularly useful for I/O-bound operations and high-throughput applications.

## Code Explanation

```java
package com.example.java26;

import java.util.concurrent.Executors;

public class VirtualThreadDemo {
    public static void main(String[] args) throws Exception {
        var executor = Executors.newVirtualThreadPerTaskExecutor();
        try (executor) {
            for (int i = 0; i < 5; i++) {
                int id = i;
                executor.submit(() -> {
                    try {
                        Thread.sleep(100);
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                    System.out.println("Virtual thread #: " + id + " - " + Thread.currentThread());
                });
            }
        }
    }
}
```

### Key Components:

1. **Virtual Thread Executor**:
   ```java
   var executor = Executors.newVirtualThreadPerTaskExecutor();
   ```
   - Creates an executor that spawns a new virtual thread for each submitted task
   - Virtual threads are managed by the JVM and are much lighter than platform threads

2. **Try-with-Resources for Executor**:
   ```java
   try (executor) {
   ```
   - Ensures the executor is properly shut down after use
   - Prevents resource leaks

3. **Task Submission**:
   ```java
   executor.submit(() -> {
       // task code
   });
   ```
   - Each task runs on its own virtual thread
   - Tasks can perform blocking operations without blocking platform threads

4. **Thread Information**:
   ```java
   System.out.println("Virtual thread #: " + id + " - " + Thread.currentThread());
   ```
   - Shows the virtual thread's identity
   - Virtual threads have names like `VirtualThread[#29]/runnable@ForkJoinPool-1-worker-4`

5. **Exception Handling**:
   ```java
   try {
       Thread.sleep(100);
   } catch (InterruptedException e) {
       Thread.currentThread().interrupt();
   }
   ```
   - Proper handling of thread interruption
   - Restores the interrupted status

## How to Run

### Local Development
```bash
./gradlew runVirtualThread
```

### Docker
```bash
docker run --rm java26-showcase ./gradlew --no-daemon runVirtualThread
```

## Expected Output

```
Virtual thread #: 1 - VirtualThread[#29]/runnable@ForkJoinPool-1-worker-4
Virtual thread #: 3 - VirtualThread[#31]/runnable@ForkJoinPool-1-worker-1
Virtual thread #: 2 - VirtualThread[#30]/runnable@ForkJoinPool-1-worker-2
Virtual thread #: 4 - VirtualThread[#32]/runnable@ForkJoinPool-1-worker-3
Virtual thread #: 0 - VirtualThread[#27]/runnable@ForkJoinPool-1-worker-5
```

*Note: The exact thread numbers and worker assignments may vary between runs.*

## Why This Matters

- **Scalability**: Handle millions of concurrent connections
- **Resource Efficiency**: Virtual threads use minimal stack space
- **Simplified Code**: Write concurrent code like sequential code
- **I/O Bound Operations**: Perfect for web servers, databases, and network services

## Performance Benefits

- **Low Overhead**: Virtual threads can be created in microseconds
- **High Throughput**: Support for millions of concurrent tasks
- **Platform Thread Efficiency**: Platform threads are reserved for CPU-bound work
- **Automatic Scheduling**: JVM manages thread scheduling optimally

## Use Cases

- Web servers handling many concurrent requests
- Database connection pooling
- Network services with many connections
- Microservices architectures
- Reactive programming patterns