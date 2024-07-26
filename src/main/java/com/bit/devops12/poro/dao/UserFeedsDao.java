package com.project.dao;

import com.project.dto.PortfolioDto;
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
    public PortfolioDto getUserInfo(int id) {
        return mybatis.selectOne("UserFeedsDao.",id);
    }

    public List<PortfolioDto> getUserPopularPofol(int id) {
        return mybatis.selectList("UserFeedsDao.getUserPopularPofol",id);
    }
}
