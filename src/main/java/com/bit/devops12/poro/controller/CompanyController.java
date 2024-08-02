package com.bit.devops12.poro.controller;

import com.bit.devops12.poro.dto.CompanyPageDto;
import com.bit.devops12.poro.dto.Criteria;
import com.bit.devops12.poro.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/company")
public class CompanyController {
    private CompanyService companyService;
    private ApplicationContext applicationContext;

    @Autowired
    public CompanyController(ApplicationContext applicationContext) {
        this.applicationContext = applicationContext;
    }

    @GetMapping("/test.do")
    public String companyListView(Model model, Criteria cri){

        companyService = applicationContext.getBean("companyServiceImpl", CompanyService.class);

        cri.setAmount(9);

        model.addAttribute("companyList", companyService.getCompanyList(cri));

        int total = companyService.getCompanyTotalCnt();

        CompanyPageDto companyPageDto = new CompanyPageDto(cri, total);

        model.addAttribute("page", new CompanyPageDto(cri, total));

        System.out.println(companyPageDto.toString());

        return "company/mini_project(company)";
    }

}
