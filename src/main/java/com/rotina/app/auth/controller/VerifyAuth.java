package com.rotina.app.auth.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("verify/auth")
public class VerifyAuth {

    @GetMapping("credentials/check/${identifier}")
    public boolean checkCredentials(@PathVariable("identifier") String identifier) {
        return true;
    }

}
