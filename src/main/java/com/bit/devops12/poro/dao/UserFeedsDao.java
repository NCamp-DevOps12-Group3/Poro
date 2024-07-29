package com.bit.devops12.poro.dao;


import com.bit.devops12.poro.dto.Criteria;
import com.bit.devops12.poro.dto.PortfolioDto;
import com.bit.devops12.poro.dto.ProfileDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class UserFeedsDao {
    private SqlSessionTemplate mybatis;
    @Autowired
    public UserFeedsDao(SqlSessionTemplate sqlSessionTemplate) {
        this.mybatis = sqlSessionTemplate;
    }
    public ProfileDto getUserInfo(int id) {
        return mybatis.selectOne("UserFeedsDao.getUserInfo",id);
    }
    public List<PortfolioDto> getUserPortfolio(Map<String,Object> map){
        return mybatis.selectList("UserFeedsDao.getUserPortfolio",map);
    }

    public int getUserPortfolioTotalCnt(int id) {
        return mybatis.selectOne("UserFeedsDao.getUserPortfolioTotalCnt",id);
    }

    public void deletePortfolio(List<String> deleteList) {
        mybatis.delete("userFeedsDao.deleteUserPortfolio",deleteList);
    }

    public List<PortfolioDto> getUserPopularPortfolio(int id) {
        return mybatis.selectList("UserFeedsDao.getUserPopularPortfolio",id);
    }
}
