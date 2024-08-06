package com.bit.devops12.poro.service;

import com.bit.devops12.poro.dto.PortfolioDto;
import com.bit.devops12.poro.dto.UserDto;

import java.util.List;
import java.util.Map;

public interface SearchService {
    List<UserDto> searchMemberList(String searchKeyword);
    List<PortfolioDto> searchPortfolioList(String searchKeyword);
}
