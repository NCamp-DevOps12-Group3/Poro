package com.project.service;

import com.project.dao.UserFeedsDao;
import com.project.dto.PortfolioDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserFeedsServiceImpl {

    private UserFeedsDao userFeedsDao;
    @Autowired
    public UserFeedsServiceImpl(UserFeedsDao userFeedsDao) {
        this.userFeedsDao = userFeedsDao;
    }

    public PortfolioDto getUserInfo(int id) {
        return userFeedsDao.getUserInfo(id);
    }

    public List<PortfolioDto> getUserPopularPofol(int id) {
        return userFeedsDao.getUserPopularPofol(id);
    }
}
