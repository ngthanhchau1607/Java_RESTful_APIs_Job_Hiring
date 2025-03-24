package com.example.demo.controller;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.example.demo.domain.Skill;
import com.example.demo.service.SkillService;
import com.example.demo.util.annotation.ApiMessage;
import com.example.demo.util.error.IdInvalidException;
import com.turkraft.springfilter.boot.Filter;

import jakarta.validation.Valid;

public class SkillController {
    private final SkillService skillService;

    public SkillController(SkillService skillService) {
        this.skillService = skillService;
    }

    @PostMapping("/skill")
    @ApiMessage("Create a skill")
    public ResponseEntity<Skill> create(@Valid @RequestBody Skill s) throws IdInvalidException {
        if (s.getName() != null && this.skillService.isNameExist(s.getName())) {
            throw new IdInvalidException("skill name" + s.getName() + "đã tồn tại");
        }
        return ResponseEntity.status(HttpStatus.CREATED).body(this.skillService.createSkill(s));
    }

    @PutMapping("/skill")
    @ApiMessage("Update a skill")
    public ResponseEntity<Skill> update(@Valid @RequestBody Skill s) throws IdInvalidException {
        Skill currenSkill = this.skillService.fetchSkillById(s.getId());
        if (currenSkill == null) {
            throw new IdInvalidException("skill id" + s.getId() + "không tồn tại");
        }

        if (s.getName() != null && this.skillService.isNameExist(s.getName())) {
            throw new IdInvalidException("skill name" + s.getName() + "đã tồn tại");
        }
        currenSkill.setName(s.getName());
        return ResponseEntity.ok().body(this.skillService.updateSkill(currenSkill));
    }

    @GetMapping("/skill")
    @ApiMessage("Fetch a skill")
    public ResponseEntity<List<Skill>> getAll(
            @Filter Specification<Skill> spec, Pageable pageable) {

        return ResponseEntity.ok().body(this.skillService.fetchAllSkill(spec, pageable));
    }

    @DeleteMapping("/skill")
    @ApiMessage("Delete a skill")
    public ResponseEntity<Void> deleteSkill(@PathVariable("id") long id) {
        this.skillService.delete(id);
        return ResponseEntity.ok().body(null);
    }
}
