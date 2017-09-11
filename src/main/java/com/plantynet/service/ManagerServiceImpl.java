
package com.plantynet.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantynet.domain.EditPasswordDTO;
import com.plantynet.domain.LoginDTO;
import com.plantynet.domain.ManagerVO;
import com.plantynet.persistence.ManagerDAO;

@Service
public class ManagerServiceImpl implements ManagerService {
	
	@Autowired
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
	
	 public List<ManagerVO> managerSelect() {
	 	return dao.managerSelect();
	}
	
}

