# Docker ELI10: How Docker Works Here (Super Simple Explanation)

## What is Docker? 🐳

Imagine Docker is like a magical lunchbox that can pack up your entire computer program, including all the tools and ingredients it needs, so it can run exactly the same way anywhere.

Instead of saying "Hey, you need Java 26 installed on your computer to run this," Docker says "Don't worry! I'll bring my own Java 26 and everything else I need!"

## Why Do We Use Docker Here? 🤔

Our Java program needs:
- Java 26 (a specific version of Java)
- Gradle (a tool to build Java programs)
- Ubuntu Linux (the operating system)

Not everyone has these exact versions installed. Docker lets anyone run our program without installing anything!

## Step-by-Step: How Docker Works Here 🚀

### Step 1: The Recipe (Dockerfile)
```
FROM ubuntu:24.04
RUN apt-get update && apt-get install -y wget gnupg software-properties-common
RUN wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | apt-key add -
RUN echo "deb https://packages.adoptium.net/artifactory/deb focal main" | tee /etc/apt/sources.list.d/adoptium.list
RUN apt-get update && apt-get install -y temurin-26-jdk
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY . /app
```

This is like a shopping list and cooking instructions:
- Start with Ubuntu Linux (like the base of a cake)
- Install Java 26 (add the main ingredient)
- Set up the workspace (prepare the kitchen)
- Copy our code (put the cake batter in)

### Step 2: Building the Lunchbox (docker build)
When you run:
```bash
docker build -t java26-showcase .
```

Docker does this:
1. **Reads the recipe** (Dockerfile)
2. **Follows each step** (downloads Ubuntu, installs Java, etc.)
3. **Creates a "container image"** (like packing the lunchbox)
4. **Names it** "java26-showcase" (puts a label on the lunchbox)

### Step 3: Running the Lunchbox (docker run)
When you run:
```bash
docker run --rm java26-showcase ./gradlew --no-daemon runStringTemplate
```

Docker does this:
1. **Unpacks the lunchbox** (creates a running container from the image)
2. **Starts the program** inside the container
3. **Shows you the output** (the Java program runs and prints text)
4. **`--rm` means** "throw away the lunchbox when done" (clean up)

## What Happens Inside the Container? 🔍

Imagine the container is like a tiny computer that:
- Has Ubuntu Linux installed
- Has Java 26 ready to use
- Has our Java code copied inside
- Can run commands just like a real computer

When we run `./gradlew runStringTemplate`, it's like telling this tiny computer:
"Hey, use Gradle to compile and run our StringTemplateDemo.java file!"

## Why This is Cool ✨

1. **Works Anywhere**: Same lunchbox works on Windows, Mac, or Linux
2. **No Conflicts**: Java 26 in the container doesn't affect your computer's Java
3. **Fast to Share**: Send the lunchbox (image) instead of long instructions
4. **Always Works**: No "it works on my machine" problems

## Real Example Commands

```bash
# Build the lunchbox
docker build -t java26-showcase .

# Run the Java program inside
docker run --rm java26-showcase ./gradlew --no-daemon runStringTemplate

# Output you see:
# Hello, Java 26! Samples from Java 26.
# This showcases text block literals introduced in Java 13.
```

## The Magic Behind the Scenes

- **Container**: Like a lightweight virtual machine, but faster
- **Image**: The packed lunchbox (read-only template)
- **Layers**: Each RUN/COPY command creates a layer (like stacking ingredients)
- **Registry**: Place to store/share lunchboxes (like Docker Hub)

That's Docker in a nutshell! It's just a way to package and run programs reliably anywhere. 🎉