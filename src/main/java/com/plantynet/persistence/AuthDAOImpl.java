package com.plantynet.persistence;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AuthDAOImpl implements AuthDAO {

	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "com.plantynet.mapper.AuthMapper";
	
	@Override
	public String getSuperPassword() throws Exception {
		return sqlSession.selectOne(namespace+".getSuperPassword");
	}
  
  @Override
	public String getPassword(Integer mngr_no) {

		return sqlSession.selectOne(namespace + ".getPassword", mngr_no);
	}
}


