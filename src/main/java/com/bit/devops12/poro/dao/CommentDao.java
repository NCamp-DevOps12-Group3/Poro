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

        System.out.println("세션 id : " + loginUser.getUser_id());

        Map<String, Object> params = new HashMap<>();

        params.put("portfolio", portfolioDto);
        params.put("loginUser", loginUser);

        return mybatis.selectList("CommentDao.getCommentList", params);
    }

    public void postComment(CommentDto commentDto){
        System.out.println("CommentDao의 postComment 메소드 실행");

        mybatis.insert("CommentDao.postComment", commentDto);
    }

}
