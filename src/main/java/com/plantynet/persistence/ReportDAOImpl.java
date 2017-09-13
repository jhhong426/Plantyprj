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
		@Override
		public ReportDoneVO getReportDonePick(int report_no) {
			return sqlSession.selectOne(namespace+".reportDonePick",report_no); 
		}
		
		@Override
		public ReportYetVO getReportYetPick(int report_no) {
			return sqlSession.selectOne(namespace+".reportYetPick",report_no); 
		}
		@Override
		public void answerInsert(ReportDoneVO vo) {
				sqlSession.insert(namespace+".answerInsert",vo); 
		}
		
		@Override
		public void answerUpdate(ReportDoneVO vo) {
			sqlSession.update(namespace+".answerUpdate",vo); 
		}
		
		@Override
		public void reportPlus(ReportDoneVO vo) {
			sqlSession.update(namespace+".reportPlus",vo); 
		}
		
}
