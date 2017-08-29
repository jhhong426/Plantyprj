package com.plantynet.persistence;

import java.util.List;
import java.util.Map;

import com.plantynet.domain.TestPersonVO;

public interface TestPersonDAO {
	List<TestPersonVO> getPerson();
	void insertPerson(TestPersonVO vo);
	void insertPerson2(Map<String, Object> voHash);
	String getTime();
}
