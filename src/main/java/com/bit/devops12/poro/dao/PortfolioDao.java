package com.bit.devops12.poro.dao;

import com.bit.devops12.poro.dto.PortfolioDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PortfolioDao {
    private SqlSessionTemplate mybatis;

    @Autowired
    public PortfolioDao(SqlSessionTemplate sqlSessionTemplate) {
        this.mybatis = sqlSessionTemplate;
    }

    public List<PortfolioDto> findPortfolioByKeyword(String searchKeyword){
        return mybatis.selectList(
                "PortfolioDao.searchPortfolioByKeyword",
                searchKeyword);


    }

}
