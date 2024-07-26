package com.bit.devops12.poro.service;

import com.bit.devops12.poro.dao.UserFeedsDao;
import com.bit.devops12.poro.dto.PortfolioDto;
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
