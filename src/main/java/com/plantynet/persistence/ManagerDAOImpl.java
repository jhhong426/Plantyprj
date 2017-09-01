package com.plantynet.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.plantynet.domain.ManagerVO;
import com.plantynet.dto.LoginDTO;

@Repository
public class ManagerDAOImpl implements ManagerDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace ="com.plantynet.mapper.ManagerMapper";	

	@Override
	public ManagerVO login(LoginDTO dto) throws Exception {
		
		return session.selectOne(namespace + ".login", dto);
	}


}
