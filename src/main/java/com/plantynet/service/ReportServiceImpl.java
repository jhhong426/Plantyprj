package com.plantynet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantynet.domain.ReportDoneVO;
import com.plantynet.domain.ReportYetVO;
import com.plantynet.persistence.ReportDAO;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	ReportDAO reportDAO;
	
	public List<ReportYetVO> getReportYet(){
		return reportDAO.getReportYet();
	}
	
	public List<ReportDoneVO> getReportDone(){
		return reportDAO.getReportDone();
	}
}
