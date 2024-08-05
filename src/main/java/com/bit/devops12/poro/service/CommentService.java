package com.bit.devops12.poro.service;

import com.bit.devops12.poro.dto.CommentDto;
import com.bit.devops12.poro.dto.FileDto;
import com.bit.devops12.poro.dto.PortfolioDto;

import java.util.List;

public interface CommentService {
    List<CommentDto> getCommentList(PortfolioDto portfolioDto);
    void postComment(CommentDto commentDto);
}
