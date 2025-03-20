package com.example.demo.domain.dto;

import java.time.Instant;

import com.example.demo.domain.Company;
import com.example.demo.util.constant.GenderEnum;

import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RestUser {
    private long id;
    private String name;
    private String email;

    private int age;
    @Enumerated(EnumType.STRING)
    private GenderEnum gender;
    private String address;

    private Instant createAt;
    private Instant updateAt;
    private String createBy;
    private String updateBy;
    private Company company;

}
