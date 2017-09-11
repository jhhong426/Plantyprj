package com.plantynet.service;

public interface AuthService {

	public String getPassword(Integer mngr_no) throws Exception;
	
	public boolean checkSuperPassword(String inputPassword) throws Exception;
}
