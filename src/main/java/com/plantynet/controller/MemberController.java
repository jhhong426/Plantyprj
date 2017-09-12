package com.plantynet.controller;

import java.lang.reflect.Member;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.plantynet.domain.FlagVO;
import com.plantynet.domain.MemberVO;
import com.plantynet.service.AuthService;
import com.plantynet.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	AuthService authService;

	MemberVO memberVO;
	
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public void memberPage(Model model) throws Exception {
		
		List<MemberVO> memberVO = memberService.memberList();
		model.addAttribute("member", memberVO);
		
		
	}
	
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String memberInfoPopup(Integer memberNo, Model model) throws Exception{
		
		MemberVO memberVO = memberService.getMember(memberNo);
		
		model.addAttribute("member", memberVO);
		
		System.out.println(memberNo);
		return "memberPopup";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateMemberInfo(MemberVO memberVO) throws Exception{
		
		memberService.modifyMember(memberVO);
		
		System.out.println(memberVO);
		return "redirect:/member";
	}
	
	// 삭제시, 슈퍼관리자 확인 비밀번호 팝업
	@RequestMapping(value = "/confirm", method = RequestMethod.GET)
	public String checkPwPop() throws Exception {
		
		return "memberSuperPwCheckPopup";
	}
	
	// 슈퍼관리자 확인 후 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody FlagVO confirm(@RequestParam("inputPassword") String inputPassword, Integer[] deleteMemberList) throws Exception {
		
		FlagVO flag = new FlagVO();
		flag.setFlag(false);
			
		if(authService.checkSuperPassword(inputPassword)){
			for (Integer mberNo : deleteMemberList) {
				//memberService.delSurvy(survyNo);
				System.out.println("삭제 완료 : " + mberNo);
			}
			flag.setFlag(true);
		}
			
		return flag;
	}
	
	

}
