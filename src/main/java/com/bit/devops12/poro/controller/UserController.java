package com.bit.devops12.poro.controller;

import com.bit.devops12.poro.dto.UserDto;
import com.bit.devops12.poro.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public String join(UserDto userDto ) {
		userService.join(userDto);
		return "user/login";
	}

	@PostMapping("/login.do")
	public String login( UserDto userDto, Model model, HttpSession session) {
		try {
			UserDto loginUser = userService.login(userDto);
			loginUser.setPassword("");

			session.setAttribute("loginUser", loginUser);
			userDto.setPassword("");
			session.setAttribute("userDto", userDto);
			System.out.println(loginUser);


			return "redirect:/main/main.do";
//			return "user/settings";
		} catch (Exception e) {
			model.addAttribute("loginFailMsg", e.getMessage());
			System.out.println("fail to login");
			return "user/login";
		}
	}


	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		// 세션에 있는 내용 모두 초기화
		session.invalidate();

		return "redirect:/user/login.do";
	}

	@GetMapping("/settings.do")
	public String settingView(HttpSession session, Model model) {
		UserDto userDto = (UserDto) session.getAttribute("loginUser");
		// userService에서 사용자의 역사 로그를 가져옴
		// historylog 메서드는 사용자 DTO를 인자로 받아서 해당 사용자의 역사 로그를 반환
		// 사용자 DTO를 기반으로 historylog를 호출하고 결과를 처리
		List<UserDto> historylog = userService.historylog(userDto);
		UserDto sessionn = (UserDto) session.getAttribute("loginUser");
		System.out.println(sessionn);
		System.out.println(historylog);
		// 조회된 역사 로그를 모델에 추가
		model.addAttribute("historylog", historylog);

		// '/user/settings' 뷰를 반환
		// 이 뷰는 사용자의 설정 페이지를 렌더링하는 템플릿 파일
		return "/user/settings";
	}




	@PostMapping("/modify.do")
	public String modify(UserDto userDto, @RequestParam("uploadFiles") MultipartFile uploadFiles, HttpSession session) {
		userService.modify(userDto,uploadFiles);
		session.setAttribute("loginUser", userDto);

		return "redirect:/user/settings.dodo";
	}

	@GetMapping("/settings.dodo")
	public String settings(HttpSession session, Model model) {
		// 세션에서 수정된 사용자 정보 가져오기
		UserDto modifiedUser = (UserDto) session.getAttribute("loginUser");

		if (modifiedUser != null) {
			System.out.println(modifiedUser);
			modifiedUser = (UserDto) session.getAttribute("loginUser");
			// userService에서 사용자의 역사 로그를 가져옴
			// historylog 메서드는 사용자 DTO를 인자로 받아서 해당 사용자의 역사 로그를 반환
			// 사용자 DTO를 기반으로 historylog를 호출하고 결과를 처리
			List<UserDto> historylog = userService.historylog(modifiedUser);
			UserDto sessionn = (UserDto) session.getAttribute("loginUser");
			System.out.println(sessionn);
			System.out.println(historylog);
			// 조회된 역사 로그를 모델에 추가
			model.addAttribute("historylog", historylog);
			// 수정된 사용자 정보를 모델에 추가하여 뷰에서 사용할 수 있게 함
			model.addAttribute("loginUser", modifiedUser);
			// 세션에서 수정된 정보 제거 (옵션)
			session.removeAttribute("loginUser");
		}

		return "/user/settings";
	}

	@GetMapping("/passwordchangesChk.do")
	public String passwordchangesChkView() {
		return "/user/passwordchangesChk";
	}

	@PostMapping("/passwordchangesChk.do")
	@ResponseBody
	public String passwordchangesChk(UserDto userDto) {
		System.out.println(userService.passwordCheck(userDto.getPassword()));
		return userService.passwordCheck(userDto.getPassword());
	}

	@GetMapping("/passwordchanges.do")
	public String PasswordChanges() {
		return "user/passwordchanges";
	}

	@PostMapping("/ChangePassword.do")
	public String ChangePassword(UserDto userDto,HttpSession session) {
		userService.ChangePassword(userDto);
		session.invalidate();
		return "redirect:login.do";
	}

	@PostMapping("/delete-account.do")
	public String deleteAccount(UserDto userDto, HttpSession session) {
		userService.deleteAccount(userDto);
		session.invalidate();
		return "redirect:login.do";
	}
}