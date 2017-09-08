package com.plantynet.persistence;

import com.plantynet.domain.ManagerVO;
import com.plantynet.dto.EditPasswordDTO;

public interface AuthDAO {
	
	public String getSuperPassword() throws Exception;
	
	public String getPassword(Integer mngr_no);
	
}
