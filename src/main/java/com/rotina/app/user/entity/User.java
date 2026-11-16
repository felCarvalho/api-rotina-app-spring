package com.rotina.app.user.entity;

import com.rotina.app.auth.entity.UserRole;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;

@Entity
public class User {

    private String name;

    @OneToMany(mappedBy = "user")
    private UserRole userRole;
}
