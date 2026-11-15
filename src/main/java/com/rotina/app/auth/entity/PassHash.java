package com.rotina.app.auth.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.JoinColumn;
import com.rotina.app.user.entity.User;
import com.rotina.app.shared.baseEntity.BaseEntity;

@Entity
public class PassHash extends BaseEntity  {

    @Id
    @ManyToOne()
    @JoinColumn(name = "user_id")
    private User user;

    private String hash;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getHash() {
        return hash;
    }

    public void setHash(String hash) {
        this.hash = hash;
    }
}
