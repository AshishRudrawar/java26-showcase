package com.example.java26;

import java.util.concurrent.Executors;

public class VirtualThreadDemo {
    public static void main(String[] args) throws Exception {
        var executor = Executors.newVirtualThreadPerTaskExecutor();
        try (executor) {
            for (int i = 0; i < 5; i++) {
                int id = i;
                executor.submit(() -> {
                    Thread.sleep(100);
                    System.out.println("Virtual thread #: " + id + " - " + Thread.currentThread());
                });
            }
        }
    }
}
