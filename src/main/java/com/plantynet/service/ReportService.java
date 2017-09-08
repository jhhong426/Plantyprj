package com.plantynet.service;

import java.util.List;

import com.plantynet.domain.ReportDoneVO;
import com.plantynet.domain.ReportYetVO;

public interface ReportService {
	public List<ReportYetVO> getReportYet();
	public List<ReportDoneVO> getReportDone();
}
