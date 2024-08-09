package com.bit.devops12.poro.service.impl;

import com.bit.devops12.poro.common.DdayCalculator;
import com.bit.devops12.poro.dao.CompanyDao;
import com.bit.devops12.poro.dto.CompanyDto;
import com.bit.devops12.poro.dto.Criteria;
import com.bit.devops12.poro.dto.FileDto;
import com.bit.devops12.poro.dto.UserDto;
import com.bit.devops12.poro.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CompanyServiceImpl implements CompanyService {
    private CompanyDao companyDao;

    @Autowired
    public CompanyServiceImpl(CompanyDao companyDao){
        this.companyDao = companyDao;
    }

    @Override
    public List<CompanyDto> getCompanyList(Criteria cri){
        cri.setStartNum((cri.getPageNum() - 1) * cri.getAmount());

        System.out.println(cri.toString());

        Map<String, Object> paramMap = new HashMap<>();

        paramMap.put("cri", cri);

        List<CompanyDto> ddayList = companyDao.getCompanyList(paramMap);

        for(CompanyDto companyDto : ddayList){
            DdayCalculator ddayCalculator = new DdayCalculator();
            String dDayResult = "";

            dDayResult = "";
            if(companyDto.getDday().isEmpty())
                dDayResult = ddayCalculator.getDdayRed(companyDto.getRegdate());
            else dDayResult = ddayCalculator.getDdayRed(companyDto.getDday());

            companyDto.setDday(dDayResult);
//            System.out.println(companyDto);

        }

        paramMap.put("ddayList", ddayList);


        return companyDao.getCompanyList(paramMap);
    }

    @Override
    public int getCompanyTotalCnt() {
        return companyDao.getCompanyTotalCnt();
    }

    @Override
    public void bookmarkCompany(int recruitment_id, UserDto loginUser) {
        companyDao.bookmarkCompany(recruitment_id, loginUser);
    }

    @Override
    public void unBookmarkCompany(int recruitment_id, UserDto loginUser) {
        companyDao.unBookmarkCompany(recruitment_id, loginUser);
    }


}
