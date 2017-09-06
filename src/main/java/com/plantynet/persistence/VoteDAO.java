package com.plantynet.persistence;

import java.util.List;

import com.plantynet.domain.SurResultVO;
import com.plantynet.domain.SurveyVO;
import com.plantynet.domain.VoteVO;

public interface VoteDAO {
	
	public List<SurveyVO> getAllSurvey();
	
	public List<VoteVO> getAllVotes();
	
	public void blindSurvy(Integer survey_no);
	
	public void delSurvy(Integer survey_no);
	
	public SurveyVO getSurvey(Integer survey_no);
	
	public SurResultVO getSurResult(Integer survey_no);
	
}
