package com.bit.devops12.poro.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Recruitment {
    private int recruitmentId;
    private int userId;
    private String companyName;
    private String companyIconUrl;
    private String recruitmentUrl;
    private String recruitmentTitle;
    private LocalDate dday;
    private LocalDateTime regDate;
    private LocalDateTime modDate;
    private String location;
    private String career;
    private String education;

    public int getRecruitmentId() {
        return recruitmentId;
    }

    public void setRecruitmentId(int recruitmentId) {
        this.recruitmentId = recruitmentId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyIconUrl() {
        return companyIconUrl;
    }

    public void setCompanyIconUrl(String companyIconUrl) {
        this.companyIconUrl = companyIconUrl;
    }

    public String getRecruitmentUrl() {
        return recruitmentUrl;
    }

    public void setRecruitmentUrl(String recruitmentUrl) {
        this.recruitmentUrl = recruitmentUrl;
    }

    public String getRecruitmentTitle() {
        return recruitmentTitle;
    }

    public void setRecruitmentTitle(String recruitmentTitle) {
        this.recruitmentTitle = recruitmentTitle;
    }

    public LocalDate getDday() {
        return dday;
    }

    public void setDday(LocalDate dday) {
        this.dday = dday;
    }

    public LocalDateTime getRegDate() {
        return regDate;
    }

    public void setRegDate(LocalDateTime regDate) {
        this.regDate = regDate;
    }

    public LocalDateTime getModDate() {
        return modDate;
    }

    public void setModDate(LocalDateTime modDate) {
        this.modDate = modDate;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getCareer() {
        return career;
    }

    public void setCareer(String career) {
        this.career = career;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    @Override
    public String toString() {
        return "Recruitment{" +
                "recruitmentId=" + recruitmentId +
                ", userId=" + userId +
                ", companyName='" + companyName + '\'' +
                ", companyIconUrl='" + companyIconUrl + '\'' +
                ", recruitmentUrl='" + recruitmentUrl + '\'' +
                ", recruitmentTitle='" + recruitmentTitle + '\'' +
                ", dday=" + dday +
                ", regDate=" + regDate +
                ", modDate=" + modDate +
                ", location='" + location + '\'' +
                ", career='" + career + '\'' +
                ", education='" + education + '\'' +
                '}';
    }
}
