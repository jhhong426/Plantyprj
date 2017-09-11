
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
import com.plantynet.dto.LoginDTO;
import com.plantynet.service.ManagerService;

@Controller
public class ManagerController {

	@Inject
	private ManagerService service;

	// URL : /ask/login
	// LoginDTO 에서 처리
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public  String loginGet(@ModelAttribute("dto") LoginDTO dto) {
		return "login";
	}
	
	// URL : /ask/login에 대한 결과처리
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPost(LoginDTO dto, HttpSession session, Model model)
	throws Exception {
		
		//Model 객체에 사용자가 존재할 경우, ManagerVO라는 이름으로 저장.
		ManagerVO managerVO = service.login(dto);
		
		if(managerVO == null) {
			return ;
		}
		
		model.addAttribute("managerVO", managerVO);

	}

	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public void logout(HttpServletRequest request, 
	    HttpServletResponse response, HttpSession session) throws Exception {

		ManagerVO managerVO = (ManagerVO) session.getAttribute("login");

	    if (managerVO != null) {
	
	    	session.removeAttribute("login");
	    	session.invalidate();
	    	
	    	response.sendRedirect("/");
	    }
	}	
}

