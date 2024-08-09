package com.bit.devops12.poro.dao;

import com.bit.devops12.poro.dto.CompanyDto;
import com.bit.devops12.poro.dto.UserDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
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

    public void bookmarkCompany(int recruitment_id, UserDto loginUser){

        System.out.println("CompanyDao의 bookmarkCompany 메소드 실행");
        Map<String, Object> params = new HashMap<>();

        params.put("recruitment_id", recruitment_id);
        params.put("loginUser", loginUser);

        mybatis.insert("CompanyDao.bookmarkCompany", params);
    }

    public void unBookmarkCompany(int recruitment_id, UserDto loginUser){

        System.out.println("CompanyDao의 unBookmarkCompany 메소드 실행");
        Map<String, Object> params = new HashMap<>();

        params.put("recruitment_id", recruitment_id);
        params.put("loginUser", loginUser);

        mybatis.delete("CompanyDao.unBookmarkCompany", params);
    }

    public List<CompanyDto> getCompanyListMain(Map<String, Object> paramMap){

        return mybatis.selectList("CompanyDao.getCompanyListMain", paramMap);
    }


}
