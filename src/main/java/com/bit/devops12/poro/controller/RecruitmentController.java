package com.bit.devops12.poro.controller;

import com.bit.devops12.poro.dto.UserDto;
import com.bit.devops12.poro.model.Recruitment;
import com.bit.devops12.poro.service.RecruitmentService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Objects;

@Controller
public class RecruitmentController {

    @Autowired
    private RecruitmentService recruitmentService;


    @PostMapping("/cupload.do")
    public String submitRecruitment(HttpSession httpSession,
                                    @RequestParam("title") String title,
                                    @RequestParam("dday") String dday,
                                    @RequestParam("location") String location,
                                    @RequestParam("experience") String experience,
                                    @RequestParam("education") String education,
                                    @RequestParam("imageFile") MultipartFile imageFile) throws IOException {
        UserDto user = (UserDto) httpSession.getAttribute("loginUser");
        int userId = user.getUser_id();

        // String 으로 온 date type localDate 로 변경
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate ddayLocalDate = LocalDate.parse(dday, formatter);

        String defaultPath = "C:/devops12/poro";

        // 파일 저장 경로 설정
        String uploadDir = defaultPath + "/upload/"+user.getEmail() + "/company/";

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

        // 이미지 파일 저장
        File imageDest = new File(uploadDir + imageFile.getOriginalFilename());
        imageFile.transferTo(imageDest);

        // 데이터베이스에 저장할 이미지 파일 URL 생성
        String imageUrl = uploadDir.replace(defaultPath, "") + imageFile.getOriginalFilename();

        // Recruitment 객체 생성 및 데이터베이스에 저장
        Recruitment recruitment = new Recruitment();
        recruitment.setUserId(user.getUser_id());
        recruitment.setCompanyName(user.getNickname());
        recruitment.setCompanyIconUrl("/static/img/default-company.png");
        recruitment.setRecruitmentTitle(title);
        recruitment.setDday(ddayLocalDate);
        recruitment.setLocation(location);
        recruitment.setCareer(experience);
        recruitment.setEducation(education);
        recruitment.setRecruitmentUrl(imageUrl);

        recruitmentService.saveRecruitment(recruitment);

        return "redirect:/main/main.do";
    }
}
