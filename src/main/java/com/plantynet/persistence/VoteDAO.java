package com.plantynet.persistence;

import java.util.List;

import com.plantynet.domain.SurResultVO;
import com.plantynet.domain.SurveyVO;
import com.plantynet.domain.VoteVO;

public interface VoteDAO {
	
	public List<SurveyVO> getAllSurvey() throws Exception;							// 전체 질문 글을 가져오는 메소드
	
	public List<VoteVO> getAllVotes() throws Exception;								// 전체 투표를 가져오는 메소드
	
	public void blindSurvy(Integer survey_no) throws Exception;						// 해당 질문 글을 블라인드 처리 하는 메소드
	
	public void delSurvy(Integer survey_no) throws Exception;						// 해당 질문 글을 삭제하는 메소드
	
	public SurveyVO getSurvey(Integer survey_no) throws Exception;					// 하나의 질문 글을 가져오는 메소드
	
	public SurResultVO getSurResult(Integer survey_no) throws Exception;				// 해당 질문 글의 결과 통계룰 가져오는 메소드
	
}
