package com.example.demo.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.example.demo.domain.Job;
import com.example.demo.domain.Skill;
import com.example.demo.service.JobService;
import com.example.demo.util.annotation.ApiMessage;
import com.example.demo.util.error.IdInvalidException;

import jakarta.validation.Valid;

public class JobController {
    private final JobService jobService;

    public JobController(JobService jobService) {
        this.jobService = jobService;
    }

    @PostMapping("/job")
    @ApiMessage("Create a job")
    public ResponseEntity<Job> create(@Valid @RequestBody Job j) {
        return ResponseEntity.status(HttpStatus.CREATED).body(this.jobService.create(j));
    }
}
