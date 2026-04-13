package com.nemchann.userservice.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.OffsetDateTime;
import java.util.UUID;

@Entity
@Table(name = "users")
@Getter
@Setter
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;

    @Column(nullable = false, unique = true)
    private String login;

    @Column(nullable = false)
    private String password;

    @Column(name = "role_id")
    private Integer roleId;

    @Column(name = "created_at")
    private OffsetDateTime createdAt;

    @Column(name = "is_active")
    private boolean isActive;
}
