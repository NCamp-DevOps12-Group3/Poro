package com.bit.devops12.poro.service;

import com.bit.devops12.poro.dto.UserDto;

import java.util.List;

public interface UserService {
	void join(UserDto userDto);
	
	List<UserDto> getMembers();
	
	UserDto getMemberByUsername(UserDto userDto);
	
	String emailCheck(String email);
	String NicknameCheck(String nickname);
	String NameCheck(String email);
}
