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
import com.plantynet.service.AuthService;
import com.plantynet.service.VoteService;

@Controller
@RequestMapping("/vote/*")
public class VoteController {
	
	@Autowired
	VoteService voteService;
	
	@Autowired
	AuthService authService;

	@RequestMapping(value = "/", method = RequestMethod.GET )
	public void vote(Model model) throws Exception {
		
		model.addAttribute("surveyList", voteService.getAllSurvey());
		model.addAttribute("voteList", voteService.getAllVotes());	
		
	}
	
	@RequestMapping(value = "/blind", method = RequestMethod.POST)
	public String setBlind(Integer[] blindSurvyNoList, RedirectAttributes rttr) throws Exception {
		
		for (Integer survyNo : blindSurvyNoList) {
			voteService.blindSurvy(survyNo);
		}
		
		rttr.addFlashAttribute("rttr", "블라인드 처리 완료");
		
		return "redirect:/vote/";	
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String checkPwPop() throws Exception {
		return "superPwCheckPopup";
	}
	
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String voteInfoPop(@RequestParam("surveyNo") int selectedSurvyNo, Model model) throws Exception {
		
		System.out.println("팝업 진입진입");
		
		model.addAttribute("survyInfo", voteService.getSurvey(selectedSurvyNo));
		model.addAttribute("survyResult", voteService.getSurResult(selectedSurvyNo));

		return "votePopup";
	}
	
	@RequestMapping(value = "/confirm", method = RequestMethod.POST)
	public @ResponseBody FlagVO confirm(@RequestParam("inputPassword") String inputPassword, Integer[] delSurvyNoList) throws Exception {
		
		FlagVO flag = new FlagVO();
		flag.setFlag(false);
			
		if(authService.checkSuperPassword(inputPassword)){
			
			for (Integer survyNo : delSurvyNoList) {
				//voteService.delSurvy(survyNo);
				System.out.println("삭제 완료 : " + survyNo);
			}
			flag.setFlag(true);
		}
			
		return flag;
	}
	
}
