package com.bit.devops12.poro.Dto;

public class MemberDto {
	private int id;
	private String Nickname;
	private String Name;
	private String gender;
	private String job;
	private String phonenumber;
	private String email;
	private String password;
	private String passwordChk;
	private String role;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getNickname() {
		return Nickname;
	}
	
	public void setNickname(String nickname) {
		Nickname = nickname;
	}
	
	public String getName() {
		return Name;
	}
	
	public void setName(String name) {
		Name = name;
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
	
	public String getPasswordChk() {
		return passwordChk;
	}
	
	public void setPasswordChk(String passwordChk) {
		this.passwordChk = passwordChk;
	}
	
	public String getRole() {
		return role;
	}
	
	public void setRole(String role) {
		this.role = role;
	}
	
	@Override
	public String toString() {
		return "MemberDto{" +
				       "id=" + id +
				       ", Nickname='" + Nickname + '\'' +
				       ", Name='" + Name + '\'' +
				       ", gender='" + gender + '\'' +
				       ", job='" + job + '\'' +
				       ", phonenumber='" + phonenumber + '\'' +
				       ", email='" + email + '\'' +
				       ", password='" + password + '\'' +
				       ", passwordChk='" + passwordChk + '\'' +
				       ", role='" + role + '\'' +
				       '}';
	}
}
