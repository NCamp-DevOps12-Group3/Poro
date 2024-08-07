package com.bit.devops12.poro.service;

import com.bit.devops12.poro.dto.UserDto;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface UserService {
	void join(UserDto userDto);
	
	
	
	String emailCheck(String email);
	String nicknameCheck(String nickname);
	String nameCheck(String name);
	UserDto login(UserDto userDto);
	String passwordCheck(String password);

	
	void modify(UserDto userDto, MultipartFile uploadFiles);
	
	
	void ChangePassword(UserDto userDto);
	
	void deleteAccount(UserDto userDto);

	List<UserDto> historylog(UserDto user_id);
}
