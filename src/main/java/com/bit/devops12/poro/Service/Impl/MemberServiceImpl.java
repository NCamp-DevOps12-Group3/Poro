package com.bit.devops12.poro.service.impl;

import com.bit.devops12.poro.dto.MemberDto;
import com.bit.devops12.poro.service.MemberService;

import java.util.List;

public class MemberServiceImpl implements MemberService {
	@Override
	public void join(MemberDto memberDto) {
	
	}
	
	@Override
	public List<MemberDto> getMembers() {
		return List.of();
	}
	
	@Override
	public MemberDto getMemberByUsername(MemberDto memberDto) {
		return null;
	}
}
