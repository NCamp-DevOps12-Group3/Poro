package com.bit.devops12.poro.controller;

import com.bit.devops12.poro.dto.*;
import com.bit.devops12.poro.service.CommentService;
import com.bit.devops12.poro.service.PortfolioService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/mini")
public class MiniProjectController {
    private PortfolioService portfolioService;
    private CommentService commentService;

    @Autowired
    public MiniProjectController(PortfolioService portfolioService, CommentService commentService) {
        this.portfolioService = portfolioService;
        this.commentService = commentService;
    }

    @GetMapping("/mini_project.do")
    public String userMain(Model model, MiniProjectCriteria miniProjectCri) {

        miniProjectCri.setAmount(12);

        int total = portfolioService.getPortfolioTotalCnt();

        model.addAttribute("page", new MiniProjectPageDto(miniProjectCri, total));

        return "/portfolio/mini_project";
    }

    @PostMapping("/mini_project-ajax.do")
    @ResponseBody
    public Map<String, Object> miniProjectAjax(MiniProjectCriteria miniProjectCri, HttpSession session) {

        System.out.println(2133);

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");

        List<Map<String, Object>> portfolioList = new ArrayList<>();

        portfolioService.getPortfolioListMini(miniProjectCri, loginUser).forEach(portfolioDto -> {

            Map<String, Object> map = new HashMap<>();
            map.put("portfolioDto", portfolioDto);
            portfolioList.add(map);

        });

        Map<String, Object> returnMap = new HashMap<>();

        returnMap.put("portfolioList", portfolioList);

        return returnMap;
    }

}
