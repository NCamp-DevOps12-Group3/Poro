package com.bit.devops12.poro.dto;

import org.apache.ibatis.session.ResultHandler;

import java.time.LocalDateTime;
import java.util.List;

public class UserDto  {
	private int user_id;
	private String nickname;
	private String name;
	private String gender;
	private String job;
	private String phonenumber;
	private String email;
	private String password;
	private String role;
	private String profile_image;
	private LocalDateTime regdate;
	private LocalDateTime moddate;
	private String introduction;
	private String site_url;
	private int portfolio_id;
	private int comment_id;
	private String commentContent;
	private String portfolioContent;
	private LocalDateTime commentModDate;
	private LocalDateTime portfolioModDate;
	
	public int getUser_id() {
		return user_id;
	}
	
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	public String getNickname() {
		return nickname;
	}
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getGender() {
		return gender;
	}
	
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getJob() {
		return job;
	}
	
	public void setJob(String job) {
		this.job = job;
	}
	
	public String getPhonenumber() {
		return phonenumber;
	}
	
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getRole() {
		return role;
	}
	
	public void setRole(String role) {
		this.role = role;
	}
	
	public String getProfile_image() {
		return profile_image;
	}
	
	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
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
	
	public String getIntroduction() {
		return introduction;
	}
	
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	
	public String getSite_url() {
		return site_url;
	}
	
	public void setSite_url(String site_url) {
		this.site_url = site_url;
	}
	
	public int getPortfolio_id() {
		return portfolio_id;
	}
	
	public void setPortfolio_id(int portfolio_id) {
		this.portfolio_id = portfolio_id;
	}
	
	public int getComment_id() {
		return comment_id;
	}
	
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	
	public String getCommentContent() {
		return commentContent;
	}
	
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	
	public String getPortfolioContent() {
		return portfolioContent;
	}
	
	public void setPortfolioContent(String portfolioContent) {
		this.portfolioContent = portfolioContent;
	}
	
	public LocalDateTime getCommentModDate() {
		return commentModDate;
	}
	
	public void setCommentModDate(LocalDateTime commentModDate) {
		this.commentModDate = commentModDate;
	}
	
	public LocalDateTime getPortfolioModDate() {
		return portfolioModDate;
	}
	
	public void setPortfolioModDate(LocalDateTime portfolioModDate) {
		this.portfolioModDate = portfolioModDate;
	}
	
	@Override
	public String toString() {
		return "UserDto{" +
				       "user_id=" + user_id +
				       ", nickname='" + nickname + '\'' +
				       ", name='" + name + '\'' +
				       ", gender='" + gender + '\'' +
				       ", job='" + job + '\'' +
				       ", phonenumber='" + phonenumber + '\'' +
				       ", email='" + email + '\'' +
				       ", password='" + password + '\'' +
				       ", role='" + role + '\'' +
				       ", profile_image='" + profile_image + '\'' +
				       ", regdate=" + regdate +
				       ", moddate=" + moddate +
				       ", introduction='" + introduction + '\'' +
				       ", site_url='" + site_url + '\'' +
				       ", portfolio_id=" + portfolio_id +
				       ", comment_id=" + comment_id +
				       ", commentContent='" + commentContent + '\'' +
				       ", portfolioContent='" + portfolioContent + '\'' +
				       ", commentModDate=" + commentModDate +
				       ", portfolioModDate=" + portfolioModDate +
				       '}';
	}
}