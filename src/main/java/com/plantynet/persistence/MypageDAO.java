package com.plantynet.persistence;

import com.plantynet.domain.EditPasswordDTO;

public interface MypageDAO {

	public void editPassword(EditPasswordDTO dto)throws Exception;
	
}
