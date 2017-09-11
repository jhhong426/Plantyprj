package com.plantynet.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantynet.domain.ProhibitVO;
import com.plantynet.domain.QuestDoneVO;
import com.plantynet.domain.QuestYetVO;
import com.plantynet.persistence.QuestDAO;

/* 원래방식
@Service
public class QuestServiceImpl{ 
	@Autowired
	private QuestDAO dao;
	
	public List<QuestYetVO> questNotSelect() throws Exception {
		return dao.questYetSelect();
	}
	
	public List<QuestDoneVO> questCmplSelect() throws Exception {
		return dao.questDoneSelect();
	}
} */


@Service
public class QuestServiceImpl implements QuestService {
	
	@Autowired
	private QuestDAO questDao;
	
	@Override
	public List<QuestYetVO> questYetSelect() throws Exception {
		return questDao.questYetSelect();
	}

	@Override
	public List<QuestDoneVO> questDoneSelect() throws Exception {
		return questDao.questDoneSelect();
	}
	
	@Override
	public QuestYetVO questAnswerSelect(Integer quest_no) throws Exception {
		return questDao.questAnswerSelect(quest_no);
	}
}