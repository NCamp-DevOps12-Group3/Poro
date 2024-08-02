package com.bit.devops12.poro.service.impl;

import com.bit.devops12.poro.dao.UserDao;
import com.bit.devops12.poro.dto.UserDto;
import com.bit.devops12.poro.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SearchServiceImpl implements SearchService {
    private UserDao userDao;

    @Autowired
    public SearchServiceImpl(UserDao userDao){
        this.userDao = userDao;
    }
    public List<UserDto> searchMemberList(String searchKeyword){
        return userDao.findMembersUsingKeyword(searchKeyword);
    }
    public List<PortfolioDto> searchPortfolioList(String searchKeyword){
        return portfolioDao.findPortfolioByKeyword(searchKeyword);
    }
}
