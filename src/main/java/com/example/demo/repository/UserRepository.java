package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.example.demo.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long>, JpaSpecificationExecutor<User> {
    User save(User chau03);

    List<User> findByEmail(String email);

    User findUserByEmail(String email);

    User findUserByName(String name);

    User findById(long id);

    void deleteById(long id);

    boolean existByEmail(String email);

}