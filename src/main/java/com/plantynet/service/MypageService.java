package com.plantynet.service;

import com.plantynet.domain.ManagerVO;
import com.plantynet.dto.EditPasswordDTO;
import com.plantynet.dto.LoginDTO;

public interface MypageService {
	
	public ManagerVO editPassword(EditPasswordDTO dto) throws Exception;
}
