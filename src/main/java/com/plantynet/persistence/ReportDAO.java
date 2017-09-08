package com.plantynet.persistence;

import java.util.List;

import com.plantynet.domain.ReportDoneVO;
import com.plantynet.domain.ReportYetVO;

public interface ReportDAO {
		public List<ReportYetVO> getReportYet(); 
		public List<ReportDoneVO> getReportDone();
}
