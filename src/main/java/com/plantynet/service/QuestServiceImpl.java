package com.plantynet.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantynet.domain.ProhibitVO;
import com.plantynet.domain.QuestDoneVO;
import com.plantynet.domain.QuestYetVO;
import com.plantynet.persistence.QuestDAO;


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
	public List<QuestYetVO> questAnswerSelect(int quest_no) throws Exception {
		return questDao.questAnswerSelect(quest_no);
	}
	
	public void insert(QuestDoneVO doneVO) {
		questDao.insert(doneVO);
	};
	
	public void update(Integer quest_no) {
		questDao.update(quest_no);
	};
	
	@Override
	public List<QuestDoneVO> questResultSelect(int quest_no) throws Exception {
		return questDao.questResultSelect(quest_no);
	}
}