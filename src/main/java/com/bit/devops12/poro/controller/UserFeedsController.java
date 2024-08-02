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
<<<<<<< HEAD
    public String feedForm(Model model,HttpSession session,@RequestParam(name = "deleteList") String deleteList,@RequestParam(name = "id") int id,
                           @RequestParam(name="pageType",defaultValue = "home",required = false) String pageType) {
//        UserDto user= (UserDto) session.getAttribute("loginUser");
//        boolean isOwner=user.getId()==id;
        boolean isOwner=true;
//        boolean deleteListIsOwner=userFeedsService.deleteListIsOwner(user.getId(),deleteList);
        boolean deleteListIsOwner=true;
        if (isOwner && deleteListIsOwner){
            if (pageType.equals("home")) {
                userFeedsService.deletePortfolio(deleteList);
            }
            else if (pageType.equals("coperation")){
                userFeedsService.deleteCoperationBookmark(deleteList);
            }
            else if (pageType.equals("otherportfolio")){
                userFeedsService.deleteOtherPortfolioBookmark(deleteList);
            }
        }


        return "redirect:/user-feeds.do?id="+id+"&pageType="+pageType;
=======
    public String feedForm(Model model,@RequestParam(name = "deleteList") String deleteList,@RequestParam(name = "id") int id) {
        System.out.println(deleteList);
        userFeedsService.deletePortfolio(deleteList);
        return "redirect:/user-feeds.do?id="+id;
>>>>>>> e304a2ca27dc06f585b5e38a77df7d643b927e20
    }
//    //스크롤이 바닥에 닿았을 때 새로운 포폴 로드에 사용
    @PostMapping("/feed-ajax.do")
    @ResponseBody
    public Map<String, Object> userFeedsAjax(@RequestParam int id,Criteria criteria) {
        List<PortfolioDto> portfolioList=userFeedsService.getUserPortfolio(id,criteria);
        Map<String,Object> map=new HashMap<>();
<<<<<<< HEAD
        if (pageType.equals("home")) {
            List<PortfolioDto> portfolioList=userFeedsService.getUserPortfolio(id,criteria);
            portfolioList.forEach(x->{
//                x.setMergeCode("");
                x.setJsCode(List.of());
                x.setCssCode(List.of());
                x.setHtmlCode(List.of());
            });
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
=======
        map.put("portfolioList",portfolioList);
>>>>>>> e304a2ca27dc06f585b5e38a77df7d643b927e20
        return map;
    }
    //처음 유저페이지 돌입할 때 사용, 클릭한 개체의 유저id에 따라 표출되는 내용이 달라짐, 현재는 로그인 유저 정보 표출
    @GetMapping("/user-feeds.do")
<<<<<<< HEAD
    public String userFeeds(Model model, HttpSession session, @RequestParam(name = "id") int id,
            @RequestParam(name="pageType",defaultValue = "home",required = false) String pageType, Criteria criteria) {
        int userid=2;
//        UserDto user= (UserDto) session.getAttribute("loginUser");
//        boolean isOwner=user.getId()==id;
        boolean isOwner=userid==id;//테스트 용 추후 삭제 필요
        model.addAttribute("isOwner",isOwner);
        int total=0;
        ProfileDto profileDto=userFeedsService.getUserInfo(id);
        //유저 아이디를 사용하여 포폴 관련테이블에서 테이블 출력에 필요한 정보를 저장
        if (pageType.equals("home")) {
            criteria.setAmount(4);
            total=userFeedsService.getUserPortfolioTotalCnt(id);
            model.addAttribute("portfolio",userFeedsService.getUserPortfolio(id,criteria));
        }
        else if (pageType.equals("coperation")){
            criteria.setAmount(12);
            total=userFeedsService.getUserBookmarkCoperationToltalCnt(id);
            model.addAttribute("coperation",userFeedsService.getUserBookmarkCoperation(id,criteria));
        }
        else if (pageType.equals("otherportfolio")){
            criteria.setAmount(4);
            total=userFeedsService.getUserBookmarkPortfolioCnt(id);
            model.addAttribute("otherportfolio",userFeedsService.getUserBookmarkPortfolio(id,criteria));
        }
        profileDto.setPortfolioCnt(userFeedsService.getUserPortfolioTotalCnt(id));
=======
    public String userFeeds(Model model, HttpSession session/*UserDto userdto */, @RequestParam(name = "id") int id, Criteria criteria) {
        model.addAttribute("profile",userFeedsService.getUserInfo(id));
        //유저 아이디를 사용하여 포폴 관련테이블에서 테이블 출력에 필요한 정보를 저장
        criteria.setAmount(4);

        model.addAttribute("portfolio",userFeedsService.getUserPortfolio(id,criteria));
//        userFeedsService.getUserPortfolio(id,criteria).forEach(x->
//        {
//            System.out.println("x.getUser_id() = " + x.getUser_id());
//            System.out.println("x.getPortfolio_id() = " + x.getPortfolio_id());
//            System.out.println("x.getCssurl() = " + x.getCssurl());
//            System.out.println("x.getHtmlurl() = " + x.getHtmlurl());
//            System.out.println("x.getJsurl() = " + x.getJsurl());
//            System.out.println("x.getMergeCode() = " + x.getMergeCode());
//        });
        int total=userFeedsService.getUserPortfolioTotalCnt(id);
>>>>>>> e304a2ca27dc06f585b5e38a77df7d643b927e20
        UserFeedsPageDto userFeedsPageDto=new UserFeedsPageDto(criteria,total);
        userFeedsPageDto.setUserid(id);
        model.addAttribute("page",userFeedsPageDto);
        model.addAttribute("popularPortfolio",userFeedsService.getUserPopularPortfolio(id));

//        int userid=user.getId();

        model.addAttribute("follow",userFeedsService.getFollowInfo(userid,id));
        model.addAttribute("bookmark",userFeedsService.getbookmarkInfo(userid,id));

        return "/user/userfeeds";
    }
<<<<<<< HEAD



    @PostMapping("/user-feeds/unfollow.do")
    @ResponseBody
    public Map<String, Object> unfollow(@RequestParam("id") int id, HttpSession session) {
//        Integer userId = (Integer) session.getAttribute("userId");
        Integer userId = 2;
        Map<String, Object> response = new HashMap<>();
        if (userId == null) {
            response.put("success", false);
            response.put("message", "로그인이 필요합니다.");
            return response;
        }

        boolean success = userFeedsService.unfollow(userId, id);
        response.put("success", success);
        return response;
    }
    @PostMapping("/user-feeds/follow.do")
    @ResponseBody
    public Map<String, Object> follow(@RequestParam("id") int id, HttpSession session) {
//        Integer userId = (Integer) session.getAttribute("userId");
        Integer userId = 2;
        Map<String, Object> response = new HashMap<>();

        if (userId == null) {

            response.put("success", false);
            response.put("message", "로그인이 필요합니다.");
            return response;
        }

        boolean success = userFeedsService.follow(userId, id);

        response.put("success", success);
        return response;
=======
    @GetMapping("/user-bookmark-feeds.do")
    public String userCollectionFeeds(Model model, @RequestParam(name = "id") int id, Criteria criteria) {
        return "/user/userfeeds";
>>>>>>> e304a2ca27dc06f585b5e38a77df7d643b927e20
    }
}
