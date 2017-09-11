package com.plantynet.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.codec.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.plantynet.domain.CmplVO;
import com.plantynet.domain.ManagerVO;
import com.plantynet.domain.NotVO;
import com.plantynet.domain.ReportDoneVO;
import com.plantynet.dto.EditPasswordDTO;
import com.plantynet.persistence.QuestDAO;
import com.plantynet.service.AuthService;
import com.plantynet.service.MypageService;
import com.plantynet.service.QuestService;
import com.plantynet.service.ReportService;

@Controller
public class MyPageController {
	
//	@Inject
//	private StandardPasswordEncoder encoder;
	
	@Autowired
	private AuthService authService;
	@Autowired
	private MypageService mypageService;
	@Autowired
	private ReportService reportService;
	@Autowired
	private QuestDAO dao;

	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public void myPageGet(Model model) throws Exception {
		
		// 문의사항 답변완료 내용
		List<CmplVO> voQuestCmpl = dao.questCmplSelect();
		
		// 신고사항 답변완료 내용
		List<ReportDoneVO> reportDoneVO = reportService.getReportDone();

		model.addAttribute("voCmpl", voQuestCmpl);
		model.addAttribute("reportDoneVO", reportDoneVO);
	
		
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
			
			response.sendRedirect("/myPage");
			
		}
		else {
			
			//변경 실패시, alert창 "변경에 실패하였습니다!" (예정)
			response.sendRedirect("/failPW");
			
		}
	}
	


}
