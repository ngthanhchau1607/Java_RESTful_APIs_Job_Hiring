package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import com.example.demo.controller.AuthController;
import com.example.demo.domain.Company;
import com.example.demo.repository.CompanyRepository;

@Service
public class CompanyService {

    private final CompanyRepository companyRepository;

    public CompanyService(CompanyRepository companyRepository) {
        this.companyRepository = companyRepository;

    }

    public Company handleSaveCompany(Company company) {
        return this.companyRepository.save(company);
    }

    public List<Company> getAllCompany() {
        return this.companyRepository.findAll();
    }

    public List<Company> getCompanyPage(Pageable pageable) {
        Page<Company> pageCompany = this.companyRepository.findAll(pageable);
        return pageCompany.getContent();
    }

    public List<Company> getCompanySecification(Specification<Company> specification, Pageable pageable) {
        Page<Company> companies = this.companyRepository.findAll(specification, pageable);
        return companies.getContent();
    }

    public Company putUpdateCompany(Company c) {
        Optional<Company> companyOptional = this.companyRepository.findById(c.getId());
        if (companyOptional.isPresent()) {
            Company companyCurrent = companyOptional.get();
            companyCurrent.setLogo(c.getLogo());
            companyCurrent.setName(c.getName());
            companyCurrent.setDescription(c.getDescription());
            companyCurrent.setAddress(c.getAddress());
            return this.companyRepository.save(companyCurrent);
        }
        return null;
    }

    public void deleteCompany(long id) {
        this.companyRepository.deleteById(id);
    }

    public Optional<Company> findCompanyById(long id) {
        return this.companyRepository.findById(id);
    }
}
