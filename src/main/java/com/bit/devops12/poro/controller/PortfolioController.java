package com.bit.devops12.poro.controller;

import com.bit.devops12.poro.common.FileUtils;
import com.bit.devops12.poro.dto.PortfolioDto;
import com.bit.devops12.poro.model.Portfolio;
import com.bit.devops12.poro.model.SkillTag;
import com.bit.devops12.poro.service.PortfolioService;
import com.bit.devops12.poro.service.impl.PortfolioServiceImpl;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
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
                                  @RequestParam("tags") String tags,
                                  HttpSession session) throws IOException {
        int userId = 7;

        // 파일 저장 경로 설정
        String uploadDir = "C:/tmp/upload/";

        // zip 파일 저장
        File zipDest = new File(uploadDir + zipFile.getOriginalFilename());
        zipFile.transferTo(zipDest);

        // zip 파일 압축 풀기
        List<Path> unzipFilesPath = FileUtils.unzipFile(zipDest.toPath(), Paths.get(uploadDir));

         // 썸네일 파일 저장
        File thumbnailDest = new File(uploadDir + thumbnailFile.getOriginalFilename());
        String thumbnailPath = thumbnailDest.getPath();
        System.out.println("thumbnail Path : " + thumbnailPath);
        System.out.println("upload Path : " + uploadDir);
        if(!thumbnailPath.equals("C:\\tmp\\upload")){
            thumbnailFile.transferTo(thumbnailDest);
        }else{
            thumbnailPath = "/static/img/1.jpg";
        }

        // 압축푼 파일 경로
        Map<String, List<Path>> unzipFilesMap = new HashMap<>();
        List<Path> htmlFileList = new ArrayList<>();
        List<Path> cssFileList = new ArrayList<>();
        List<Path> jsFileList = new ArrayList<>();

        for(Path path : unzipFilesPath) {
            if(path.endsWith(".html")) htmlFileList.add(path);
            else if(path.endsWith(".css")) cssFileList.add(path);
            else if(path.endsWith(".js")) jsFileList.add(path);
        }

        unzipFilesMap.put("html", htmlFileList);
        unzipFilesMap.put("css", cssFileList);
        unzipFilesMap.put("js", jsFileList);

        // DB에 저장
        Portfolio portfolio = new Portfolio();
        portfolio.setUserId(userId);
        portfolio.setPortfolioUrl(zipDest.getAbsolutePath());
        portfolio.setThumbnailUrl(thumbnailPath);
        portfolio.setDescription(description);
        portfolio.setRegdate(LocalDateTime.now());
        portfolio.setModdate(LocalDateTime.now());
        portfolioService.savePortfolio(portfolio);

        PortfolioDto currPortfolio = portfolioService.getCurrentPortfolioByUserId(userId);

        portfolioService.saveHtml(currPortfolio.getPortfolio_id(), htmlFileList);
        portfolioService.saveCss(currPortfolio.getPortfolio_id(), cssFileList);
        portfolioService.saveJs(currPortfolio.getPortfolio_id(), jsFileList);


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
