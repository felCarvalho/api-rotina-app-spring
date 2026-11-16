package com.rotina.app.user.entity;

import com.rotina.app.auth.entity.UserRole;
import com.rotina.app.shared.baseEntity.BaseEntity;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;

import java.util.List;

@Entity
public class Users extends BaseEntity {

    private String name;

    @OneToMany(mappedBy = "users")
    private List<UserRole> userRole;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<UserRole> getUserRole() {
        return userRole;
    }

    public void setUserRole(List<UserRole> userRole) {
        this.userRole = userRole;
    }
}
