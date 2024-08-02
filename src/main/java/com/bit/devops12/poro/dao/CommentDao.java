package com.bit.devops12.poro.dao;

import com.bit.devops12.poro.dto.CommentDto;
import com.bit.devops12.poro.dto.PortfolioDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentDao {

    private SqlSessionTemplate mybatis;

    @Autowired
    public CommentDao(SqlSessionTemplate sqlSessionTemplate) {
        this.mybatis = sqlSessionTemplate;
    }

    public List<CommentDto> getCommentList(PortfolioDto portfolioDto) {
        System.out.println("CommentDao의 getCommentList 메소드 실행");

        return mybatis.selectList("CommentDao.getCommentList", portfolioDto);
    }

    public void postComment(CommentDto commentDto){
        System.out.println("CommentDao의 postComment 메소드 실행");

        mybatis.insert("CommentDao.postComment", commentDto);
    }

}
