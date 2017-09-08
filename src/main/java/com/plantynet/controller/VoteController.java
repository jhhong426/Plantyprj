package com.plantynet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.plantynet.domain.FlagVO;
import com.plantynet.service.VoteService;

@Controller
@RequestMapping("/vote/*")
public class VoteController {
	
	@Autowired
	VoteService service;

	@RequestMapping(value = "/", method = RequestMethod.GET )
	public void vote(Model model) throws Exception {
		
		model.addAttribute("surveyList", service.getAllSurvey());
		model.addAttribute("voteList", service.getAllVotes());	
		
	}
	
	@RequestMapping(value = "/blind", method = RequestMethod.POST)
	public String setBlind(Integer[] blindSurvyNoList, RedirectAttributes rttr) throws Exception {
		
		for (Integer survyNo : blindSurvyNoList) {
			service.blindSurvy(survyNo);
		}
		
		rttr.addFlashAttribute("rttr", "블라인드 처리 완료");
		
		return "redirect:/vote/";	
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String checkPwPop() throws Exception {
		return "superPwCheckPopup";
	}
	
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String voteInfoPop(@RequestParam("surveyNo") int selectedSurvyNo) throws Exception {
		
		System.out.println("팝업 진입진입");
		return "votePopup";
	}
	
	@RequestMapping(value = "/confirm", method = RequestMethod.POST)
	public @ResponseBody FlagVO confirm(String password, Integer[] delSurvyNoList) throws Exception {
		
		FlagVO flag = new FlagVO();
		
		/*
		 *  1. 슈퍼관리자 비밀번호 가져와
		 *  2. 입력갑과 비교
		 *  3. 맞으면 질문글 삭제 후 flag.setFlag(true)
		 *  4. 틀리면 flag.setFlag(false)
		 */
		
		for (Integer survyNo : delSurvyNoList) {
			// 해당 질문 글 Delete 
		}
		
		
		return flag;
		
	}
	
}
