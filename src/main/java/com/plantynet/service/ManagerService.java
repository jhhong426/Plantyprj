package com.plantynet.service;

import java.util.Date;

import com.plantynet.domain.ManagerVO;
import com.plantynet.dto.EditPasswordDTO;
import com.plantynet.dto.LoginDTO;

public interface ManagerService {
	
	  public ManagerVO login(LoginDTO dto) throws Exception;

	  public void keepLogin(String mngr_id, String sessionId, Date next)throws Exception;
	  
	  public void editPassword(EditPasswordDTO dto)throws Exception;

	  public ManagerVO checkManager(EditPasswordDTO dto);
}
