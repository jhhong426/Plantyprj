package com.plantynet.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.plantynet.domain.CmplVO;
import com.plantynet.domain.NotVO;

@Repository  // 이게 있어야 데이터를 반환할 수 있다.
public class QuestDAOImpl implements QuestDAO {
	
	@Inject
	private SqlSession sqlSession;   // 마이바티스를 이용하기 위한 기본적인 자바 인터페이스
	private static final String namespace = "com.plantynet.mapper.QuestMapper";
	
	@Override
	public List<NotVO> questNotSelect() {   // 미처리 VO의 데이터를 가져다 mapper와 연동시켜 select
		return  sqlSession.selectList(namespace+".quest_not");
	}
	
	@Override
	public List<CmplVO> questCmplSelect() { // 처리 VO
		return  sqlSession.selectList(namespace+".quest_cmpl");
	}

}