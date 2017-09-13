package com.plantynet.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.plantynet.domain.EditPasswordDTO;
import com.plantynet.domain.FlagVO;
import com.plantynet.domain.ManagerVO;
import com.plantynet.domain.QuestDoneVO;
import com.plantynet.domain.ReportDoneVO;
import com.plantynet.service.AuthService;
import com.plantynet.service.MypageService;
import com.plantynet.service.QuestService;
import com.plantynet.service.ReportService;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
	
	
	@Autowired
	private AuthService authService;
	@Autowired
	private MypageService mypageService;
	@Autowired
	private ReportService reportService;
	@Autowired
	private QuestService questService;
	

	@RequestMapping(value = "", method = RequestMethod.GET)
	public void myPageGet(Model model) throws Exception {
		
		// 문의사항 답변완료 내용
		List<QuestDoneVO> questDoneVO = questService.questDoneSelect();
		
		// 신고사항 답변완료 내용
		List<ReportDoneVO> reportDoneVO = reportService.getReportDone();

		model.addAttribute("questDoneSelect", questDoneVO);
		model.addAttribute("reportDoneVO", reportDoneVO);
	
		
	}

	
	@RequestMapping(value = "/modifyPW", method = RequestMethod.GET)
	public String editPWGet() throws Exception {
		
		return "myPageModPWPopup";
		
	}
	
	@RequestMapping(value = "/modifyPW", method = RequestMethod.POST)
	public @ResponseBody FlagVO modPWPost(EditPasswordDTO dto, HttpServletResponse response, HttpSession session, Model model) throws Exception {
		
		FlagVO flag = new FlagVO();
		flag.setFlag(false);
		
		ManagerVO loginSession = (ManagerVO) session.getAttribute("login");
		
		//세션의 관리자 번호
		Integer mngr_no = loginSession.getMngr_no();
		
		//사용자가 작성한 현재 비밀번호
		String password = dto.getPassword();
		
		// TB_MANAGER 테이블에 있는 세션에 해당하는 사용자 Password
		String dbPassword = authService.getPassword(mngr_no);
		
		System.out.println(mngr_no);
		System.out.println(password);
		System.out.println(dbPassword);
		System.out.println(dto);
			
		if((mngr_no != null) && (password.equals(dbPassword))) {
			
			mypageService.editPassword(dto);	
			flag.setFlag(true);
		}
			
		return flag;
	}		


}
