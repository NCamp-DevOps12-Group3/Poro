package com.bit.devops12.poro.service.impl;

import com.bit.devops12.poro.dao.MemberDao;
import com.bit.devops12.poro.dto.MemberDto;
import com.bit.devops12.poro.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SearchServiceImpl implements SearchService {
    private MemberDao memberDao;

    @Autowired
    public SearchServiceImpl(MemberDao memberDao){
        this.memberDao = memberDao;
    }
    public Map<String, Object> searchList(String searchKeyword){
        System.out.println("SearchServiceImpl::searchList");
        Map<String, Object> searchMap = new HashMap<>();

        List<MemberDto> memberDtos = memberDao.findMembersUsingKeyword(searchKeyword);

        searchMap.put("members", memberDtos);

        System.out.println("MemberDao::findMembersUsingKeyword 종료");
        return searchMap;
    }
}
