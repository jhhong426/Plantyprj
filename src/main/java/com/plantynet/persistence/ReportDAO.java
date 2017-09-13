package com.plantynet.persistence;

import java.util.List;

import com.plantynet.domain.ReportDoneVO;
import com.plantynet.domain.ReportYetVO;

public interface ReportDAO {
		public List<ReportYetVO> getReportYet(); 
		public List<ReportDoneVO> getReportDone();
		public ReportDoneVO getReportDonePick(int report_no);
		public ReportYetVO getReportYetPick(int report_no);
		public void answerInsert(ReportDoneVO vo);
		public void answerUpdate(ReportDoneVO vo);
		public void reportPlus(ReportDoneVO vo);
}
