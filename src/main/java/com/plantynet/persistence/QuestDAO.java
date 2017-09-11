package com.plantynet.persistence;

import java.util.List;

import com.plantynet.domain.QuestDoneVO;
import com.plantynet.domain.QuestYetVO;

/* 원래방식
public interface QuestDAO {
	
	List<QuestYetVO> questYetSelect(); // 미처리 VO 연결
	
	List<QuestDoneVO> questDoneSelect(); // 처리 VO 연결
}*/


public interface QuestDAO {
	
	public List<QuestYetVO> questYetSelect() throws Exception;						
	
	public List<QuestDoneVO> questDoneSelect() throws Exception;
	
	public QuestYetVO questAnswerSelect(Integer quest_no) throws Exception;	
}

