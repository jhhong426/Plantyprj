
package com.plantynet.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.plantynet.domain.LoginDTO;
import com.plantynet.domain.ManagerVO;
import com.plantynet.domain.QuestDoneVO;
import com.plantynet.domain.QuestYetVO;
import com.plantynet.service.ManagerService;
import com.plantynet.service.PasswordEncoder;

@Controller
public class ManagerController {

	@Autowired
	private ManagerService service;

	// URL : /login
	// LoginDTO 에서 처리
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public  String loginGet(@ModelAttribute("dto") LoginDTO dto) {
		return "login";
	}
	
	// URL : /login에 대한 결과처리
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
	
	
	// 운영진관리 View 매핑
	@RequestMapping(value = "/manager", method = RequestMethod.GET) 
	public String manager(Model model)  {   
		List<ManagerVO> managerVO = service.managerSelect();
		model.addAttribute("mngrVO", managerVO);  
	
		return "manager";  
	}
	
	// 관리자계정 생성 팝업창 띄우기
	@RequestMapping(value = "/createPopup", method = RequestMethod.GET)
	public String managerPopupCreate() throws Exception {

		return "/managerCreate";
	}
	
	// 관리자계정 입력값 DB로 insert하기
	@RequestMapping(value = "/create", method = RequestMethod.POST) 
	public String managerCreate(ManagerVO vo, @RequestParam("password") String password)  {   
		//System.out.println(password);
		PasswordEncoder sha256Encoder = new PasswordEncoder();
		vo.setPassword(sha256Encoder.SHA256(password));
		service.regist(vo);
		
		return "redirect:/manager";
	}
	
	// 관리자계정 정보수정 팝업창 띄우기
	@RequestMapping(value = "/updatePopup", method = RequestMethod.GET)
	public String managerPopupUpdate(@RequestParam("updateNo") Integer updateNo, Model model) throws Exception {
		model.addAttribute("updateManagerSelect", service.updateManagerSelect(updateNo));
		
		return "managerUpdate";
	}
	
	
	// 관리자계정 정보수정 입력값 DB로 insert하기
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String managerPopupUpdate(ManagerVO vo, Model model) throws Exception {
		service.update(vo);
		
		return "redirect:/manager";	
	}
	
}

