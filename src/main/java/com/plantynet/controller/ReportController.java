package com.plantynet.controller;

import java.io.Console;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.plantynet.domain.ReportDoneVO;
import com.plantynet.domain.ReportYetVO;
import com.plantynet.service.ReportService;



@Controller
public class ReportController {
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);
	@Inject
	ReportService reportService;
	
	
	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public String reportPage(Model model) {
		logger.info("connect report page");
		List<ReportYetVO> reportYetVO = reportService.getReportYet();
		List<ReportDoneVO> reportDoneVO = reportService.getReportDone();
		model.addAttribute("reportYetVO",reportYetVO);
		model.addAttribute("reportDoneVO",reportDoneVO);
		System.out.println(reportYetVO.toString());
		System.out.println(reportDoneVO.toString());
		return "report";  // prohibit.jsp 뷰 로 이동 
		
	}
	
	
}
