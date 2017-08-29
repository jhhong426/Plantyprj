package com.plantynet.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.plantynet.domain.ManagerVO;
import com.plantynet.dto.LoginDTO;
import com.plantynet.persistence.ManagerDAO;

@Service
public class ManagerServiceImpl implements ManagerService {
	
	@Inject
	private ManagerDAO dao;

	  @Override
	  public ManagerVO login(LoginDTO dto) throws Exception {

	    return dao.login(dto);
	  }
//	  
//	  @Override
//	  public void keepLogin(String mngr_id, String sessionId, Date next)
//			  throws Exception {
//	    
//	    dao.keepLogin(mngr_id, sessionId, next);
//	    
//	  }
//
//	  @Override
//	  public ManagerVO checkLoginBefore(String value) {
//	    
//	    return dao.checkManagerWithSessionKey(value);
//	  }
	
	
}
