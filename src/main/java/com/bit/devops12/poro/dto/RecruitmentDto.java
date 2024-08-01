package com.bit.devops12.poro.dto;

import java.time.LocalDateTime;

public class RecruitmentDto {
    private int recruitmentId;
    private int user_id;
    private String company_name;
    private String company_icon_url;
    private String recruitment_url;
    private String recruitment_title;
    private LocalDateTime dday;
    private LocalDateTime regdate;
    private LocalDateTime moddate;
    private String location;
    private String career;
    private String education;
    private String skillname;
    private int bookmark_id;

    public String getSkillname() {
        return skillname;
    }

    public void setSkillname(String skillname) {
        this.skillname = skillname;
    }

    public int getBookmark_id() {
        return bookmark_id;
    }

    public void setBookmark_id(int bookmark_id) {
        this.bookmark_id = bookmark_id;
    }

    @Override
    public String toString() {
        return "RecruitmentDto{" +
                "recruitmentId=" + recruitmentId +
                ", user_id=" + user_id +
                ", company_name='" + company_name + '\'' +
                ", company_icon_url='" + company_icon_url + '\'' +
                ", recruitment_url='" + recruitment_url + '\'' +
                ", recruitment_title='" + recruitment_title + '\'' +
                ", dday=" + dday +
                ", regdate=" + regdate +
                ", moddate=" + moddate +
                ", loaction='" + loaction + '\'' +
                ", career='" + career + '\'' +
                ", education='" + education + '\'' +
                '}';
    }

    public int getRecruitmentId() {
        return recruitmentId;
    }

    public void setRecruitmentId(int recruitmentId) {
        this.recruitmentId = recruitmentId;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getCompany_name() {
        return company_name;
    }

    public void setCompany_name(String company_name) {
        this.company_name = company_name;
    }

    public String getCompany_icon_url() {
        return company_icon_url;
    }

    public void setCompany_icon_url(String company_icon_url) {
        this.company_icon_url = company_icon_url;
    }

    public String getRecruitment_url() {
        return recruitment_url;
    }

    public void setRecruitment_url(String recruitment_url) {
        this.recruitment_url = recruitment_url;
    }

    public String getRecruitment_title() {
        return recruitment_title;
    }

    public void setRecruitment_title(String recruitment_title) {
        this.recruitment_title = recruitment_title;
    }

    public LocalDateTime getDday() {
        return dday;
    }

    public void setDday(LocalDateTime dday) {
        this.dday = dday;
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
}
