package com.example.demo.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.net.URISyntaxException;
import java.time.Instant;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;

import com.example.demo.domain.response.file.ResUploadFileDTO;
import com.example.demo.service.FileService;
import com.example.demo.util.error.StorageException;

@RestController
@RequestMapping("/api/v1")
public class FileController {

    @Value("${hoidanit.upload-file.base-uri}")

    private String baseURI;
    private final FileService fileService;

    public FileController(FileService fileService) {
        this.fileService = fileService;
    }

    @PostMapping("/files")
    public ResponseEntity<ResUploadFileDTO> upload(
            @RequestParam(name = "file", required = false) MultipartFile file,
            @RequestParam("folder") String folder) throws URISyntaxException, IOException, StorageException {
        if (file == null || file.isEmpty()) {
            throw new StorageException("File is empty");
        }
        String fileName = file.getOriginalFilename();
        List<String> allowedExtensions = Arrays.asList("pdf", "jpg", "jpeg", "png", "doc", "docx");
        boolean isValidExtension = allowedExtensions.stream().anyMatch(item -> fileName.toLowerCase().endsWith(item));
        if (!isValidExtension) {
            throw new StorageException("Invalid file extension");
        }

        this.fileService.createDirectory(baseURI + folder);
        String uploadFile = this.fileService.store(file, folder);
        ResUploadFileDTO res = new ResUploadFileDTO(uploadFile, Instant.now());
        return ResponseEntity.ok().body(res);
    }
}
