package com.plantynet.service;

import com.plantynet.domain.ManagerVO;
import com.plantynet.dto.EditPasswordDTO;
import com.plantynet.dto.LoginDTO;

public interface ManagerService {
	
	  public ManagerVO login(LoginDTO dto) throws Exception;
	  
	  public void editPassword(EditPasswordDTO dto)throws Exception;

	  public ManagerVO checkManager(EditPasswordDTO dto);
}
