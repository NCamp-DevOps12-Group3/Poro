package com.bit.devops12.poro.service.impl;

import com.bit.devops12.poro.common.FileUtils;
import com.bit.devops12.poro.dao.UserDao;
import com.bit.devops12.poro.dto.FileDto;
import com.bit.devops12.poro.dto.UserDto;
import com.bit.devops12.poro.service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.*;

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
	public String nicknameCheck(String nickname) {
		int nicknameCheck = userDao.nicknameCheck(nickname);
		ObjectMapper objectMapper = new ObjectMapper();
		
		Map<String, String> jsonMap = new HashMap<>();
		
		if (nicknameCheck == 0) {
			jsonMap.put("nicknameCheckMsg", "nicknameOk");
		} else {
			jsonMap.put("nicknameCheckMsg", "nicknameFail");
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
	public String nameCheck(String name) {
		int nameCheck = userDao.nameCheck(name);
		ObjectMapper objectMapper = new ObjectMapper();
		
		Map<String, String> jsonMap = new HashMap<>();
		
		if (nameCheck == 0) {
			jsonMap.put("nameCheckMsg", "nameOk");
		} else {
			jsonMap.put("nameCheckMsg", "nameFail");
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
	public UserDto login(UserDto userDto) {
		int emailCheck = userDao.emailCheck(userDto.getEmail());
		
		if(emailCheck == 0)
			throw new RuntimeException("emailNotExist");
		
		UserDto loginUser = userDao.login(userDto);
		
		if(loginUser == null)
			throw new RuntimeException("wrongPassword");
		
		return loginUser;
	}
	
	@Override
	public void modify(UserDto userDto, MultipartFile uploadFiles) {
		List<FileDto> fileDtoList = new ArrayList<>();
		if(uploadFiles != null) {
			String attachPath = "C:/tmp/upload/" + userDto.getEmail();
			
			File directory = new File(attachPath);
			
			if (!directory.exists()) {
				directory.mkdirs();
			}
			
			
				if(uploadFiles != null) {
					FileDto fileDto = FileUtils.parserFileInfo(uploadFiles, attachPath);
					
					fileDtoList.add(fileDto);
				}
			
		}
		
		
		
		
		
		
		
		userDao.modify(userDto, (MultipartFile) fileDtoList);
	}
}
