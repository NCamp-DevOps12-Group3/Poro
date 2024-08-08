
package com.bit.devops12.poro.controller;

import com.bit.devops12.poro.common.DdayCalculator;
import com.bit.devops12.poro.dto.*;
import com.bit.devops12.poro.service.CompanyService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
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
@RequestMapping("/company")
public class CompanyController {
    private CompanyService companyService;

    @Autowired
    public CompanyController(CompanyService companyService) {
        this.companyService = companyService;
    }

    @GetMapping("/test.do")
    public String companyListView(Model model, Criteria cri, HttpSession session){

        cri.setAmount(12);

        List<CompanyDto> infiniteScrollList = companyService.getCompanyList(cri);

        model.addAttribute("companyList", infiniteScrollList);

//        for(CompanyDto companyDto : infiniteScrollList){
//            System.out.println("companyDto 값:" + companyDto);
//        }

        int total = companyService.getCompanyTotalCnt();

        CompanyPageDto companyPageDto = new CompanyPageDto(cri, total);

        model.addAttribute("page", new CompanyPageDto(cri, total));
        UserDto loginUser = null;
        if(session != null && session.getAttribute("loginUser") != null){
            loginUser = (UserDto) session.getAttribute("loginUser");
            model.addAttribute("role", loginUser.getRole());
        }

        return "company/mini_project(company)";
    }

    @PostMapping("/company-list-ajax.do")
    @ResponseBody
    public Map<String, Object> companyListAjax (Criteria cri){

        List<Map<String, Object>> companyList = new ArrayList<>();

        companyService.getCompanyList(cri).forEach(companyDto -> {
            Map<String, Object> map = new HashMap<>();

            map.put("companyDto", companyDto);

            companyList.add(map);
        });

        Map<String, Object> returnMap = new HashMap<>();

        returnMap.put("companyList", companyList);

        return returnMap;
    }


}
