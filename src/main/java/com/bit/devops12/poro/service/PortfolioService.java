package com.bit.devops12.poro.service;

<<<<<<< HEAD
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
=======
import com.bit.devops12.poro.dto.Criteria;
import com.bit.devops12.poro.dto.MainCriteria;
import com.bit.devops12.poro.dto.PortfolioDto;

import java.util.List;
import java.util.Map;

public interface PortfolioService {
    List<PortfolioDto> getPortfolioList(MainCriteria mainCri);

    int getPortfolioTotalCnt();

    PortfolioDto getPortfolioById(int portfolio_id);
>>>>>>> origin/chunghyun
}
