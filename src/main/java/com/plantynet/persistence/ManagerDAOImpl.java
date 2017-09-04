package com.plantynet.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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
	public void keepLogin(String mngr_id, String sessionId, Date next) {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("mngr_id", mngr_id);
		paramMap.put("sessionId", sessionId);
		paramMap.put("next", next);
	    
		session.update(namespace+".keepLogin", paramMap);
	    
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
