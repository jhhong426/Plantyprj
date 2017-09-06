package com.plantynet.persistence;

import java.util.List;

import com.plantynet.domain.ProhibitVO;

public interface ProhibitDAO {
	List<ProhibitVO> getWord();
	void insert(ProhibitVO prohibitVO);
	void delete(String word);
}
