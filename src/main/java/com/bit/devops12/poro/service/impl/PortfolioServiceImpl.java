package com.bit.devops12.poro.service.impl;

import com.bit.devops12.poro.dao.PortfolioDao;
import com.bit.devops12.poro.dto.Criteria;
import com.bit.devops12.poro.dto.MainCriteria;
import com.bit.devops12.poro.dto.PortfolioDto;
import com.bit.devops12.poro.service.PortfolioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PortfolioServiceImpl implements PortfolioService {

    private PortfolioDao portfolioDao;

    @Autowired
    public PortfolioServiceImpl(PortfolioDao portfolioDao) {
        this.portfolioDao = portfolioDao;
    }

    @Override
    public List<PortfolioDto> getPortfolioList(MainCriteria mainCri) {
        mainCri.setStartNum((mainCri.getPageNum() - 1) * mainCri.getAmount());

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("mainCri", mainCri);

        return portfolioDao.getPortfolioList(paramMap);
    }

    @Override
    public int getPortfolioTotalCnt() {
        return portfolioDao.getPortfolioTotalCnt();
    }

    @Override
    public PortfolioDto getPortfolioById(int portfolio_id) {
        return portfolioDao.getPortfolioById(portfolio_id);
    }
}
