package com.bit.devops12.poro.controller;


import com.bit.devops12.poro.dto.*;
import com.bit.devops12.poro.service.UserFeedsServiceImpl;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
public class UserFeedsController {
    private UserFeedsServiceImpl userFeedsService;
    @Autowired
    public UserFeedsController(UserFeedsServiceImpl userFeedsService){
        this.userFeedsService = userFeedsService;
    }
    //삭제하려는 포폴이 있거나
    @RequestMapping("/feed-form.do")
    public String feedForm(Model model,@RequestParam(name = "deleteList") String deleteList,@RequestParam(name = "id") int id,
                           @RequestParam(name="pageType",defaultValue = "home",required = false) String pageType) {
        if (pageType.equals("home")) {
            userFeedsService.deletePortfolio(deleteList);
        }
        else if (pageType.equals("coperation")){
            userFeedsService.deleteCoperationBookmark(deleteList);
        }
        else if (pageType.equals("otherportfolio")){
            userFeedsService.deleteOtherPortfolioBookmark(deleteList);
        }

        return "redirect:/user-feeds.do?id="+id+"&pageType="+pageType;
    }
//    //스크롤이 바닥에 닿았을 때 새로운 포폴 로드에 사용
    @PostMapping("/feed-ajax.do")
    @ResponseBody
    public Map<String, Object> userFeedsAjax(@RequestParam int id,Criteria criteria,
                                             @RequestParam(name="pageType",defaultValue = "home",required = false) String pageType) {
        Map<String,Object> map=new HashMap<>();
        if (pageType.equals("home")) {
            List<PortfolioDto> portfolioList=userFeedsService.getUserPortfolio(id,criteria);
            map.put("portfolioList",portfolioList);
        }
        else if (pageType.equals("coperation")){
            List<RecruitmentDto> recruitmentDtoList=userFeedsService.getUserBookmarkCoperation(id,criteria);
            map.put("recruitmentList",recruitmentDtoList);
        }
        else if (pageType.equals("otherportfolio")){
            List<PortfolioDto> otherPortfolioList=userFeedsService.getUserBookmarkPortfolio(id,criteria);
            map.put("otherPortfolioList",otherPortfolioList);
        }
        return map;
    }
    //처음 유저페이지 돌입할 때 사용, 클릭한 개체의 유저id에 따라 표출되는 내용이 달라짐, 현재는 로그인 유저 정보 표출
    @GetMapping("/user-feeds.do")
    public String userFeeds(Model model, HttpSession session, @RequestParam(name = "id") int id,
            @RequestParam(name="pageType",defaultValue = "home",required = false) String pageType, Criteria criteria) {
        int total=0;
        ProfileDto profileDto=userFeedsService.getUserInfo(id);
        //유저 아이디를 사용하여 포폴 관련테이블에서 테이블 출력에 필요한 정보를 저장
        if (pageType.equals("home")) {
            criteria.setAmount(4);

            model.addAttribute("portfolio",userFeedsService.getUserPortfolio(id,criteria));
        }
        else if (pageType.equals("coperation")){
            criteria.setAmount(12);
            total=userFeedsService.getUserBookmarkCoperationToltalCnt(id);
            System.out.println(userFeedsService.getUserBookmarkCoperation(id,criteria));
            model.addAttribute("coperation",userFeedsService.getUserBookmarkCoperation(id,criteria));
        }
        else if (pageType.equals("otherportfolio")){
            criteria.setAmount(4);
            total=userFeedsService.getUserBookmarkPortfolioCnt(id);
            model.addAttribute("otherportfolio",userFeedsService.getUserBookmarkPortfolio(id,criteria));
        }
//        userFeedsService.getUserPortfolio(id,criteria).forEach(x->
//        {
//            System.out.println("x.getUser_id() = " + x.getUser_id());
//            System.out.println("x.getPortfolio_id() = " + x.getPortfolio_id());
//            System.out.println("x.getCssurl() = " + x.getCssurl());
//            System.out.println("x.getHtmlurl() = " + x.getHtmlurl());
//            System.out.println("x.getJsurl() = " + x.getJsurl());
//            System.out.println("x.getMergeCode() = " + x.getMergeCode());
//        });
        profileDto.setPortfolioCnt(userFeedsService.getUserPortfolioTotalCnt(id));
        UserFeedsPageDto userFeedsPageDto=new UserFeedsPageDto(criteria,total);
        userFeedsPageDto.setUserid(id);
        userFeedsPageDto.setPageType(pageType);

        model.addAttribute("profile",profileDto);
        model.addAttribute("page",userFeedsPageDto);

        model.addAttribute("popularPortfolio",userFeedsService.getUserPopularPortfolio(id));
        return "/user/userfeeds";
    }
}
