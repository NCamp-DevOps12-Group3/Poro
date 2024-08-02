package com.bit.devops12.poro.dao;

import com.bit.devops12.poro.dto.PortfolioDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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

    public List<PortfolioDto> getPortfolioList(Map<String, Object> paramMap) {
        System.out.println("PortfolioDao의 getPortfolioList 메소드 실행");

        return mybatis.selectList("PortfolioDao.getPortfolioList", paramMap);
    }

    public int getPortfolioTotalCnt(){
        return mybatis.selectOne("PortfolioDao.getPortfolioTotalCnt");
    }

    public PortfolioDto getPortfolioById(int portfolio_id){
        return mybatis.selectOne("PortfolioDao.getPortfolioById", portfolio_id);
    }

}
