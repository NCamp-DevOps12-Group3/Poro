package com.bit.devops12.poro.service;
import com.bit.devops12.poro.dto.MainCriteria;
import com.bit.devops12.poro.dto.MiniProjectCriteria;
import com.bit.devops12.poro.dto.PortfolioDto;
import com.bit.devops12.poro.model.Portfolio;
import com.bit.devops12.poro.model.SkillTag;
import com.bit.devops12.poro.dto.UserDto;

import java.nio.file.Path;
import java.util.List;


public interface PortfolioService {
    List<PortfolioDto> getPortfolioList(MainCriteria mainCri, UserDto loginUser);
    List<PortfolioDto> getPortfolioListMini(MiniProjectCriteria miniProjectCri, UserDto loginUser);

    int getPortfolioTotalCnt();
//    PortfolioDto getPortfolioById(int portfolio_id);
    void savePortfolio(Portfolio portfolio);
    void saveSkillTag(SkillTag skillTag);
    PortfolioDto getPortfolioById(int portfolio_id, UserDto loginUser);

    void likePortfolio(int portfolio_id, UserDto loginUser);
    void unLikePortfolio(int portfolio_id, UserDto loginUser);

    void deletePortfolio(int portfolio_id);
    void saveHtml(int portfolio_id, List<String> htmlPath);
    void saveCss(int portfolio_id, List<String> cssPath);
    void saveJs(int portfolio_id, List<String> jsPath);

    PortfolioDto getCurrentPortfolioByUserId(int userId);
}
