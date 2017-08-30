package com.plantynet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class MyPageController {

	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public void myPageGet() throws Exception {
		
		
	}
	
	@RequestMapping(value = "/myPage", method = RequestMethod.POST)
	public void myPagePost() throws Exception {
		
	}
}
