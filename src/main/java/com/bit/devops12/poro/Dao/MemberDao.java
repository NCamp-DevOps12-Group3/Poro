package com.bit.devops12.poro.dao;

import com.bit.devops12.poro.dto.MemberDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberDao {
	private SqlSessionTemplate mybatis;
	
	@Autowired
	public MemberDao(SqlSessionTemplate sqlSessionTemplate) {
		this.mybatis = sqlSessionTemplate;
	}
	
	public void join(MemberDto memberDto){
		System.out.println("MemberDao의 join 메소드 실행");
		mybatis.insert("MemberDao.join", memberDto);
		System.out.println("MemberDao의 join 메소드 실행 종료");
	}
	
	public List<MemberDto> getMembers() {
		System.out.println("MemberDao의 getMembers 메소드 실행");
		
		return mybatis.selectList("MemberDao.getMembers");
	}
	
	
	public int emailCheck(String email) {
		return mybatis.selectOne("MemberDao.emailCheck", email);
	}
	
	public int usernameCheck(String username) {
		return mybatis.selectOne("MemberDao.usernameCheck", username);
	}
	
	public int nicknameCheck(String nickname) {
		return mybatis.selectOne("MemberDao.nicknameCheck", nickname);
	}
	
	public MemberDto login(MemberDto memberDto) {
		return mybatis.selectOne("MemberDao.login", memberDto);
	}
	
	public List<MemberDto> findMembersUsingKeyword(String searchKeyword){
		System.out.println("MemberDao::findMembersUsingKeyword");
		return mybatis.selectList("MemberDao.findMembersUsingKeyword", searchKeyword);
	}
	
}
