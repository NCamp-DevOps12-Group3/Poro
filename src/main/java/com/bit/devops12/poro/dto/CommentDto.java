package com.bit.devops12.poro.dto;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class CommentDto {
    private int comment_id;
    private int portfolio_id;
    private int user_id;
    private String content;
    private LocalDateTime regdate;
    private LocalDateTime moddate;
    private int comment_parent_id;
    private List<CommentDto> replies = new ArrayList<>();
    private int likeCount;

    @Override
    public String toString() {
        return "CommentDto{" +
                "comment_id=" + comment_id +
                ", portfolio_id=" + portfolio_id +
                ", user_id=" + user_id +
                ", content='" + content + '\'' +
                ", regdate=" + regdate +
                ", moddate=" + moddate +
                ", comment_parent_id=" + comment_parent_id +
                ", replies=" + replies +
                ", likeCount=" + likeCount +
                '}';
    }

    public List<CommentDto> getReplies() {
        return replies;
    }

    public void setReplies(List<CommentDto> replies) {
        this.replies = replies;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public int getPortfolio_id() {
        return portfolio_id;
    }

    public void setPortfolio_id(int portfolio_id) {
        this.portfolio_id = portfolio_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime getRegdate() {
        return regdate;
    }

    public void setRegdate(LocalDateTime regdate) {
        this.regdate = regdate;
    }

    public LocalDateTime getModdate() {
        return moddate;
    }

    public void setModdate(LocalDateTime moddate) {
        this.moddate = moddate;
    }

    public int getComment_parent_id() {
        return comment_parent_id;
    }

    public void setComment_parent_id(int comment_parent_id) {
        this.comment_parent_id = comment_parent_id;
    }

    public int getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(int likeCount) {
        this.likeCount = likeCount;
    }

}
