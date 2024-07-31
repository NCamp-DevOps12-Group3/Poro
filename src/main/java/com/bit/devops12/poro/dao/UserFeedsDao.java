package com.bit.devops12.poro.dao;


import com.bit.devops12.poro.dto.Criteria;
import com.bit.devops12.poro.dto.PortfolioDto;
import com.bit.devops12.poro.dto.ProfileDto;
import com.bit.devops12.poro.dto.RecruitmentDto;
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

    public void deletePortfolio(List<Integer> deleteList) {
        mybatis.delete("UserFeedsDao.deleteUserPortfolio",deleteList);
    }

    public List<PortfolioDto> getUserPopularPortfolio(int id) {
        List<PortfolioDto> userPortfolio = mybatis.selectList("UserFeedsDao.getUserPopularPortfolio",id);
        return mybatis.selectList("UserFeedsDao.getUserPopularPortfolio",id);
    }

    public List<RecruitmentDto> getUserBookmarkCoperation(Map<String,Object> map) {
        return mybatis.selectList("UserFeedsDao.getUserBookmarkCoperation",map);
    }

    public List<PortfolioDto> getUserBookmarkPortfolio(Map<String, Object> map) {
        return mybatis.selectList("UserFeedsDao.getUserBookmarkPortfolio",map);
    }

    public void deleteCoperationBookmark(List<Integer> deleteList) {
        mybatis.delete("UserFeedsDao.deleteCoperationBookmark",deleteList);
    }

    public void deleteOtherPortfolioBookmark(List<Integer> deleteList) {
        mybatis.delete("UserFeedsDao.deleteOtherPortfolioBookmark",deleteList);
    }

    public int getUserBookmarkCoperationToltalCnt(int id) {
        return mybatis.selectOne("UserFeedsDao.getUserBookmarkCoperationToltalCnt",id);
    }

    public int getUserBookmarkPortfolioCnt(int id) {
        return mybatis.selectOne("UserFeedsDao.getUserBookmarkPortfolioCnt",id);
    }
}
