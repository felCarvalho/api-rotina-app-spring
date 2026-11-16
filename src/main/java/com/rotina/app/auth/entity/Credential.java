package com.rotina.app.auth.entity;

import com.rotina.app.user.entity.Users;
import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.JoinColumn;
import com.rotina.app.shared.baseEntity.BaseEntity;

@Entity
public class Credential extends BaseEntity {

    @ManyToOne
    @JoinColumn(name = "user_id")
    private Users users;

    private String identifier;

    private String provider;

    public void setIdentifier(String identifier) {
        this.identifier = identifier;
    }

    public String getIdentifier() {
        return identifier;
    }

    public void setProvider(String provider) {
        this.provider = provider;
    }

    public String getProvider() {
        return provider;
    }

    public void setUser(Users users) {
        this.users = users;
    }

    public Users getUser() {
        return users;
    }

}
