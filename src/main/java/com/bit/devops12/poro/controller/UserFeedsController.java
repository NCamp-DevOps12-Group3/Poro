package com.project.controller;


import com.project.dto.PortfolioDto;
import com.project.service.UserFeedsServiceImpl;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller
@RequestMapping("/userfeeds")
public class UserFeedsController {
    private UserFeedsServiceImpl userFeedsService;
    @Autowired
    public UserFeedsController(UserFeedsServiceImpl userFeedsService){
        this.userFeedsService = userFeedsService;
    }
    //삭제하려는 포폴이 있을 때 사용
    @RequestMapping("/feed-form.do")
    public String feedForm(Model model) {
        return "userfeeds";
    }
    //스크롤이 바닥에 닿았을 때 새로운 포폴 로드에 사용
    @PostMapping("/feed-ajax.do")
    @ResponseBody
    public Map<String, Object> userFeedsAjax(Model model) {
        Map<String, Object> result = new HashMap<>();
        result.put("portfolioList",List.of());
        return result;
    }
    //처음 유저페이지 돌입할 때 사용, 클릭한 개체의 유저id에 따라 표출되는 내용이 달라짐, 현재는 로그인 유저 정보 표출
    @GetMapping("/user-feeds.do")
    public String userFeeds(Model model, HttpSession session/*UserDto userdto */) {
//        model.addAttribute("user",)
        //유저 아이디를 사용하여 유저 테이블에서 프로파일 출력에 필요한 정보를 저장
        model.addAttribute("profile",userFeedsService.getUserInfo((int)session.getAttribute("loginMember")));
        //유저 아이디를 사용하여 포폴 관련테이블에서 테이블 출력에 필요한 정보를 저장
        model.addAttribute("userpopularpofol",userFeedsService.getUserPopularPofol((int) session.getAttribute("loginMember")));
        return "userfeeds";
    }
}
