package com.plantynet.service;

import java.util.List;

import com.plantynet.domain.SurResultVO;
import com.plantynet.domain.SurveyVO;
import com.plantynet.domain.VoteVO;

public interface VoteService {
	
	public List<SurveyVO> getAllSurvey() throws Exception;
	
	public List<VoteVO> getAllVotes() throws Exception;
	
	public void blindSurvy(Integer survey_no) throws Exception;
	
	public void delSurvy(Integer survey_no) throws Exception;
	
	public SurveyVO getSurvey(Integer survey_no) throws Exception;
	
	public SurResultVO getSurResult(Integer survey_no) throws Exception;
	
}
