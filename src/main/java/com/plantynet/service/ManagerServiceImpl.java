
package com.plantynet.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.plantynet.domain.ManagerVO;
import com.plantynet.dto.EditPasswordDTO;
import com.plantynet.dto.LoginDTO;
import com.plantynet.persistence.ManagerDAO;

@Service
public class ManagerServiceImpl implements ManagerService {
	
	@Inject
	private ManagerDAO dao;

	@Override
	public ManagerVO login(LoginDTO dto) throws Exception {

	    return dao.login(dto);
	}
	  

//	@Override
//	public void editPassword(EditPasswordDTO dto) throws Exception {
//		
//		dao.editPassword(dto);
//	}

//	@Override
//	public ManagerVO checkManager(EditPasswordDTO dto) {
//		
//		return dao.checkManager(dto);
//	}

	
}

