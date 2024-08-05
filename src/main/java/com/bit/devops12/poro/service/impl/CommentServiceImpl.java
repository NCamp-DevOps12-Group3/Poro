package com.bit.devops12.poro.service.impl;

import com.bit.devops12.poro.dao.CommentDao;
import com.bit.devops12.poro.dto.CommentDto;
import com.bit.devops12.poro.dto.FileDto;
import com.bit.devops12.poro.dto.PortfolioDto;
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
    public List<CommentDto> getCommentList(PortfolioDto portfolioDto) {
        return commentDao.getCommentList(portfolioDto);
    }

    @Override
    public void postComment(CommentDto commentDto) {
        commentDao.postComment(commentDto);
    }

}