package com.plantynet.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.plantynet.domain.EditPasswordDTO;
import com.plantynet.persistence.MypageDAO;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Inject
	private MypageDAO dao;
	

	@Override
	public void editPassword(EditPasswordDTO dto) throws Exception {
		
		dao.editPassword(dto);
	}

	
}
