package com.rotina.app.task.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("verify/task")
public class VerifyTask {

    @GetMapping("title/check/${title}")
    public boolean verifyTask(@PathVariable("title") String title) {
        return true;
    }

}
