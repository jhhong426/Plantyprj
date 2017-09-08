package com.plantynet.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plantynet.domain.SurResultVO;
import com.plantynet.domain.SurveyVO;
import com.plantynet.domain.VoteVO;

@Repository
public class VoteDAOImpl implements VoteDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "com.plantynet.mapper.VoteMapper";

	@Override
	public List<SurveyVO> getAllSurvey() throws Exception {
		return sqlSession.selectList(namespace+".getAllSurvey");
	}

	@Override
	public List<VoteVO> getAllVotes() throws Exception {
		return sqlSession.selectList(namespace+".getAllVotes");
	}

	@Override
	public void blindSurvy(Integer survey_no) throws Exception {
		sqlSession.update(namespace+".blindSurvy", survey_no);
	}

	@Override
	public void delSurvy(Integer survey_no) throws Exception {
		sqlSession.delete(namespace+".delSurvy", survey_no);
	}

	@Override
	public SurveyVO getSurvey(Integer survey_no) throws Exception {
		return sqlSession.selectOne(namespace+".getSurvey", survey_no);
	}

	@Override
	public SurResultVO getSurResult(Integer survey_no) throws Exception {
		return sqlSession.selectOne(namespace+".getSurResult", survey_no);
	}

}
