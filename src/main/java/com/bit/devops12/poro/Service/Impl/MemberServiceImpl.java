package com.bit.devops12.poro.Service.Impl;

import com.bit.devops12.poro.Dto.MemberDto;
import com.bit.devops12.poro.Service.MemberService;

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
