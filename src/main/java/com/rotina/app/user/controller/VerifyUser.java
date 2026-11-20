package com.rotina.app.user.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("verify/user")
public class VerifyUser {

    @GetMapping("username/check/${name}")
    public boolean checkUsername(@PathVariable("name") String name) {
        return true;
    }

}
