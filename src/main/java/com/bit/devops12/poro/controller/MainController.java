package com.bit.devops12.poro.controller;

import com.bit.devops12.poro.dto.*;
import com.bit.devops12.poro.service.CommentService;
import com.bit.devops12.poro.service.PortfolioService;
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

    @Autowired
    public MainController(PortfolioService portfolioService, CommentService commentService) {
        this.portfolioService = portfolioService;
        this.commentService = commentService;
    }

    @GetMapping("/main.do")
    public String userMain(Model model, MainCriteria mainCri) {

        mainCri.setAmount(2);

        int total = portfolioService.getPortfolioTotalCnt();

        model.addAttribute("page", new MainPageDto(mainCri, total));

        return "main";
    }

    @PostMapping("/main-ajax.do")
    @ResponseBody
    public Map<String, Object> userMainAjax(MainCriteria mainCri) {

        List<Map<String, Object>> portfolioList = new ArrayList<>();

        portfolioService.getPortfolioList(mainCri).forEach(portfolioDto -> {

            Map<String, Object> map = new HashMap<>();
            map.put("portfolioDto", portfolioDto);
            map.put("commentDtoList", buildCommentTree(commentService.getCommentList(portfolioDto)));
            System.out.println(portfolioDto.getCssurl());
            System.out.println(portfolioDto.getHtmlurl());
            System.out.println(portfolioDto.getJsurl());
            System.out.println(portfolioDto.getThumbnail_url());

            portfolioList.add(map);

        });

        Map<String, Object> returnMap = new HashMap<>();

        returnMap.put("portfolioList", portfolioList);

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
//    @CrossOrigin(origins = "http://localhost:8090")  // CORS 설정 예시
    public ResponseEntity<Map<String, Object>> userCommentAjax(@RequestBody CommentDto commentDto) {
        commentService.postComment(commentDto);
        // JSON 응답을 반환
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("comment", commentDto);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/modal-ajax.do")
    @ResponseBody
    public Map<String, Object> userModalAjax(@RequestParam("portfolio_id") int portfolio_id) {

        PortfolioDto portfolioDto = portfolioService.getPortfolioById(portfolio_id);

        List<CommentDto> commentDtoList = commentService.getCommentList(portfolioDto);

        Map<String, Object> response = new HashMap<>();

        response.put("commentList", buildCommentTree(commentService.getCommentList(portfolioDto)));
        response.put("portfolio", portfolioDto);

        return response;
    }
}
