package com.plantynet.service;

import java.util.List;

import com.plantynet.domain.ProhibitVO;

public interface ProhibitService {
	List<ProhibitVO> getWord();
	void insert(ProhibitVO prohibitVO);
	void delete(String word);
}
