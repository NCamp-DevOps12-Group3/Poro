package com.bit.devops12.poro.service;

import com.bit.devops12.poro.dto.CompanyDto;
import com.bit.devops12.poro.dto.Criteria;
import com.bit.devops12.poro.dto.FileDto;

import java.awt.print.Pageable;
import java.util.List;

public interface CompanyService {
    List<CompanyDto> getCompanyList(Criteria cri);

    int getCompanyTotalCnt();


}
