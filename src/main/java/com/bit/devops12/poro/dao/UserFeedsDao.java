package com.bit.devops12.poro.dao;


import com.bit.devops12.poro.dto.PortfolioDto;
import com.bit.devops12.poro.dto.ProfileDto;
import com.bit.devops12.poro.dto.RecruitmentDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
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

    public boolean deleteListIsOwner(int id, List<Integer> portfolioIds) {
        Map<String,Object> map = new HashMap<>();
        map.put("id", id);
        map.put("portfolioIds", portfolioIds);
        if ((Integer) mybatis.selectOne("UserFeedsDao.deleteListIsOwner",map)!=0){
            return false;
        }
        return true;
    }

    public boolean getFollowInfo(int userid, int id) {
        Map<String,Object> map = new HashMap<>();
        map.put("userid", userid);
        map.put("id", id);
        return mybatis.selectOne("UserFeedsDao.getFollowInfo",map);
    }
    public int isfollow(Map<String,Object> map) {
        return mybatis.selectOne("UserFeedsDao.isfollow",map);
    }
    public boolean unfollow(Map<String, Object> map) {
        int cnt=isfollow(map);
        if (cnt != 0){
            mybatis.delete("UserFeedsDao.unfollow",map);
        }
        if (isfollow(map) != 0){
            return false;
        }
        return true;
    }

    public boolean follow(Map<String, Object> map) {
        if (isfollow(map) != 0){
            return false;
        }
        mybatis.insert("UserFeedsDao.follow",map);
        if (isfollow(map) != 0){
            return true;
        }
        return false;
    }

    public Map<String, Object> getbookmarkInfo(Map<String, Object> map) {
        Map<String,Object> result=new HashMap<>();
        result.put("portfolioBookmark", mybatis.selectList("UserFeedsDao.getbookmarkPortfolioInfo",map));

        result.put("coperationBookmark", mybatis.selectList("UserFeedsDao.getbookmarkCoperationInfo",map));
        return result;
    }

    public boolean portfolioBookmarktoggle(Map<String, Object> map) {
        boolean a=mybatis.selectOne("UserFeedsDao.hasPortfolioBookmark",map);

        if (!a){
            mybatis.insert("UserFeedsDao.InsertPortfolioBookmark",map);
        }
        else {
            mybatis.delete("UserFeedsDao.DeletePortfolioBookmark",map);
        }
        return true;
    }

    public List<RecruitmentDto> getRecruitmentList(int id) {
        return mybatis.selectList("UserFeedsDao.getRecruitmentList",id);
    }
}
