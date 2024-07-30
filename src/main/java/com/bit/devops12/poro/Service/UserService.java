package com.bit.devops12.poro.Service;

import com.bit.devops12.poro.Dto.UserDto;

import java.util.List;

public interface UserService {
	void join(UserDto userDto);
	
	List<UserDto> getMembers();
	
	UserDto getMemberByUsername(UserDto userDto);
	
	String emailCheck(String email);
	String NicknameCheck(String nickname);
	String NameCheck(String email);
}
