package com.plantynet.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.plantynet.domain.ProhibitVO;


@Repository
public class ProhibitDAOImpl implements ProhibitDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.plantynet.mapper.ProhibitMapper";

	@Override
	public List<ProhibitVO> getWord() {
		return sqlSession.selectList(namespace+".prohibitSelect");
	}
	
	@Override
	public void insert(ProhibitVO prohibitVO) {
		sqlSession.insert(namespace+".prohibit_insert",prohibitVO);
	}

	@Override
	public void delete(String word) {
		sqlSession.update(namespace+".prohibit_delete",word);
	}
}
