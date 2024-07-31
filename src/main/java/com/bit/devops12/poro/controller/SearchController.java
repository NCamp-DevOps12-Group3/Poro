package com.bit.devops12.poro.controller;

import com.bit.devops12.poro.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("search")
public class SearchController {
    private SearchService searchService;

    @Autowired
    public SearchController(SearchService searchService) {
        this.searchService = searchService;
    }

    @GetMapping("/search.do")
    @ResponseBody
    public Map<String, Object> search(String searchKeyword){
        System.out.println("searchController search 메소드 실행");
        System.out.println("searchKeyword : " + searchKeyword);
        Map<String, Object> searchMap = searchService.searchList(searchKeyword);
        System.out.println("search 결과 : " + searchMap);
        return searchMap;
    }
}
