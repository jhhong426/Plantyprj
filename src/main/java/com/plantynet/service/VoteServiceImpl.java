package com.plantynet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantynet.domain.SurResultVO;
import com.plantynet.domain.SurveyVO;
import com.plantynet.domain.VoteVO;
import com.plantynet.persistence.AuthDAO;
import com.plantynet.persistence.VoteDAO;

@Service
public class VoteServiceImpl implements VoteService {
	
	@Autowired
	private VoteDAO voteDao;
	
	@Override
	public List<SurveyVO> getAllSurvey() throws Exception {
		return voteDao.getAllSurvey();
	}

	@Override
	public List<VoteVO> getAllVotes() throws Exception {
		return voteDao.getAllVotes();
	}

	@Override
	public void blindSurvy(Integer survey_no) throws Exception {
		voteDao.blindSurvy(survey_no);
	}

	@Override
	public void delSurvy(Integer survey_no) throws Exception {
		voteDao.delSurvy(survey_no);
	}

	@Override
	public SurveyVO getSurvey(Integer survey_no) throws Exception {
		return voteDao.getSurvey(survey_no);
	}

	@Override
	public List<SurResultVO> getSurResult(Integer survey_no) throws Exception {
		return voteDao.getSurResult(survey_no);
	}

}
