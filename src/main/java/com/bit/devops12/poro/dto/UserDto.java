package com.bit.devops12.poro.dto;

import java.time.LocalDateTime;

public class UserDto {
	private int id;
	private String nickname;
	private String name;
	private String gender;
	private String job;
	private String phonenumber;
	private String email;
	private String password;
	private String role;
	private LocalDateTime regdate;
	private LocalDateTime moddate;
	
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
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
	
	@Override
	public String toString() {
		return "UserDto{" +
				       "id=" + id +
				       ", nickname='" + nickname + '\'' +
				       ", name='" + name + '\'' +
				       ", gender='" + gender + '\'' +
				       ", job='" + job + '\'' +
				       ", phonenumber='" + phonenumber + '\'' +
				       ", email='" + email + '\'' +
				       ", password='" + password + '\'' +
				       ", role='" + role + '\'' +
				       ", regdate=" + regdate +
				       ", moddate=" + moddate +
				       '}';
	}
}
