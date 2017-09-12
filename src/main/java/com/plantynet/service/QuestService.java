package com.plantynet.service;

import java.util.List;

import com.plantynet.domain.QuestDoneVO;
import com.plantynet.domain.QuestYetVO;


public interface QuestService {
	
	public List<QuestYetVO> questYetSelect() throws Exception;
	
	public List<QuestDoneVO> questDoneSelect() throws Exception;
	
	public List<QuestYetVO> questAnswerSelect(int quest_no) throws Exception;
	
	void insert(QuestDoneVO doneVO);
	
	void update(Integer quest_no);
	
	public List<QuestDoneVO> questResultSelect(int quest_no) throws Exception;
}
