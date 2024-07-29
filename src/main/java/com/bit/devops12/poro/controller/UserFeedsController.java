package com.bit.devops12.poro.controller;


import com.bit.devops12.poro.dto.Criteria;
import com.bit.devops12.poro.dto.PortfolioDto;
import com.bit.devops12.poro.dto.UserFeedsPageDto;
import com.bit.devops12.poro.service.UserFeedsServiceImpl;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
//@RequestMapping("/springboard")
public class UserFeedsController {
    private UserFeedsServiceImpl userFeedsService;
    @Autowired
    public UserFeedsController(UserFeedsServiceImpl userFeedsService){
        this.userFeedsService = userFeedsService;
    }
    //삭제하려는 포폴이 있을 때 사용
    @RequestMapping("/feed-form.do")
    public String feedForm(Model model,@RequestParam(name = "deleteList") List<String> deleteList) {
        userFeedsService.deletePortfolio(deleteList);
        return "redirect:/user-feeds.do";
    }
//    //스크롤이 바닥에 닿았을 때 새로운 포폴 로드에 사용
    @PostMapping("/feed-ajax.do")
    @ResponseBody
    public Map<String, Object> userFeedsAjax(@RequestParam int id,Criteria criteria) {
        List<PortfolioDto> portfolioList=userFeedsService.getUserPortfolio(id,criteria);
        Map<String,Object> map=new HashMap<>();
        map.put("portfolioList",portfolioList);
        return map;
    }
    //처음 유저페이지 돌입할 때 사용, 클릭한 개체의 유저id에 따라 표출되는 내용이 달라짐, 현재는 로그인 유저 정보 표출
    @GetMapping("/user-feeds.do")
    public String userFeeds(Model model, HttpSession session/*UserDto userdto */, @RequestParam(name = "id") int id, Criteria criteria) {
//        model.addAttribute("user",)
        //유저 아이디를 사용하여 유저 테이블에서 프로파일 출력에 필요한 정보를 저장

        model.addAttribute("profile",userFeedsService.getUserInfo(id));
        //유저 아이디를 사용하여 포폴 관련테이블에서 테이블 출력에 필요한 정보를 저장
        criteria.setAmount(9);

        model.addAttribute("portfolio",userFeedsService.getUserPortfolio(id,criteria));
        int total=userFeedsService.getUserPortfolioTotalCnt(id);
        model.addAttribute("page",new UserFeedsPageDto(criteria,total));
        userFeedsService.getUserPortfolio(id,criteria).forEach(x->{
            System.out.println("x.getHtmlurl() = " + x.getHtmlurl());
            System.out.println("x.getCssurl() = " + x.getCssurl());
            System.out.println("x.getJsurl() = " + x.getJsurl());
            System.out.println("x.getPortfolioid() = " + x.getPortfolioid());
            System.out.println("x.getContent() = " + x.getContent());
            System.out.println("x.getRegdate() = " + x.getRegdate());
            System.out.println("x.getSkillname() = " + x.getSkillname());
            System.out.println("x.getThumbnailurl() = " + x.getThumbnailurl());
            System.out.println("x.getUserid() = " + x.getUserid());
        });
        return "/user/userfeeds";
    }
}
