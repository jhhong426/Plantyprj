package com.plantynet.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.plantynet.domain.TestPersonVO;

@Repository
public class TestPersonDAOImpl implements TestPersonDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.plantynet.mapper.TestMapper";
	
	@Override
	public List<TestPersonVO> getPerson() {
		return  sqlSession.selectList(namespace+".testSelect");
	}

	@Override
	public void insertPerson(TestPersonVO vo) {
		sqlSession.insert(namespace+".testInsert", vo );
	}
	
	@Override
	public void insertPerson2(Map<String,Object> vo) {
		sqlSession.insert(namespace+".testInsert2", vo );
	}
	
	
	
	@Override
	public String getTime(){
		return sqlSession.selectOne(namespace+".getTime");
	}
	

}
