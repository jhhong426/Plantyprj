
package com.plantynet.persistence;

import java.util.List;

import com.plantynet.domain.EditPasswordDTO;
import com.plantynet.domain.LoginDTO;
import com.plantynet.domain.ManagerVO;

public interface ManagerDAO {
	
	public ManagerVO login(LoginDTO dto)throws Exception;

//	public void editPassword(EditPasswordDTO dto)throws Exception;

	
	List<ManagerVO> managerSelect();
}

