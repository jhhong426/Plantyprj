package com.plantynet.service;

import java.util.List;

import com.plantynet.domain.MemberVO;

public interface MemberService {
	
	public List<MemberVO> memberList() throws Exception;

	public MemberVO getMember(Integer mber_no) throws Exception;
	
	public void modifyMember(MemberVO memberVO) throws Exception;
	
	public void deleteMember(Integer mber_no) throws Exception;

}
