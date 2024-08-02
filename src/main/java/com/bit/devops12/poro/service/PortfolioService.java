package com.bit.devops12.poro.service;

import com.bit.devops12.poro.mapper.PortfolioMapper;
import com.bit.devops12.poro.mapper.SkillTagMapper;
import com.bit.devops12.poro.model.Portfolio;
import com.bit.devops12.poro.model.SkillTag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PortfolioService {

    @Autowired
    private PortfolioMapper portfolioMapper;

    @Autowired
    private SkillTagMapper skillTagMapper;

    public void savePortfolio(Portfolio portfolio) {
        portfolioMapper.insertPortfolio(portfolio);
    }

    public void saveSkillTag(SkillTag skillTag) {
        skillTagMapper.insertSkillTag(skillTag);
    }
}
