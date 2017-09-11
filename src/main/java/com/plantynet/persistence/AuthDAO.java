package com.plantynet.persistence;

import com.plantynet.domain.EditPasswordDTO;
import com.plantynet.domain.ManagerVO;

public interface AuthDAO {
	
	public String getSuperPassword() throws Exception;
	
	public String getPassword(Integer mngr_no);
	
}
