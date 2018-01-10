package com.plantynet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ConditionStatController {
	
	@RequestMapping(value = "/stat", method = RequestMethod.GET)
	public void stat(Model moodel) throws Exception{
		
		// 통계치  model에 담아
		
	}
}