package com.bit.devops12.poro.service.impl;

import com.bit.devops12.poro.dao.CommentDao;
import com.bit.devops12.poro.dto.CommentDto;
import com.bit.devops12.poro.dto.PortfolioDto;
import com.bit.devops12.poro.dto.UserDto;
import com.bit.devops12.poro.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    private CommentDao commentDao;

    @Autowired
    public CommentServiceImpl(CommentDao commentDao){
        this.commentDao = commentDao;
    }

    @Override
    public List<CommentDto> getCommentList(PortfolioDto portfolioDto, UserDto loginUser) {
        return commentDao.getCommentList(portfolioDto, loginUser);
    }

    @Override
    public void postComment(CommentDto commentDto) {
        commentDao.postComment(commentDto);
    }

    @Override
    public void likeComment(int comment_id, UserDto loginUser) {
        commentDao.likeComment(comment_id, loginUser);
    }

    @Override
    public void unLikeComment(int comment_id, UserDto loginUser) {
        commentDao.unLikeComment(comment_id, loginUser);
    }

    @Override
    public CommentDto getCommentById(int comment_id) {
        return commentDao.getCommentById(comment_id);
    }

    @Override
    public void deleteComment(int comment_id) {
        commentDao.deleteComment(comment_id);
    }
}