package com.plantynet.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AuthDAOImpl implements AuthDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace ="com.plantynet.mapper.AuthMapper";	
	
	@Override
	public String getSuperPassword() {
		
		return null;
	}
	
	@Override
	public String getPassword(Integer mngr_no) {

		return session.selectOne(namespace + ".getPassword", mngr_no);
	}

	

	
}
