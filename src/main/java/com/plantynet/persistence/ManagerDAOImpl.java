package com.plantynet.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.plantynet.domain.ManagerVO;
import com.plantynet.dto.EditPasswordDTO;
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
	
	@Override
	public void editPassword(EditPasswordDTO dto) throws Exception {
		
		session.update(namespace + ".update", dto);
	}

	@Override
	public ManagerVO checkManager(EditPasswordDTO dto) {

		return session.selectOne(namespace + ".check", dto);
	}


}
