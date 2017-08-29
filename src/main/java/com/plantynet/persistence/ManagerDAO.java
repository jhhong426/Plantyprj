package com.plantynet.persistence;

import java.util.Date;

import com.plantynet.domain.ManagerVO;
import com.plantynet.dto.LoginDTO;

public interface ManagerDAO {
	
	public ManagerVO login(LoginDTO dto)throws Exception;

//	public void keepLogin(String mngr_id, String sessionId, Date next);
//	  
//	public ManagerVO checkManagerWithSessionKey(String value);	
	
}
