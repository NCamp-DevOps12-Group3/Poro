package com.bit.devops12.poro.controller;

import com.bit.devops12.poro.model.Portfolio;
import com.bit.devops12.poro.model.SkillTag;
import com.bit.devops12.poro.service.PortfolioService;
import com.bit.devops12.poro.service.impl.PortfolioServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

@Controller
public class PortfolioController {

    private PortfolioService portfolioService;

    @Autowired
    public PortfolioController(PortfolioService portfolioService) {
        this.portfolioService = portfolioService;
    }

    @PostMapping("/upload")
    public String uploadPortfolio(@RequestParam("zipFile") MultipartFile zipFile,
                                @RequestParam("thumbnailFile") MultipartFile thumbnailFile,
                                @RequestParam("description") String description,
                                @RequestParam("tags") String tags) throws IOException {
        // 파일 저장 경로 설정
        String uploadDir = "C:/tmp/upload/";

        // zip 파일 저장
        File zipDest = new File(uploadDir + zipFile.getOriginalFilename());
        zipFile.transferTo(zipDest);

        // zip 파일 압축 풀기
        BufferedInputStream in = new BufferedInputStream(zipFile.getInputStream());
        ZipInputStream zipInputStream = new ZipInputStream(in);
        ZipEntry zipEntry = null;

        while((zipEntry = zipInputStream.getNextEntry()) != null){
            int length = 0;
            BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(uploadDir+zipEntry.getName()));
            while((length = zipInputStream.read()) != -1){
                out.write(length);
            }

            zipInputStream.closeEntry();
        }


        // 썸네일 파일 저장
        File thumbnailDest = new File(uploadDir + thumbnailFile.getOriginalFilename());
        thumbnailFile.transferTo(thumbnailDest);

        // DB에 저장
        Portfolio portfolio = new Portfolio();
        portfolio.setUserId(7);
        portfolio.setPortfolioUrl(zipDest.getAbsolutePath());
        portfolio.setThumbnailUrl(thumbnailDest.getAbsolutePath());
        portfolio.setDescription(description);
        portfolio.setRegdate(LocalDateTime.now());
        portfolio.setModdate(LocalDateTime.now());
        portfolioService.savePortfolio(portfolio);

        // 태그 저장
        List<String> tagList = Arrays.asList(tags.split("\\s+"));
        for (String tag : tagList) {
            SkillTag skillTag = new SkillTag();
            skillTag.setSkillName(tag);
            portfolioService.saveSkillTag(skillTag);
        }

        return "/";
    }
}
