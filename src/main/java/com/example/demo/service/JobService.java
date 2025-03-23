package com.example.demo.service;

import com.example.demo.domain.Job;
import com.example.demo.repository.JobRepository;

public class JobService {
    private final JobRepository jobRepository;

    public JobService(JobRepository jobRepository) {
        this.jobRepository = jobRepository;
    }

    public Job create(Job j) {
        return this.jobRepository.save(j);
    }
}
