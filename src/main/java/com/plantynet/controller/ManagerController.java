package com.plantynet.controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.plantynet.domain.ManagerVO;
import com.plantynet.dto.LoginDTO;
import com.plantynet.service.ManagerService;

@Controller
public class ManagerController {

	@Inject
	private ManagerService service;

	//LoginDTO 에서 처리
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGet(@ModelAttribute("dto") LoginDTO dto) {
		
	}
	
	// /ask/login에 대한 결과처리
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPost(LoginDTO dto, HttpSession session, Model model)
	throws Exception {
		
		//Model 객체에 사용자가 존재할 경우, ManagerVO라는 이름으로 저장.
		ManagerVO vo = service.login(dto);
		
		if(vo == null) {
			return ;
		}
		
		model.addAttribute("ManagerVO", vo);
		
//		if(dto.isUseCookie()) {
//			
//			//쿠키의 세션시간 초 * 분 * 시간 * 일
//			int amount = 60 * 60 * 24 * 7;
//			
//			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
//			
//			service.keepLogin(vo.getUid(), session.getId() sessionLimit);
//		}
		
	}
	
}
//	//로그아웃
//	@RequestMapping(value = "/logout", method = RequestMethod.GET)
//	public void logout(HttpServletRequest request, 
//	    HttpServletResponse response, HttpSession session) throws Exception {
//
//		Object obj = session.getAttribute("login");
//
//	    if (obj != null) {
//	    	
//	    	UserVO vo = (UserVO) obj;
//
//	    	session.removeAttribute("login");
//	    	session.invalidate();
//
//	    	Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
//
//	    	if (loginCookie != null) {
//	    		
//	    		loginCookie.setPath("/");
//	    		loginCookie.setMaxAge(0);
//	    		response.addCookie(loginCookie);
//	    		service.keepLogin(vo.getUid(), session.getId(), new Date());
//	    	}
//	    }
//	}	

