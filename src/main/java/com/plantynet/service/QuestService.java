package com.plantynet.service;

import java.util.List;

import com.plantynet.domain.QuestDoneVO;
import com.plantynet.domain.QuestYetVO;

/* 원래방식
public class QuestService {
	
	List<QuestYetVO> questYetVO;
	
	List<QuestDoneVO> questDoneVO;
	
} */

public interface QuestService {
	
	public List<QuestYetVO> questYetSelect() throws Exception;
	
	public List<QuestDoneVO> questDoneSelect() throws Exception;
	
	public QuestYetVO questAnswerSelect(Integer quest_no) throws Exception;
}
