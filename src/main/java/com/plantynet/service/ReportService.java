package com.plantynet.service;

import java.util.List;

import com.plantynet.domain.ReportDoneVO;
import com.plantynet.domain.ReportYetVO;

public interface ReportService {
	public List<ReportYetVO> getReportYet();
	public List<ReportDoneVO> getReportDone();
	public ReportDoneVO getReportDonePick(int report_no);
	public ReportYetVO getReportYetPick(int report_no);
	public void answerInsert(ReportDoneVO vo);
	public void answerUpdate(ReportDoneVO vo);
	public void reportPlus(ReportDoneVO vo);
	public void reportedPlus(ReportDoneVO vo);
}
