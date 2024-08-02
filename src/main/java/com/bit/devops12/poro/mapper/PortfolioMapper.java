package com.bit.devops12.poro.mapper;

import com.bit.devops12.poro.model.Portfolio;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;

public interface PortfolioMapper {
    @Insert("INSERT INTO portfolio (USER_ID, PORTFOLIO_URL, THUMBNAIL_URL, DESCRIPTION, REGDATE, MODDATE) " +
            "VALUES (#{userId}, #{portfolioUrl}, #{thumbnailUrl}, #{description}, NOW(), NOW())")
    @Options(useGeneratedKeys = true, keyProperty = "portfolioId")
    void insertPortfolio(Portfolio portfolio);
}
