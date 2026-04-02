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
