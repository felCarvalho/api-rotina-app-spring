package com.rotina.app.auth.entity;

import com.rotina.app.user.entity.Users;
import jakarta.persistence.*;
import com.rotina.app.shared.Enum.EnumStatus;
import com.rotina.app.shared.baseEntity.BaseEntity;

@Entity
public class RefreshToken extends BaseEntity {

    @Id
    @ManyToOne
    @JoinColumn(name = "user_id")
    private Users users;

    private String refreshHash;

    @Enumerated(EnumType.STRING)
    private EnumStatus status;

    public void setRefreshHash(String refreshHash) {
        this.refreshHash = refreshHash;
    }

    public String getRefreshHash() {
        return refreshHash;
    }

    public EnumStatus getStatus() {
        return status;
    }

    public void setStatus(EnumStatus status) {
        this.status = status;
    }

}