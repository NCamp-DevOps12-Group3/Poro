package com.bit.devops12.poro.controller;

import com.bit.devops12.poro.dao.CommentDao;
import com.bit.devops12.poro.dto.*;
import com.bit.devops12.poro.service.CommentService;
import com.bit.devops12.poro.service.CompanyService;
import com.bit.devops12.poro.service.PortfolioService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.CachedIntrospectionResults;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/main")
public class MainController {
    private PortfolioService portfolioService;
    private CommentService commentService;
    private CompanyService companyService;

    @Autowired
    public MainController(PortfolioService portfolioService, CommentService commentService, CompanyService companyService) {
        this.portfolioService = portfolioService;
        this.commentService = commentService;
        this.companyService = companyService;
    }



    @GetMapping("/main.do")
    public String userMain(Model model, MainCriteria mainCri, HttpSession httpSession) {
        if(httpSession.getAttribute("loginUser") == null)
            return "redirect:/user/login.do";

        mainCri.setAmount(2);

        int total = portfolioService.getPortfolioTotalCnt();

        model.addAttribute("page", new MainPageDto(mainCri, total));

        UserDto loginUser = null;
        if(httpSession != null && httpSession.getAttribute("loginUser") != null){
            loginUser = (UserDto) httpSession.getAttribute("loginUser");
            model.addAttribute("role", loginUser.getRole());
        }

        return "main-tmp";
    }

    @PostMapping("/main-ajax.do")
    @ResponseBody
    public Map<String, Object> userMainAjax(MainCriteria mainCri, HttpSession session, Criteria cri) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");

        List<Map<String, Object>> portfolioList = new ArrayList<>();

        portfolioService.getPortfolioList(mainCri, loginUser).forEach(portfolioDto -> {

            Map<String, Object> map = new HashMap<>();
            map.put("portfolioDto", portfolioDto);
            portfolioList.add(map);

        });



        Map<String, Object> returnMap = new HashMap<>();

        returnMap.put("portfolioList", portfolioList);

        cri.setAmount(5);

        List<CompanyDto> companyDtoList = companyService.getCompanyListMain(cri, loginUser);

        System.out.println(companyDtoList);


        returnMap.put("companyList", companyDtoList);

