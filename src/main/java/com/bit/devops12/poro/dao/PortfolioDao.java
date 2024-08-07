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

        System.out.println("PortfolioDao의 getPortfolioById 메소드 실행");

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

        System.out.println("portfolio_id = " + portfolio_id);

        System.out.println("PortfolioDao의 deletePortfolio 메소드 실행");

        // 포트폴리오와 연관된 모든 댓글 ID를 가져오기
        List<Integer> commentIds = mybatis.selectList("PortfolioDao.selectAllCommentIdsForPortfolio", portfolio_id);

        System.out.println(2);
        if (commentIds != null && !commentIds.isEmpty()) {
            System.out.println(3);
            // 댓글에 대한 좋아요 삭제
            Map<String, Object> params = new HashMap<>();
            params.put("commentIds", commentIds);
            mybatis.delete("CommentDao.deleteLikesForComments", params);

            // 댓글 삭제
            mybatis.delete("CommentDao.deleteComments", params);
        }

        // 포트폴리오에 대한 좋아요 삭제
        mybatis.delete("PortfolioDao.deleteLikesForPortfolio", portfolio_id);

        System.out.println(4);

        // 포트폴리오에 연관된 HTML, CSS, JavaScript 데이터 삭제
        mybatis.delete("PortfolioDao.deleteHtmlForPortfolio", portfolio_id);
        System.out.println(5);
        mybatis.delete("PortfolioDao.deleteCssForPortfolio", portfolio_id);

        System.out.println(6);
        mybatis.delete("PortfolioDao.deleteJsForPortfolio", portfolio_id);
        System.out.println(7);

        // 포트폴리오 삭제
        mybatis.delete("PortfolioDao.deletePortfolio", portfolio_id);

        System.out.println(8);
    }
    
}
