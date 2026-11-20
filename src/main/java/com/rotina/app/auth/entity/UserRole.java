package com.rotina.app.auth.entity;

import com.rotina.app.shared.baseEntity.BaseEntity;
import com.rotina.app.user.entity.Users;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class UserRole extends BaseEntity {

    @Id
    @ManyToOne
    @JoinColumn(name = "user_id")
    private Users users;

    @Id
    @ManyToOne
    private Role role;

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

}
