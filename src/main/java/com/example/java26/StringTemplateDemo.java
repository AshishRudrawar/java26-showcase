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
