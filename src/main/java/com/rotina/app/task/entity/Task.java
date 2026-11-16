package com.rotina.app.task.entity;

import com.rotina.app.category.entity.Category;
import com.rotina.app.shared.Enum.EnumStatusTask;
import com.rotina.app.shared.baseEntity.BaseEntity;
import com.rotina.app.user.entity.Users;
import jakarta.persistence.*;

@Entity
public class Task extends BaseEntity {

    private String title;
    private String description;

    @Enumerated(EnumType.STRING)
    private EnumStatusTask status;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private Users users;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public EnumStatusTask getStatus() {
        return status;
    }

    public void setStatus(EnumStatusTask status) {
        this.status = status;
    }

    public Users getUser() {
        return users;
    }

    public void setUser(Users users) {
        this.users = users;
    }

    public Category getCategory() {
        return category;

    }

    public void setCategory(Category category) {
        this.category = category;
    }
}

