package com.bit.devops12.poro.controller;

import com.bit.devops12.poro.dto.MainCriteria;
import com.bit.devops12.poro.dto.UserDto;
import com.bit.devops12.poro.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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
	
	@PostMapping("/nicknameCheck.do")
	@ResponseBody
	public String nicknameCheck(UserDto userDto) {
		System.out.println(userService.nicknameCheck(userDto.getNickname()));
		return userService.nicknameCheck(userDto.getNickname());
	}
	
	@PostMapping("/nameCheck.do")
	@ResponseBody
	public String nameCheck(UserDto userDto) {
		System.out.println(userService.nameCheck(userDto.getName()));
		return userService.nameCheck(userDto.getName());
	}
	
	@PostMapping("/join.do")
	public String join(UserDto userDto , MultipartFile uploadFiles) {
		userService.join(userDto);
		
		return "user/login";
	}
	
	@PostMapping("/login.do")
	public String login(UserDto userDto, Model model, HttpSession session) {
		try {
			UserDto loginUser = userService.login(userDto);
			
			loginUser.setPassword("");
			
			session.setAttribute("loginUser", loginUser);
			
			return "redirect:/main/main.do";
		} catch (Exception e) {
			model.addAttribute("loginFailMsg", e.getMessage());
			
			return "user/login";
		}
	}
	
	
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		// 세션에 있는 내용 모두 초기화
		session.invalidate();
		
		return "redirect:/user/login.do";
	}
	
	@RequestMapping("/settings.do")
	public String settingView() {
		return "/user/settings";
	}
}
