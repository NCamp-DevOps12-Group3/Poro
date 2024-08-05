package com.bit.devops12.poro.dao;

import com.bit.devops12.poro.dto.PortfolioDto;
import com.bit.devops12.poro.dto.UserDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
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

    public PortfolioDto getPortfolioById(int portfolio_id, UserDto loginUser){

        Map<String, Object> params = new HashMap<String, Object>();

        params.put("portfolio_id", portfolio_id);
        params.put("loginUser", loginUser);

        return mybatis.selectOne("PortfolioDao.getPortfolioById", params);
    }

    public void likePortfolio(int portfolio_id, UserDto loginUser){

        System.out.println("PortfolioDao의 likePortfolio 메소드 실행");
        Map<String, Object> params = new HashMap<>();

        params.put("portfolio_id", portfolio_id);
        params.put("loginUser", loginUser);

        mybatis.insert("PortfolioDao.likePortfolio", params);
    }

    public void unLikePortfolio(int portfolio_id, UserDto loginUser){

        System.out.println("PortfolioDao의 unLikePortfolio 메소드 실행");
        Map<String, Object> params = new HashMap<>();

        params.put("portfolio_id", portfolio_id);
        params.put("loginUser", loginUser);

        mybatis.delete("PortfolioDao.unLikePortfolio", params);
    }

    public void deletePortfolio(int portfolio_id){

        System.out.println("PortfolioDao의 deletePortfolio 메소드 실행");
        mybatis.delete("PortfolioDao.deletePortfolio", portfolio_id);
    }
    
}
