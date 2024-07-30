package com.bit.devops12.poro.controller;

import com.bit.devops12.poro.dto.UserDto;
import com.bit.devops12.poro.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user")
public class UserController {
	private UserService userService;
	
	@Autowired
	public UserController(UserService userService) {
		this.userService = userService;
	}
	
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String joinView() {
		return "user/join";
	}
	
	@GetMapping("/login.do")
	public String loginView() {
		return "user/login";
	}
	
	
	@PostMapping("/emailCheck.do")
	@ResponseBody
	public String emailCheck(UserDto userDto) {
		System.out.println(userService.emailCheck(userDto.getEmail()));
		return userService.emailCheck(userDto.getEmail());
	}
	
	@PostMapping("/NicknameCheck.do")
	@ResponseBody
	public String NicknameCheck(UserDto userDto) {
		System.out.println(userService.NicknameCheck(userDto.getNickname()));
		return userService.NicknameCheck(userDto.getNickname());
	}
	
	@PostMapping("/NameCheck.do")
	@ResponseBody
	public String NameCheck(UserDto userDto) {
		System.out.println(userService.NameCheck(userDto.getName()));
		return userService.NameCheck(userDto.getName());
	}
	
	@PostMapping("/join.do")
	public String join(UserDto userDto) {
		userService.join(userDto);
		return "user/login.do";
	}
}
