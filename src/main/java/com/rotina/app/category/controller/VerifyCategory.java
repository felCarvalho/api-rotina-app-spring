package com.rotina.app.category.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("verify/category")
public class VerifyCategory {

    @GetMapping("title/check/${title}")
    public boolean checkTitle(@PathVariable("title") String title) {
        return true;
    }

}
