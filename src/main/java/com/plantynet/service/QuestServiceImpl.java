package com.plantynet.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.plantynet.domain.CmplVO;
import com.plantynet.domain.NotVO;
import com.plantynet.persistence.QuestDAO;

@Service
public class QuestServiceImpl { 
	@Inject
	private QuestDAO dao;
	private SqlSession sqlSession;
	
	public List<NotVO> questNotSelect() throws Exception {
		return dao.questNotSelect();
	}
	
	public List<CmplVO> questCmplSelect() throws Exception {
		return dao.questCmplSelect();
	}
}

