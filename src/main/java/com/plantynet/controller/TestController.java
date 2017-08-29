package com.plantynet.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.plantynet.domain.TestPersonVO;
import com.plantynet.persistence.TestPersonDAO;


@Controller
public class TestController {
	
	@Autowired
	TestPersonDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Model model) {
		logger.info("connect test page");
		List<TestPersonVO> voList = dao.getPerson();
		model.addAttribute("vo",voList);
		return "test2";
	}
	
}
