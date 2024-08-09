package com.bit.devops12.poro.service;

import com.bit.devops12.poro.dto.CompanyDto;
import com.bit.devops12.poro.dto.Criteria;
import com.bit.devops12.poro.dto.FileDto;
import com.bit.devops12.poro.dto.UserDto;

import java.awt.print.Pageable;
import java.util.List;

public interface CompanyService {
    List<CompanyDto> getCompanyList(Criteria cri);

    List<CompanyDto> getCompanyListMain(Criteria cri, UserDto loginUser);

    int getCompanyTotalCnt();

    void bookmarkCompany(int recruitment_id, UserDto loginUser);
    void unBookmarkCompany(int recruitment_id, UserDto loginUser);


}
