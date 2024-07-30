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
        List<PortfolioDto> list=mybatis.selectList("UserFeedsDao.getUserPortfolio",map);
        list.forEach(x->{
            System.out.println("x.getHtmlurl() = " + x.getHtmlurl());
            System.out.println("x.getCssurl() = " + x.getCssurl());
            System.out.println("x.getJsurl() = " + x.getJsurl());
            System.out.println("x.getPortfolioid() = " + x.getPortfolio_id());
            System.out.println("x.getContent() = " + x.getContent());
            System.out.println("x.getRegdate() = " + x.getRegdate());
            System.out.println("x.getSkillname() = " + x.getSkillname());
            System.out.println("x.getThumbnailurl() = " + x.getThumbnailurl());
            System.out.println("x.getUserid() = " + x.getUser_id());
        });
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
