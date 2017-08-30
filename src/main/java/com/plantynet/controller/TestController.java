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
import org.springframework.web.bind.annotation.RequestParam;

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
		return "test";
	}
	
	@RequestMapping(value = "/prohibit_delete", method = RequestMethod.POST)
	public String prohibit_delete(@RequestParam("word")String word) {
		logger.info("prohibit_delete");
		System.out.println("삭제 쿼리 실행 : "+ word);
		return "redirect:/test";
	}
	
	@RequestMapping(value = "/prohibit_insert", method = RequestMethod.POST)
	public String prohibit_insert(@RequestParam("word")String word) {
		logger.info("prohibit_insert");
		System.out.println("금칙어 삽입 ("+ word +" )실행");
		return "redirect:/test";
	}
}
