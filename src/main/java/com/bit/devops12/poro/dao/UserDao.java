package com.bit.devops12.poro.dao;

import com.bit.devops12.poro.dto.UserDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDao {
	private SqlSessionTemplate mybatis;
	
	@Autowired
	public UserDao(SqlSessionTemplate sqlSessionTemplate) {
		this.mybatis = sqlSessionTemplate;
	}
	
	public void join(UserDto userDto){
		System.out.println("UserDao의 join 메소드 실행");
		mybatis.insert("UserDao.join", userDto);
		System.out.println("UserDao의 join 메소드 실행 종료");
	}
	
	public List<UserDto> getMembers() {
		System.out.println("UserDao의 getMembers 메소드 실행");
		
		return mybatis.selectList("UserDao.getMembers");
	}
	
	
	
	public int emailCheck(String email) {
		return mybatis.selectOne("UserDao.emailCheck", email);
	}
	
	public int nameCheck(String username) {
		return mybatis.selectOne("UserDao.nameCheck", username);
	}
	
	public int nicknameCheck(String nickname) {
		return mybatis.selectOne("UserDao.nicknameCheck", nickname);
	}
	
	public UserDto login(UserDto userDto) {
		return mybatis.selectOne("UserDao.login", userDto);
	}
	
	
	
}
