package com.plantynet.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.plantynet.domain.ProhibitVO;
import com.plantynet.persistence.ProhibitDAO;

@Service
public class ProhibitServiceImpl implements ProhibitService {
	
	@Inject
	ProhibitDAO prohibitDao;
	
	public List<ProhibitVO> getWord(){
		return prohibitDao.getWord();
	};
	
	public void insert(ProhibitVO prohibitVO) {
		prohibitDao.insert(prohibitVO);
	};
	
	public void delete(String word) {
		prohibitDao.delete(word);
	};
}
