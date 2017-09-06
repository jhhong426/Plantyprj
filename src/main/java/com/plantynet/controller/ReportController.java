package com.plantynet.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class ReportController {
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);

	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public String reportPage(Model model) {
		logger.info("connect report page");
		return "report";  // prohibit.jsp 뷰 로 이동 
	}
	
	
}
