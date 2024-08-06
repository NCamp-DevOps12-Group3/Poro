package com.bit.devops12.poro.dto;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class PortfolioDto {
    private int portfolio_id;
    private int user_id;
    private String cssurl;
    private String jsurl;
    private String htmlurl;
    private String thumbnail_url;
    private LocalDateTime regdate;
    private LocalDateTime moddate;
    private String nickname;
    private String skillname;
    private String description;
    private List<String> htmlCode;
    private List<String> cssCode;
    private List<String> jsCode;
    private String mergeCode;
    private int bookmark_id;
    private int likeCount;
    private int commentCount;
    private boolean isLiked;
    private boolean bookmarked;

    public LocalDateTime getModdate() {
        return moddate;
    }

    public void setModdate(LocalDateTime moddate) {
        this.moddate = moddate;
    }

    public int getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(int likeCount) {
        this.likeCount = likeCount;
    }

    public int getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(int commentCount) {
        this.commentCount = commentCount;
    }

    @Override
    public String toString() {
        return "PortfolioDto{" +
                "portfolio_id=" + portfolio_id +
                ", user_id=" + user_id +
                ", cssurl='" + cssurl + '\'' +
                ", jsurl='" + jsurl + '\'' +
                ", htmlurl='" + htmlurl + '\'' +
                ", thumbnail_url='" + thumbnail_url + '\'' +
                ", regdate=" + regdate +
                ", moddate=" + moddate +
                ", nickname='" + nickname + '\'' +
                ", skillname='" + skillname + '\'' +
                ", description='" + description + '\'' +
                ", htmlCode=" + htmlCode +
                ", cssCode=" + cssCode +
                ", jsCode=" + jsCode +
                ", mergeCode='" + mergeCode + '\'' +
                ", bookmark_id=" + bookmark_id +
                ", likeCount=" + likeCount +
                ", commentCount=" + commentCount +
                ", isLiked=" + isLiked +
                '}';
    }

    public List<String> getCssList(){
        return cssurl != null ? Arrays.stream(cssurl.split(",")).toList() : null;
    }

    public List<String> getJsList(){
        return jsurl != null ? Arrays.stream(jsurl.split(",")).toList() : null;
    }

    public List<String> getHtmlList() {
        return htmlurl != null ? Arrays.stream(htmlurl.split(",")).toList() : null;
    }
    public boolean isBookmarked() {
        return bookmarked;
    }

    public void setBookmarked(boolean bookmarked) {
        this.bookmarked = bookmarked;
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

    public String getCssurl() {
        return cssurl;
    }

    public void setCssurl(String cssurl) {
        this.cssurl = cssurl;
    }

    public String getJsurl() {
        return jsurl;
    }

    public void setJsurl(String jsurl) {
        this.jsurl = jsurl;
    }

    public String getHtmlurl() {
        return htmlurl;
    }

    public void setHtmlurl(String htmlurl) {
        this.htmlurl = htmlurl;
    }

    public String getThumbnail_url() {
        return thumbnail_url;
    }

    public void setThumbnail_url(String thumbnail_url) {
        this.thumbnail_url = thumbnail_url;
    }

    public LocalDateTime getRegdate() {
        return regdate;
    }

    public void setRegdate(LocalDateTime regdate) {
        this.regdate = regdate;
    }

    public String getSkillname() {
        return skillname;
    }

    public void setSkillname(String skillname) {
        this.skillname = skillname;
    }

    public List<String> getHtmlCode() {
        return htmlCode;
    }

    public void setHtmlCode(List<String> htmlCode) {
        this.htmlCode = htmlCode;
    }

    public List<String> getCssCode() {
        return cssCode;
    }

    public void setCssCode(List<String> cssCode) {
        this.cssCode = cssCode;
    }

    public List<String> getJsCode() {
        return jsCode;
    }

    public void setJsCode(List<String> jsCode) {
        this.jsCode = jsCode;
    }

    public String getMergeCode() {
        return mergeCode;
    }

    public void setMergeCode(String mergeCode) {
        this.mergeCode = mergeCode;
    }

    public int getBookmark_id() {
        return bookmark_id;
    }

    public void setBookmark_id(int bookmark_id) {
        this.bookmark_id = bookmark_id;
    }

    public LocalDateTime getModDate() {
        return moddate;
    }

    public void setModDate(LocalDateTime modDate) {
        this.moddate = modDate;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isLiked() {
        return isLiked;
    }

    public void setLiked(boolean liked) {
        isLiked = liked;
    }
}

