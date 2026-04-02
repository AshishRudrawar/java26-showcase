package com.example.java26;

public class StringTemplateDemo {
    public static void main(String[] args) {
        String name = "Java 26";
        String message = STR."Hello, {name}! Samples from Java 26.";
        System.out.println(message);
    }
}
