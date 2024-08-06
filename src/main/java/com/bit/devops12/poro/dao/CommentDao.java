package com.bit.devops12.poro.dao;

import com.bit.devops12.poro.dto.CommentDto;
import com.bit.devops12.poro.dto.PortfolioDto;
import com.bit.devops12.poro.dto.UserDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CommentDao {

    private SqlSessionTemplate mybatis;

    @Autowired
    public CommentDao(SqlSessionTemplate sqlSessionTemplate) {
        this.mybatis = sqlSessionTemplate;
    }

    public List<CommentDto> getCommentList(PortfolioDto portfolioDto, UserDto loginUser) {
        System.out.println("CommentDao의 getCommentList 메소드 실행");

        Map<String, Object> params = new HashMap<>();

        params.put("portfolio", portfolioDto);
        params.put("loginUser", loginUser);

        return mybatis.selectList("CommentDao.getCommentList", params);
    }

    public void postComment(CommentDto commentDto){
        System.out.println("CommentDao의 postComment 메소드 실행");

        mybatis.insert("CommentDao.postComment", commentDto);
    }
    
    public void likeComment(int comment_id, UserDto loginUser){
        System.out.println("CommentDao의 likeCommnet 메소드 실행");

        Map<String, Object> params = new HashMap<>();

        params.put("comment_id", comment_id);
        params.put("loginUser", loginUser);

        mybatis.insert("CommentDao.likeComment", params);
    }

    public void unLikeComment(int comment_id, UserDto loginUser){
        System.out.println("CommentDao의 unLikeCommnet 메소드 실행");

        Map<String, Object> params = new HashMap<>();

        params.put("comment_id", comment_id);
        params.put("loginUser", loginUser);

        mybatis.delete("CommentDao.unLikeComment", params);
    }
    
    public CommentDto getCommentById(int comment_id){
        System.out.println("CommentDao의 getCommentById 메소드 실행");

        System.out.println(comment_id);

        return mybatis.selectOne("CommentDao.getCommentById", comment_id);
    }

    public void deleteComment(int comment_id){
        System.out.println("CommentDao의 deleteComment 메소드 실행");

        mybatis.delete("CommentDao.deleteComment", comment_id);
    }

}
