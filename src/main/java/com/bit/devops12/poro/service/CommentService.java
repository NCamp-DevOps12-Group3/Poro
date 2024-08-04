package com.bit.devops12.poro.service;

import com.bit.devops12.poro.dto.CommentDto;
import com.bit.devops12.poro.dto.PortfolioDto;
import com.bit.devops12.poro.dto.UserDto;

import java.util.List;

public interface CommentService {
    List<CommentDto> getCommentList(PortfolioDto portfolioDto, UserDto loginUser);
    void postComment(CommentDto commentDto);
}
