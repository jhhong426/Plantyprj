package com.plantynet.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plantynet.domain.MemberVO;
import com.plantynet.domain.QuestYetVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.plantynet.mapper.MemberMapper";

	@Override
	public List<MemberVO> memberList() {
		
		return sqlSession.selectList(namespace + ".selectAll");
	}
	
	@Override
	public MemberVO getMember(Integer mber_no) {
		
		return sqlSession.selectOne(namespace + ".selectOne", mber_no);
	}


	@Override
	public void modifyMember(MemberVO memberVO) {
		
		sqlSession.update(namespace + ".update", memberVO);
		
	}

	@Override
	public void deleteMember(Integer mber_no) {
		
		sqlSession.delete(namespace + ".delete", mber_no);
		
	}
}
