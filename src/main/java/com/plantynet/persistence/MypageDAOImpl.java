package com.plantynet.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.plantynet.domain.EditPasswordDTO;

@Repository
public class MypageDAOImpl implements MypageDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace ="com.plantynet.mapper.ManagerMapper";	
	
	@Override
	public void editPassword(EditPasswordDTO dto) throws Exception {
		
		session.update(namespace + ".update", dto);
	}
}
