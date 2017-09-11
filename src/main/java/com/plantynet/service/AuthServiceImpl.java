package com.plantynet.service;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.plantynet.persistence.AuthDAO;

@Service
public class AuthServiceImpl implements AuthService{

	@Inject
	private AuthDAO dao;
	
	
	@Override
	public String getPassword(Integer mngr_no) {
		
		return dao.getPassword(mngr_no);
	}

	@Override
	public boolean checkSuperPassword(String inputPassword) throws Exception {
		
		if(inputPassword.equals(dao.getSuperPassword())){
			return true;
		}
		else{
			return false;
		}
	}
	
}
