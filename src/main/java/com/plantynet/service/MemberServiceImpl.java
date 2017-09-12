package com.plantynet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantynet.domain.MemberVO;
import com.plantynet.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public List<MemberVO> memberList() throws Exception {
		
		return memberDAO.memberList();
	}
	
	@Override
	public MemberVO getMember(Integer mber_no) throws Exception {
		
		return memberDAO.getMember(mber_no);
	}

	@Override
	public void modifyMember(MemberVO memberVO) throws Exception {

		memberDAO.modifyMember(memberVO);
		
	}

	@Override
	public void deleteMember(Integer mber_no) throws Exception {

		memberDAO.deleteMember(mber_no);
		
	}

}
