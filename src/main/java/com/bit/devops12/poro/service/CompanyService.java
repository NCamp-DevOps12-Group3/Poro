package com.bit.devops12.poro.service;

import com.bit.devops12.poro.dto.CompanyDto;
import com.bit.devops12.poro.dto.Criteria;

import java.util.List;

public interface CompanyService {
    List<CompanyDto> getCompanyList(Criteria cri);

    int getCompanyTotalCnt();
}
