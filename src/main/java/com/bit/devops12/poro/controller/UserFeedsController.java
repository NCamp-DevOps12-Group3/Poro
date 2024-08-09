
package com.bit.devops12.poro.controller;


import com.bit.devops12.poro.dto.*;
import com.bit.devops12.poro.service.UserFeedsServiceImpl;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Controller
@RequestMapping("/userfeeds")
public class UserFeedsController {

    private UserFeedsServiceImpl userFeedsService;
    @Autowired
    public UserFeedsController(UserFeedsServiceImpl userFeedsService){
        this.userFeedsService = userFeedsService;
    }
    //삭제하려는 포폴이 있거나
    @RequestMapping("/feed-form.do")
    public String feedForm(Model model,HttpSession session,@RequestParam(name = "deleteList") String deleteList,@RequestParam(name = "id") int id,
                           @RequestParam(name="pageType",defaultValue = "home",required = false) String pageType) {
        if (!userFeedsService.isLogin(session)){
            return "redirect:/userfeeds/user-feeds.do?id="+id+"&pageType="+pageType;
        }
        UserDto user= (UserDto) session.getAttribute("loginUser");
        boolean isOwner=user.getUser_id()==id;

//        boolean deleteListIsOwner=userFeedsService.deleteListIsOwner(user.getUser_id(),deleteList);

        if (isOwner){
            if (pageType.equals("home")) {
                userFeedsService.deletePortfolio(deleteList);
            }
            else if (pageType.equals("coperation")){
                userFeedsService.deleteCoperationBookmark(deleteList);
            }
            else if (pageType.equals("otherportfolio")){
                System.out.println("otherportfolio");
                userFeedsService.deleteOtherPortfolioBookmark(deleteList);
            }
        }


        return "redirect:/userfeeds/user-feeds.do?id="+id+"&pageType="+pageType;
    }
//    //스크롤이 바닥에 닿았을 때 새로운 포폴 로드에 사용
    @PostMapping("/feed-ajax.do")
    @ResponseBody
    public ModelAndView userFeedsAjax(@RequestParam int id, Criteria criteria,
                                      @RequestParam(name="pageType",defaultValue = "home",required = false) String pageType,
                                      HttpSession session) {
        Map<String,Object> map=new HashMap<>();
        boolean isOwner=false;
        int userid=-1;
        if (userFeedsService.isLogin(session)){
            UserDto user= (UserDto) session.getAttribute("loginUser");
            userid=user.getUser_id();
            isOwner=user.getUser_id()==id;
        }


        if (pageType.equals("home")) {
            List<PortfolioDto> portfolioList=userFeedsService.getUserPortfolio(id,criteria);
            Map<String,Object> bookmark=userFeedsService.getbookmarkInfo(userid,id);
            List<Integer> someList = (List<Integer>) bookmark.get("portfolioBookmark");
            portfolioList.forEach(x->{
                x.setBookmarked(false);
                if (someList != null && someList.contains(x.getPortfolio_id())) {
                    x.setBookmarked(true);
                }
                x.setJsCode(List.of());
                x.setCssCode(List.of());
                x.setHtmlCode(List.of());
            });

            map.put("portfolioList",portfolioList);
            map.put("type","home");
        }
        else if (pageType.equals("coperation")){
            List<RecruitmentDto> recruitmentDtoList=userFeedsService.getUserBookmarkCoperation(id,criteria);
            map.put("recruitmentList",recruitmentDtoList);
            map.put("type","coperation");
        }
        else if (pageType.equals("otherportfolio")){
            List<PortfolioDto> otherPortfolioList=userFeedsService.getUserBookmarkPortfolio(id,criteria);
            map.put("otherPortfolioList",otherPortfolioList);
            map.put("type","otherportfolio");
        }
        map.put("isOwner",isOwner);
        return new ModelAndView("userFeedsDynamic", map);
    }
    //처음 유저페이지 돌입할 때 사용, 클릭한 개체의 유저id에 따라 표출되는 내용이 달라짐, 현재는 로그인 유저 정보 표출
    @GetMapping("/user-feeds.do")
    public String userFeeds(Model model, HttpSession session, @RequestParam(name = "id",required = false) Integer id,
            @RequestParam(name="pageType",defaultValue = "home",required = false) String pageType, Criteria criteria) {
        if(session.getAttribute("loginUser") == null)
            return "redirect:/user/login.do";
        boolean isOwner=false;
        int userid=-1;
        if (userFeedsService.isLogin(session)){
            UserDto user= (UserDto) session.getAttribute("loginUser");
            userid=user.getUser_id();
            if (id==null){
                id=userid;
            }
            isOwner=userid==id;
        }

        model.addAttribute("isOwner",isOwner);
        int total=0;
        ProfileDto profileDto=userFeedsService.getUserInfo(id);

        if (pageType.equals("home")) {
            criteria.setAmount(4);
            total=userFeedsService.getUserPortfolioTotalCnt(id);
            List<PortfolioDto> portfolioList=userFeedsService.getUserPortfolio(id,criteria);
            Map<String,Object> bookmark=userFeedsService.getbookmarkInfo(userid,id);
            List<Integer> someList = (List<Integer>) bookmark.get("portfolioBookmark");

            portfolioList.forEach(x->{
                x.setBookmarked(false);
                if (someList != null && someList.contains(x.getPortfolio_id())) {
                    x.setBookmarked(true);
                }

//                if (isURLAccessible(x.getPORTFOLIO_URL())){
//                    x.setCorrect_PORTFOLIO_URL(true);
//                }
//                else {
                    x.setCorrect_PORTFOLIO_URL(false);
//                }
                x.setJsCode(List.of());
                x.setCssCode(List.of());
                x.setHtmlCode(List.of());
            });
            model.addAttribute("portfolio",portfolioList);
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
        UserFeedsPageDto userFeedsPageDto=new UserFeedsPageDto(criteria,total);
        userFeedsPageDto.setUserid(id);
        userFeedsPageDto.setPageType(pageType);

        model.addAttribute("profile",profileDto);
        model.addAttribute("page",userFeedsPageDto);
        List<PortfolioDto> portfolioList=userFeedsService.getUserPopularPortfolio(id);
        portfolioList.forEach(x->{
//            if (isURLAccessible(x.getPORTFOLIO_URL())){
//                x.setCorrect_PORTFOLIO_URL(false);
//            }
//            else {
                x.setCorrect_PORTFOLIO_URL(true);
//            }
        });
        model.addAttribute("popularPortfolio",portfolioList);


        model.addAttribute("follow",userFeedsService.getFollowInfo(userid,id));

        UserDto loginUser = null;
        if(session != null && session.getAttribute("loginUser") != null){
            loginUser = (UserDto) session.getAttribute("loginUser");
            model.addAttribute("role", loginUser.getRole());
        }
        return "/user/userfeeds";
    }
    public boolean isURLAccessible(String urlString) {
        try {
            // 프로토콜이 누락된 경우 기본 프로토콜 추가
            URL url = new URL(urlString);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setConnectTimeout(5000); // 연결 타임아웃 설정 (밀리초)
            connection.setReadTimeout(5000); // 읽기 타임아웃 설정 (밀리초)
            connection.connect();

            int responseCode = connection.getResponseCode();
            return responseCode == 200; // HTTP OK 응답 코드 확인
        } catch (MalformedURLException e) {
            e.printStackTrace();
            return false; // 잘못된 URL 형식일 경우 false 반환
        } catch (IOException e) {
            e.printStackTrace();
            return false; // 예외 발생 시 false 반환
        }
    }


    @PostMapping("/unfollow.do")
    @ResponseBody
    public Map<String, Object> unfollow(@RequestParam("id") int id, HttpSession session) {
        int userid=-1;
        if (userFeedsService.isLogin(session)){
            UserDto user= (UserDto) session.getAttribute("loginUser");
            userid=user.getUser_id();
        }
        Map<String, Object> response = new HashMap<>();
        if (userid == -1) {
            response.put("success", false);
            response.put("message", "로그인이 필요합니다.");
            return response;
        }

        boolean success = userFeedsService.unfollow(userid, id);
        response.put("success", success);
        return response;
    }
    @PostMapping("/follow.do")
    @ResponseBody
    public Map<String, Object> follow(@RequestParam("id") int id, HttpSession session) {
        int userid=-1;
        if (userFeedsService.isLogin(session)){
            UserDto user= (UserDto) session.getAttribute("loginUser");
            userid=user.getUser_id();
        }
        Map<String, Object> response = new HashMap<>();

        if (userid == -1) {

            response.put("success", false);
            response.put("message", "로그인이 필요합니다.");
            return response;
        }

        boolean success = userFeedsService.follow(userid, id);

        response.put("success", success);
        return response;
    }

    @PostMapping("/bookmark.do")
    @ResponseBody
    public Map<String, Object> portfolioBookmarktoggle(@RequestParam("id") int id, HttpSession session) {
        int userid=-1;
        if (userFeedsService.isLogin(session)){
            UserDto user= (UserDto) session.getAttribute("loginUser");
            userid=user.getUser_id();
        }
        Map<String, Object> response = new HashMap<>();

        if (userid == -1) {

            response.put("success", false);
            response.put("message", "로그인이 필요합니다.");
            return response;
        }

        boolean success = userFeedsService.portfolioBookmarktoggle(userid, id);

        response.put("success", success);
        return response;
    }

    @PostMapping("/sendMessage.do")
    public ResponseEntity<?> sendMessage(@RequestParam Integer recipientId, @RequestParam String messageContent,@RequestParam String title,HttpSession session) {
        // 메시지 전송 로직 구현
        int userid=-1;
        if (userFeedsService.isLogin(session)){
            UserDto user= (UserDto) session.getAttribute("loginUser");
            userid=user.getUser_id();
        }
        boolean isSuccess = userFeedsService.sendMessage(userid,recipientId,messageContent,title);
        if (isSuccess) {
            return ResponseEntity.ok().body(Map.of("success", true));
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("success", false));
        }
    }
    @GetMapping("/getMessages.do")
    public ResponseEntity<?> getMessages(HttpSession session) {
        int userid=-1;
        if (userFeedsService.isLogin(session)){
            UserDto user= (UserDto) session.getAttribute("loginUser");
            userid=user.getUser_id();
        }
        List<UserFeedsMessageDto> userFeedsMessageDtoList= userFeedsService.getMessages(userid);
        if (userFeedsMessageDtoList != null && !userFeedsMessageDtoList.isEmpty()) {
            userFeedsMessageDtoList.forEach(x->{
               x.setSender_name(userFeedsService.getSenderNickname(x.getSender_id()));
            });
            return ResponseEntity.ok().body(Map.of("success", true, "messages", userFeedsMessageDtoList));
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("success", false));
        }
    }
    @PostMapping("/deleteMessage.do")
    public ResponseEntity<?> deleteMessage(HttpSession session, @RequestParam("messageIds") List<Integer> messageIds) {

        boolean isSuccess = userFeedsService.deleteMessages(messageIds);
        if (isSuccess) {
            return ResponseEntity.ok().body(Map.of("success", true));
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("success", false));
        }

    }

}
