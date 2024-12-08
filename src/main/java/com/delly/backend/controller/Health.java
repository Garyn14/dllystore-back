package com.delly.backend.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Health {

    @GetMapping()
    public String helloWord() {
        return "Hello World";
    }
}
