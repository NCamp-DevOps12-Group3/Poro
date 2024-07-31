package com.bit.devops12.poro.service.impl;

import com.bit.devops12.poro.dao.MemberDao;
import com.bit.devops12.poro.dto.UserDto;
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
        Map<String, Object> searchMap = new HashMap<>();

        List<UserDto> memberDtos = memberDao.findMembersUsingKeyword(searchKeyword);

        searchMap.put("Members", memberDtos);

        return searchMap;
    }
}
