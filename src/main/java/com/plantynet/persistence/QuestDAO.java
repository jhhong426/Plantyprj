package com.plantynet.persistence;

import java.util.List;
import java.util.Map;

import com.plantynet.domain.CmplVO;
import com.plantynet.domain.NotVO;

public interface QuestDAO {
	List<NotVO> questNotSelect();     // 미처리 VO 연결
	List<CmplVO> questCmplSelect();   // 처리 VO 연결
}
