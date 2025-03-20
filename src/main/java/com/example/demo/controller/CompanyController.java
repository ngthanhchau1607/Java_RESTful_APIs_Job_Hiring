package com.example.demo.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.domain.Company;
import com.example.demo.repository.CompanyRepository;
import com.example.demo.service.CompanyService;
import com.example.demo.util.annotation.ApiMessage;
import com.turkraft.springfilter.boot.Filter;

import jakarta.validation.Valid;

@Controller
public class CompanyController {

    private final CompanyService companyService;

    public CompanyController(CompanyService companyService) {
        this.companyService = companyService;

    }

    // @GetMapping("/company")
    // public ResponseEntity<List<Company>> getCompany(
    // @RequestParam("current") Optional<String> curOptional,
    // @RequestParam("pageSize") Optional<String> pageSizeOptional) {
    // String sCurrent = curOptional.isPresent() ? curOptional.get() : "";
    // String sPageSize = pageSizeOptional.isPresent() ? pageSizeOptional.get() :
    // "";

    // int current = Integer.parseInt(sCurrent);
    // int pageSize = Integer.parseInt(sPageSize);

    // Pageable pageable = PageRequest.of(current - 1, pageSize);
    // List<Company> company = this.companyService.getCompanyPage(pageable);
    // return ResponseEntity.ok().body(company);
    // }

    @ApiMessage("fetch all user")
    @GetMapping("/company")
    public ResponseEntity<List<Company>> getCompany(
            @Filter Specification<Company> spect,
            Pageable pageable) {
        List<Company> company = this.companyService.getCompanySecification(spect, pageable);
        return ResponseEntity.ok().body(company);
    }

    @PostMapping("/company")
    public ResponseEntity<?> postCompany(@Valid @RequestBody Company newCompany) {
        return ResponseEntity.status(HttpStatus.CREATED).body(this.companyService.handleSaveCompany(newCompany));
    }

    @PutMapping("/company")
    public ResponseEntity<Company> putCompany(@Valid @RequestBody Company reqCompany) {
        Company company = this.companyService.putUpdateCompany(reqCompany);
        return ResponseEntity.ok().body(company);
    }

    @DeleteMapping("/company/{id}")
    public ResponseEntity<Void> putCompany(@PathVariable("id") long id) {
        this.companyService.deleteCompany(id);
        return ResponseEntity.ok().body(null);
    }
}
