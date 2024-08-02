package com.bit.devops12.poro.model;

import java.time.LocalDateTime;

public class Portfolio {
    private int portfolioId;
    private int userId;
    private String portfolioUrl;
    private String thumbnailUrl;
    private String description;
    private LocalDateTime regdate;
    private LocalDateTime moddate;

    public int getPortfolioId() {
        return portfolioId;
    }

    public void setPortfolioId(int portfolioId) {
        this.portfolioId = portfolioId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getPortfolioUrl() {
        return portfolioUrl;
    }

    public void setPortfolioUrl(String portfolioUrl) {
        this.portfolioUrl = portfolioUrl;
    }

    public String getThumbnailUrl() {
        return thumbnailUrl;
    }

    public void setThumbnailUrl(String thumbnailUrl) {
        this.thumbnailUrl = thumbnailUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
}
