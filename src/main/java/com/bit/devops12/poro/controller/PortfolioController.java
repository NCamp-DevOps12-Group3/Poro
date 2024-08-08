package com.bit.devops12.poro.controller;

import com.bit.devops12.poro.common.FileUtils;
import com.bit.devops12.poro.dto.PortfolioDto;
import com.bit.devops12.poro.dto.UserDto;
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

    @PostMapping("/upload.do")
    public String uploadPortfolio(@RequestParam("zipFile") MultipartFile zipFile,
                                  @RequestParam("thumbnailFile") MultipartFile thumbnailFile,
                                  @RequestParam("description") String description,
                                  @RequestParam("tags") String tags,
                                  HttpSession session) throws IOException {
        UserDto user = (UserDto) session.getAttribute("loginUser");
        int userId = user.getUser_id();

        String defaultPath = "C:/devops12/poro";

        // 파일 저장 경로 설정
        String uploadDir = defaultPath + "/upload/"+user.getEmail() + "/portfolio/";

        File directory = new File(uploadDir);

//        // 업로드 폴더가 존재하지 않으면 폴더 생성
        if(!directory.exists()) {
            // 하위폴더도 생성하려면 mkdirs 메소드를 호출한다.
            directory.mkdirs();
        }
        int pos = Objects.requireNonNull(directory.listFiles()).length;
        System.out.println(pos);

        uploadDir += (pos + 1) + "/";
        directory = new File(uploadDir);

        if(!directory.exists()) {
            // 하위폴더도 생성하려면 mkdirs 메소드를 호출한다.
            directory.mkdirs();
        }

        // zip 파일 저장
        System.out.println("before save uploadDir : " + uploadDir);
        File zipDest = new File(uploadDir + zipFile.getOriginalFilename());
        zipFile.transferTo(zipDest);

        // zip 파일 압축 풀기
        List<Path> unzipFilesPath = FileUtils.unzipFile(zipDest.toPath(), Paths.get(uploadDir));

         // 썸네일 파일 저장
        File thumbnailDest = new File(uploadDir + thumbnailFile.getOriginalFilename());
        String thumbnailPath = thumbnailDest.getPath();
        System.out.println("thumbnail Path : " + thumbnailPath);
        System.out.println("upload Path : " + uploadDir);

        if(!thumbnailFile.isEmpty()){
            thumbnailFile.transferTo(thumbnailDest);
            thumbnailPath = (uploadDir+thumbnailFile.getOriginalFilename()).replace(defaultPath, "");
        }else{
            thumbnailPath = "/static/img/default.png";
        }

        // 압축푼 파일 경로
        Map<String, List<String>> unzipFilesMap = new HashMap<>();
        List<String> htmlPathList = new ArrayList<>();
        List<String> cssPathList = new ArrayList<>();
        List<String> jsPathList = new ArrayList<>();

        for(Path path : unzipFilesPath) {
            System.out.println("path : " + path.getFileName());
            if(path.toString().endsWith("html"))
                htmlPathList.add((uploadDir+path.getFileName()).replace(defaultPath, ""));
            else if(path.toString().endsWith("css"))
                cssPathList.add((uploadDir+path.getFileName()).replace(defaultPath, ""));
            else if(path.toString().endsWith("js"))
                jsPathList.add((uploadDir+path.getFileName()).replace(defaultPath, ""));
        }

        unzipFilesMap.put("html", htmlPathList);
        unzipFilesMap.put("css", cssPathList);
        unzipFilesMap.put("js", jsPathList);

        // DB에 저장
        Portfolio portfolio = new Portfolio();
        portfolio.setUserId(userId);
        portfolio.setPortfolioUrl((uploadDir + zipFile.getOriginalFilename()).replace(defaultPath, ""));

        portfolio.setThumbnailUrl(thumbnailPath);
        portfolio.setDescription(description);
        portfolio.setRegdate(LocalDateTime.now());
        portfolio.setModdate(LocalDateTime.now());
        portfolioService.savePortfolio(portfolio);

        PortfolioDto currPortfolio = portfolioService.getCurrentPortfolioByUserId(userId);

        portfolioService.saveHtml(currPortfolio.getPortfolio_id(), htmlPathList);
        portfolioService.saveCss(currPortfolio.getPortfolio_id(), cssPathList);
        portfolioService.saveJs(currPortfolio.getPortfolio_id(), jsPathList);



        // 태그 저장
        List<String> tagList = Arrays.asList(tags.split("\\s+"));
        for (String tag : tagList) {
            SkillTag skillTag = new SkillTag();
            skillTag.setSkillName(tag);
            portfolioService.saveSkillTag(skillTag);
        }

        return "redirect:/main/main.do";
    }


}
