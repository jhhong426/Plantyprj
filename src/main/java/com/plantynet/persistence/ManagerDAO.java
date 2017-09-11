
package com.plantynet.persistence;

import java.util.List;

import com.plantynet.domain.ManagerVO;
import com.plantynet.dto.EditPasswordDTO;
import com.plantynet.dto.LoginDTO;

public interface ManagerDAO {
	
	public ManagerVO login(LoginDTO dto)throws Exception;

//	public void editPassword(EditPasswordDTO dto)throws Exception;

	
	List<ManagerVO> managerSelect();
}

