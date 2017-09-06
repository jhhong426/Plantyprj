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
import com.plantynet.service.AuthService;
import com.plantynet.service.MypageService;

@Controller
public class MyPageController {
	
	@Inject
	private AuthService authService;
	
	@Inject
	private MypageService mypageService;

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
		
		
		ManagerVO loginSession = (ManagerVO) session.getAttribute("login");
		
		//세션의 관리자 번호
		Integer mngr_no = loginSession.getMngr_no();
		
		//사용자가 작성한 현재 비밀번호
		String password = dto.getPassword();
		
		// TB_MANAGER 테이블에 있는 세션에 해당하는 사용자 Password
		String DBPassword = authService.getPassword(mngr_no);
		
		System.out.println(mngr_no);
		System.out.println(password);
		System.out.println(authService.getPassword(mngr_no));
		System.out.println(dto);
		
		if ((mngr_no != null) && (password.equals(DBPassword))) {
			
			mypageService.editPassword(dto);
			
			response.sendRedirect("/ask/myPage");
			
		}
		else {
			
			response.sendRedirect("/ask/failPW");
			
		}
	}
}
