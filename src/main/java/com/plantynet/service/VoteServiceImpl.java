package com.plantynet.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantynet.domain.SurResultDTO;
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
	
	

//	@Override
//	public List<SurResultDTO> getSurResult(Integer survey_no) throws Exception {
//		
//		List<SurResultDTO> renderList = new ArrayList<>();
//		List<SurResultVO> orginList = voteDao.getSurResult(survey_no);
//		
//		for (int i = 0; i < orginList.size()/2; i++) {
//			SurResultDTO dto = new SurResultDTO();
//			renderList.add(dto);
//		}
//				
//		for (SurResultVO vo : orginList) {
//					
//			switch (vo.getItem_no()) {
//			case "SI01":
//				if(vo.getGender().equals("남자")){
//					renderList.get(0).setItem(vo.getItem_contents());
//					renderList.get(0).setMale_score(vo.getScore());
//				}
//				else{
//					renderList.get(0).setFemale_score(vo.getScore());
//				}
//				break;
//			case "SI02":
//				if(vo.getGender().equals("남자")){
//					renderList.get(1).setItem(vo.getItem_contents());
//					renderList.get(1).setMale_score(vo.getScore());
//				}
//				else{
//					renderList.get(1).setFemale_score(vo.getScore());
//				}
//				break;
//			case "SI03":
//				if(vo.getGender().equals("남자")){
//					renderList.get(2).setItem(vo.getItem_contents());
//					renderList.get(2).setMale_score(vo.getScore());
//				}
//				else{
//					renderList.get(2).setFemale_score(vo.getScore());
//				}
//				break;
//			case "SI04":
//				if(vo.getGender().equals("남자")){
//					renderList.get(3).setItem(vo.getItem_contents());
//					renderList.get(3).setMale_score(vo.getScore());
//				}
//				else{
//					renderList.get(3).setFemale_score(vo.getScore());
//				}
//				break;
//
//			default:
//				break;
//			}
//		}	
//	
//		return renderList;
//	}

}
