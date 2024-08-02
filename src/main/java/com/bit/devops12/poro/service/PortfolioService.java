package com.bit.devops12.poro.service;

import com.bit.devops12.poro.dto.Criteria;
import com.bit.devops12.poro.dto.MainCriteria;
import com.bit.devops12.poro.dto.PortfolioDto;

import java.util.List;
import java.util.Map;

public interface PortfolioService {
    List<PortfolioDto> getPortfolioList(MainCriteria mainCri);

    int getPortfolioTotalCnt();

    PortfolioDto getPortfolioById(int portfolio_id);
}
