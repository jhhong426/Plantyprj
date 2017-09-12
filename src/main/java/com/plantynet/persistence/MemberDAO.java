package com.plantynet.persistence;

import java.util.List;

import com.plantynet.domain.MemberVO;

public interface MemberDAO {

	public List<MemberVO> memberList();
	
	public MemberVO getMember(Integer mber_no);
	
	public void modifyMember(MemberVO memberVO);
	
	public void deleteMember(Integer mber_no);

}
