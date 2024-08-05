package com.bit.devops12.poro.dao;

import com.bit.devops12.poro.dto.CompanyDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class CompanyDao {
    private SqlSessionTemplate mybatis;

    @Autowired
    public CompanyDao(SqlSessionTemplate sqlSessionTemplate) {
        this.mybatis = sqlSessionTemplate;
    }

    public List<CompanyDto> getCompanyList(Map<String, Object> paramMap){

        return mybatis.selectList("CompanyDao.getCompanyList", paramMap);
    }

    public int getCompanyTotalCnt(){
        return mybatis.selectOne("CompanyDao.getCompanyTotalCnt");
    }

}