        return returnMap;
    }

    private List<CommentDto> buildCommentTree(List<CommentDto> commentDtoList) {

        // ID를 키로 하고 CommentDto를 값으로 가지는 맵 생성
        Map<Integer, CommentDto> commentMap = commentDtoList.stream()
                .collect(Collectors.toMap(CommentDto::getComment_id, comment -> comment));

        // 루트 코멘트들을 저장할 리스트 생성
        List<CommentDto> rootComments = new ArrayList<>();

        // 모든 코멘트를 순회하면서 트리를 구성
        for (CommentDto commentDto : commentDtoList) {
            // 현재 코멘트의 조상들을 찾기 위한 임시 변수
            CommentDto current = commentDto;
            CommentDto parentComment = null;

            // 부모가 존재할 경우 최상위 부모(조상)를 찾음
            while (current.getComment_parent_id() != 0) {
                parentComment = commentMap.get(current.getComment_parent_id());
                if (parentComment == null) {
                    break;
                }
                current = parentComment;
            }

            // 최상위 부모가 없을 경우 루트 코멘트로 간주하여 리스트에 추가
            if (parentComment == null) {
                rootComments.add(commentDto);
            } else {
                // 최상위 부모의 자식 리스트에 현재 코멘트 추가
                parentComment.getReplies().add(commentDto);
            }
        }
        return rootComments;
    }

    @PostMapping("/comment-ajax.do")
    @ResponseBody
    public Map<String, Object> userCommentAjax(@RequestBody CommentDto commentDto, HttpSession session) {


        UserDto loginUser = (UserDto) session.getAttribute("loginUser");

        commentService.postComment(commentDto);

        PortfolioDto portfolioDto = portfolioService.getPortfolioById(commentDto.getPortfolio_id(), loginUser);

        List<CommentDto> commentDtoList = commentService.getCommentList(portfolioDto, loginUser);

        Map<String, Object> response = new HashMap<>();

        response.put("commentList", buildCommentTree(commentDtoList));
        response.put("portfolio", portfolioDto);

        return response;
    }

    @PostMapping("/modal-ajax.do")
    @ResponseBody
    public Map<String, Object> userModalAjax(@RequestParam("portfolio_id") int portfolio_id, HttpSession session) {


        UserDto loginUser = (UserDto) session.getAttribute("loginUser");

        PortfolioDto portfolioDto = portfolioService.getPortfolioById(portfolio_id, loginUser);

        List<CommentDto> commentDtoList = commentService.getCommentList(portfolioDto, loginUser);

        Map<String, Object> response = new HashMap<>();

        response.put("commentList", buildCommentTree(commentDtoList));


        response.put("portfolio", portfolioDto);

        return response;
    }

    @PostMapping("/comment-like-ajax.do")
    @ResponseBody
    public Map<String, Object> userCommentLikeAjax(@RequestParam ("comment_id") int comment_id, @RequestParam ("isLiked") boolean isLiked, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");

        if(!isLiked) {
            commentService.likeComment(comment_id, loginUser);
        }else{
            commentService.unLikeComment(comment_id, loginUser);
        }

        CommentDto commentDto = commentService.getCommentById(comment_id);

        Map<String, Object> response = new HashMap<>();

        response.put("comment", commentDto);

        return response;
    }

    @PostMapping("/portfolio-like-ajax.do")
    @ResponseBody
    public Map<String, Object> userPortfolioLikeAjax(@RequestParam ("portfolio_id") int portfolio_id, @RequestParam ("isLiked") boolean isLiked, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");

        if(!isLiked) {
            portfolioService.likePortfolio(portfolio_id, loginUser);
        }else{
            portfolioService.unLikePortfolio(portfolio_id, loginUser);
        }

        PortfolioDto portfolioDto = portfolioService.getPortfolioById(portfolio_id, loginUser);

        Map<String, Object> response = new HashMap<>();

        response.put("portfolio", portfolioDto);

        return response;
    }

    @PostMapping("/delete-comment-ajax.do")
    @ResponseBody
    public Map<String, Object> userDeleteCommentAjax(@RequestParam ("comment_id") int comment_id, HttpSession session) {
        UserDto loginUser = (UserDto) session.getAttribute("loginUser");

        CommentDto commentDto = commentService.getCommentById(comment_id);

        PortfolioDto portfolioDto = portfolioService.getPortfolioById(commentDto.getPortfolio_id(), loginUser);

        if(commentDto.getUser_id() == loginUser.getUser_id()){
            commentService.deleteComment(comment_id);
        }

        List<CommentDto> commentDtoList = commentService.getCommentList(portfolioDto, loginUser);

        Map<String, Object> response = new HashMap<>();

        response.put("commentList", buildCommentTree(commentDtoList));
        response.put("portfolio", portfolioDto);

        return response;
    }

    @PostMapping("/delete-portfolio.do")
    public String userDeletePortfolio(@RequestParam ("portfolio_id") int portfolio_id, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");

        PortfolioDto portfolioDto = portfolioService.getPortfolioById(portfolio_id, loginUser);

        if(portfolioDto.getUser_id() == loginUser.getUser_id()){
            portfolioService.deletePortfolio(portfolio_id);
        }

        return "redirect:/main/main.do";
    }

    @GetMapping("/user-portfolio.do")
    public String userPortfolio(HttpSession session){
        return "redirect:/mini/mini_project.do";
    }

    @PostMapping("/portfolio-bookmark-ajax.do")
    @ResponseBody
    public Map<String, Object> userPortfolioBookmarkAjax(@RequestParam ("portfolio_id") int portfolio_id, @RequestParam ("bookmarked") boolean bookmarked, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");

        if(!bookmarked) {
            portfolioService.bookmarkPortfolio(portfolio_id, loginUser);
        }else{
            portfolioService.unBookmarkPortfolio(portfolio_id, loginUser);
        }

        PortfolioDto portfolioDto = portfolioService.getPortfolioById(portfolio_id, loginUser);

        Map<String, Object> response = new HashMap<>();

        response.put("portfolio", portfolioDto);

        return response;
    }

    @PostMapping("/company-bookmark-ajax.do")
    @ResponseBody
    public Map<String, Object> userCompanyBookmarkAjax(@RequestParam ("recruitment_id") int recruitment_id, @RequestParam ("bookmarked") boolean bookmarked, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");

        if(!bookmarked) {
            companyService.bookmarkCompany(recruitment_id, loginUser);
        }else{
            companyService.unBookmarkCompany(recruitment_id, loginUser);
        }

        Map<String, Object> response = new HashMap<>();

        return response;
    }



}


