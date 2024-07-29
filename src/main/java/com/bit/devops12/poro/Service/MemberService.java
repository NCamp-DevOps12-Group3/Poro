package com.bit.devops12.poro.Service;

import com.bit.devops12.poro.Dto.MemberDto;

import java.util.List;

public interface MemberService {
	void join(MemberDto memberDto);
	
	List<MemberDto> getMembers();
	
	MemberDto getMemberByUsername(MemberDto memberDto);
}
