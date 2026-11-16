package com.rotina.app.auth.entity;

import com.rotina.app.user.entity.Users;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.JoinColumn;
import com.rotina.app.shared.baseEntity.BaseEntity;

@Entity
public class PassHash extends BaseEntity  {

    @Id
    @ManyToOne
    @JoinColumn(name = "user_id")
    private Users users;

    private String hash;

    public Users getUser() {
        return users;
    }

    public void setUser(Users users) {
        this.users = users;
    }

    public String getHash() {
        return hash;
    }

    public void setHash(String hash) {
        this.hash = hash;
    }
}
