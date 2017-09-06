package com.plantynet.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.plantynet.domain.ManagerVO;
import com.plantynet.dto.EditPasswordDTO;
import com.plantynet.service.ManagerService;

@Controller
public class MyPageController {
	
	@Inject
	private ManagerService service;

	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public void myPageGet() throws Exception {
		
	}
	
	@RequestMapping(value = "/myPage", method = RequestMethod.POST)
	public void myPagePost() throws Exception {
		
	}
	
	@RequestMapping(value = "/editPW", method = RequestMethod.GET)
	public void editPWGet() throws Exception {
		
	}
	
	@RequestMapping(value = "/editPW", method = RequestMethod.POST)
	public void editPWPost(EditPasswordDTO dto, HttpServletResponse response, HttpSession session, Model model) throws Exception {
		
		
		ManagerVO vo = service.checkManager(dto);
		
		if (vo == null) {
			
			response.sendRedirect("/ask/failEditPW");
			
		}
		else {
			
			service.editPassword(dto);
			
			response.sendRedirect("/ask/myPage");
			
		}
	}
}
