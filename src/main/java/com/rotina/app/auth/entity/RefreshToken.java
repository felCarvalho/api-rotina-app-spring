package com.rotina.app.auth.entity;

import jakarta.persistence.Entity;
import com.rotina.app.shared.baseEntity.BaseEntity;

@Entity
public class RefreshToken extends BaseEntity {

    private String refreshToken;

}