package com.plantynet.persistence;

import java.util.Date;

import com.plantynet.domain.ManagerVO;
import com.plantynet.dto.LoginDTO;

public interface ManagerDAO {
	
	public ManagerVO login(LoginDTO dto)throws Exception;


	
}
