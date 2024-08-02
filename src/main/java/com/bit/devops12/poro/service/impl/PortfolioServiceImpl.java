package com.bit.devops12.poro.service.impl;

import com.bit.devops12.poro.dao.PortfolioDao;
import com.bit.devops12.poro.dto.Criteria;
import com.bit.devops12.poro.dto.MainCriteria;
import com.bit.devops12.poro.dto.PortfolioDto;
import com.bit.devops12.poro.mapper.PortfolioMapper;
import com.bit.devops12.poro.mapper.SkillTagMapper;
import com.bit.devops12.poro.model.Portfolio;
import com.bit.devops12.poro.model.SkillTag;
import com.bit.devops12.poro.service.PortfolioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PortfolioServiceImpl implements PortfolioService {

    private PortfolioDao portfolioDao;

    private PortfolioMapper portfolioMapper;
    private SkillTagMapper skillTagMapper;

    @Autowired
    public PortfolioServiceImpl(PortfolioDao portfolioDao, PortfolioMapper portfolioMapper, SkillTagMapper skillTagMapper) {
        this.portfolioDao = portfolioDao;
        this.portfolioMapper = portfolioMapper;
        this.skillTagMapper = skillTagMapper;
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


    @Override
    public void savePortfolio(Portfolio portfolio) {
        portfolioMapper.insertPortfolio(portfolio);
    }

    @Override
    public void saveSkillTag(SkillTag skillTag) {
        skillTagMapper.insertSkillTag(skillTag);
    }
}
