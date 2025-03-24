package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import com.example.demo.domain.Skill;
import com.example.demo.repository.SkillRepository;

public class SkillService {
    private final SkillRepository skillRepository;

    public SkillService(SkillRepository skillRepository) {
        this.skillRepository = skillRepository;
    }

    public boolean isNameExist(String name) {
        return this.skillRepository.existsByName(name);
    }

    public Skill createSkill(Skill s) {
        return this.skillRepository.save(s);
    }

    public Skill fetchSkillById(long id) {
        Optional<Skill> sOptional = this.skillRepository.findById(id);
        if (sOptional.isPresent()) {
            return sOptional.get();
        }
        return null;
    }

    public Skill updateSkill(Skill s) {
        return this.skillRepository.save(s);
    }

    public List<Skill> fetchAllSkill(Specification<Skill> spec, Pageable pageable) {
        Page<Skill> pageSkill = this.skillRepository.findAll(spec, pageable);
        return pageSkill.getContent();

    }

    public void delete(long id) {
        Optional<Skill> sOptional = this.skillRepository.findById(id);
        Skill currentSkill = sOptional.get();
        currentSkill.getJobs().forEach(job -> job.getSkills().remove(currentSkill));

        this.skillRepository.delete(currentSkill);
    }
}
