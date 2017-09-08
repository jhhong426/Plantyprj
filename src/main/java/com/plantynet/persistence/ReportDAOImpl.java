package com.plantynet.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.plantynet.domain.ReportDoneVO;
import com.plantynet.domain.ReportYetVO;


@Repository
public class ReportDAOImpl implements ReportDAO {		
	
	@Inject
	private SqlSession sqlSession;
		
		private static final String namespace = "com.plantynet.mapper.ReportMapper";
		
		
		@Override
		public List<ReportYetVO> getReportYet(){
			return sqlSession.selectList(namespace+".reportYetSelect");
		} 
		@Override
		public List<ReportDoneVO> getReportDone(){
			return sqlSession.selectList(namespace+".reportDoneSelect"); 
		}
}
