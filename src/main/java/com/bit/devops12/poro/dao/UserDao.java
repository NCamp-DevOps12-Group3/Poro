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
	
	
	
	
	
	public int emailCheck(String email) {
		return mybatis.selectOne("UserDao.emailCheck", email);
	}
	
	public int nameCheck(String name) {
		return mybatis.selectOne("UserDao.nameCheck", name);
	}
	
	public int nicknameCheck(String nickname) {
		return mybatis.selectOne("UserDao.nicknameCheck", nickname);
	}
	
	public UserDto login(UserDto userDto) {
		return mybatis.selectOne("UserDao.login", userDto);
	}
	
	public void modify(UserDto userDto){
		System.out.println("UserDao의 modify 메소드 실행");
		
		
		
		
		mybatis.update("UserDao.modify", userDto);
		
		
		
		
		
		System.out.println("UserDao의 modify 메소드 실행 종료");
	}
	
	
	public List<UserDto> findMembersUsingKeyword(String searchKeyword){
		System.out.println("UserDao::findMembersUsingKeyword");
		return mybatis.selectList("UserDao.findMembersUsingKeyword", searchKeyword);
	}
	
	public String passwordCheck(String password) {
		return mybatis.selectOne("UserDao.passwordCheck",password);
	}
	
	public void ChangePassword(UserDto userDto) {
		mybatis.update("UserDao.changepassword", userDto);
	}
	
	public void deleteAccount(UserDto userDto) {
		mybatis.delete( "UserDao.deleteAccount", userDto);
	}
	
	public List<UserDto> historylog(UserDto userDto) {
		return mybatis.selectList("UserDao.historylog",userDto );
	}
}
