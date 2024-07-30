package com.bit.devops12.poro.service;

import com.bit.devops12.poro.dto.MemberDto;

import java.util.List;

public interface MemberService {
	void join(MemberDto memberDto);
	
	List<MemberDto> getMembers();
	
	MemberDto getMemberByUsername(MemberDto memberDto);
}
