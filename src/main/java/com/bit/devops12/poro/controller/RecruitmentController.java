package com.bit.devops12.poro.controller;

import com.bit.devops12.poro.model.Recruitment;
import com.bit.devops12.poro.service.RecruitmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Controller
public class RecruitmentController {

    @Autowired
    private RecruitmentService recruitmentService;


    @PostMapping("/cupload.do")
    public String submitRecruitment(@RequestParam("title") String title,
                                    @RequestParam("dday") String dday,
                                    @RequestParam("location") String location,
                                    @RequestParam("experience") String experience,
                                    @RequestParam("education") String education,
                                    @RequestParam("imageFile") MultipartFile imageFile) throws IOException {

        // String 으로 온 date type localDate 로 변경
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate ddayLocalDate = LocalDate.parse(dday, formatter);

        // 파일 경로 지정
        String UPLOADED_FOLDER = "C:/tmp/cupload/";

        // 이미지 파일 저장
        File imageDest = new File(UPLOADED_FOLDER + imageFile.getOriginalFilename());
        imageFile.transferTo(imageDest);

            // 데이터베이스에 저장할 이미지 파일 URL 생성
            String imageUrl = "/cupload/" + imageFile.getOriginalFilename();

            // Recruitment 객체 생성 및 데이터베이스에 저장
            Recruitment recruitment = new Recruitment();
            recruitment.setUserId(7);
            recruitment.setCompanyName("bit");
            recruitment.setCompanyIconUrl("/images/anime-girl-with-cap-smoking-4k-wallpaper.jpg");
            recruitment.setRecruitmentTitle(title);
            recruitment.setDday(ddayLocalDate);
            recruitment.setLocation(location);
            recruitment.setCareer(experience);
            recruitment.setEducation(education);
            recruitment.setRecruitmentUrl(imageDest.getAbsolutePath());

            recruitmentService.saveRecruitment(recruitment);

        return "/";
    }
}
