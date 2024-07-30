package com.bit.devops12.poro.Service.Impl;

import com.bit.devops12.poro.Dao.UserDao;
import com.bit.devops12.poro.Dto.UserDto;
import com.bit.devops12.poro.Service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
	private UserDao userDao;
	@Autowired
	public UserServiceImpl(UserDao userDao) {
		this.userDao = userDao;
	}
	
	
	@Override
	public void join(UserDto userDto) {
		userDao.join(userDto);
	}
	
	@Override
	public List<UserDto> getMembers() {
		return List.of();
	}
	
	@Override
	public UserDto getMemberByUsername(UserDto userDto) {
		return null;
	}
	
	@Override
	public String emailCheck(String email) {
		int emailCheck = userDao.emailCheck(email);
		ObjectMapper objectMapper = new ObjectMapper();
		
		Map<String, String> jsonMap = new HashMap<>();
		
		if (emailCheck == 0) {
			jsonMap.put("emailCheckMsg", "emailOk");
		} else {
			jsonMap.put("emailCheckMsg", "emailFail");
		}
		String jsonString = "";
		
		try {
			// writerWithDefaultPrettyPrinter(): 들여쓰기랑 엔터값이 포함하여 시인성이 높은 형태로 데이터를 써주는 writer
			jsonString = objectMapper.writerWithDefaultPrettyPrinter()
					             .writeValueAsString(jsonMap);
		} catch (JsonProcessingException je) {
			System.out.println(je.getMessage());
		}
		return jsonString;
	}
	
	@Override
	public String NicknameCheck(String nickname) {
		int nicknameCheck = userDao.nicknameCheck(nickname);
		ObjectMapper objectMapper = new ObjectMapper();
		
		Map<String, String> jsonMap = new HashMap<>();
		
		if (nicknameCheck == 0) {
			jsonMap.put("NicknameCheckMsg", "NicknameOk");
		} else {
			jsonMap.put("NicknameCheckMsg", "NicknameFail");
		}
		String jsonString = "";
		
		try {
			// writerWithDefaultPrettyPrinter(): 들여쓰기랑 엔터값이 포함하여 시인성이 높은 형태로 데이터를 써주는 writer
			jsonString = objectMapper.writerWithDefaultPrettyPrinter()
					             .writeValueAsString(jsonMap);
		} catch (JsonProcessingException je) {
			System.out.println(je.getMessage());
		}
		return jsonString;
	}
	
	@Override
	public String NameCheck(String name) {
		int nameCheck = userDao.nicknameCheck(name);
		ObjectMapper objectMapper = new ObjectMapper();
		
		Map<String, String> jsonMap = new HashMap<>();
		
		if (nameCheck == 0) {
			jsonMap.put("NameCheckMsg", "NameOk");
		} else {
			jsonMap.put("NameCheckMsg", "NameFail");
		}
		String jsonString = "";
		
		try {
			// writerWithDefaultPrettyPrinter(): 들여쓰기랑 엔터값이 포함하여 시인성이 높은 형태로 데이터를 써주는 writer
			jsonString = objectMapper.writerWithDefaultPrettyPrinter()
					             .writeValueAsString(jsonMap);
		} catch (JsonProcessingException je) {
			System.out.println(je.getMessage());
		}
		return jsonString;
	}
}
