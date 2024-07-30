package com.bit.devops12.poro.controller;

import com.bit.devops12.poro.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member")
public class MemberController {
	private MemberService memberService;

	
}
