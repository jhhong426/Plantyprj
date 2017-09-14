
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.plantynet.domain.FlagVO;
import com.plantynet.domain.LoginDTO;
import com.plantynet.domain.ManagerVO;
import com.plantynet.domain.QuestDoneVO;
import com.plantynet.domain.QuestYetVO;
import com.plantynet.service.AuthService;
import com.plantynet.service.ManagerService;
import com.plantynet.service.PasswordEncoder;

@Controller
public class ManagerController {

	@Autowired
	private ManagerService service;
	
	@Autowired
	private AuthService authService;

	// URL : /login
	// LoginDTO 에서 처리
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public  String loginGet(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute("login") != null) {
		      
	    	return "redirect:/stat";
	    }
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
	
	// 관리자계정 삭제시, 슈퍼관리자 확인 비밀번호 팝업 띄우기
	@RequestMapping(value = "/super", method = RequestMethod.GET)
	public String checkPwPop(@RequestParam("deleteNo") Integer deleteNo, Model model) throws Exception {
		model.addAttribute("deleteTest", deleteNo);
		
		return "managerSuperPwCheckPopup";
	}
	
	// 슈퍼관리자 비밀번호 확인 후 삭제
	@RequestMapping(value = "/superCheck", method = RequestMethod.POST)
	public @ResponseBody FlagVO managerPopupUpdateDelete(@RequestParam("inputPassword") String inputPassword, Integer deleteNo) throws Exception {
		
		FlagVO flag = new FlagVO();
		flag.setFlag(false);
		
		if(authService.checkSuperPassword(inputPassword)){
			service.deleteManager(deleteNo);
			
			flag.setFlag(true);
		}
			
		return flag;
	}
}

