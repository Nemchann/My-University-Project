package com.nemchann.userservice.repository;

import com.nemchann.userservice.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface UserRepository extends JpaRepository<User, UUID> {
    // Spring сам напишет SQL запрос: SELECT * FROM users WHERE login = ?
    Optional<User> findByByLogin(String login);

    // Проверка существования пользователя
    boolean existsByLogin(String login);

}
