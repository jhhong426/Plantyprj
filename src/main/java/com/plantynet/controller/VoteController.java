package com.plantynet.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.plantynet.domain.FlagVO;

@Controller
@RequestMapping("/vote/*")
public class VoteController {

	@RequestMapping(value = "/", method = RequestMethod.GET )
	public void vote(Model model) throws Exception {
		
		// List<SurveyVO>, List<VoteVO> model 에 담기
		
	}
	
	@RequestMapping(value = "/blind", method = RequestMethod.POST)
	public String setBlind(List<Integer> blindSurvyNoList, RedirectAttributes rttr) throws Exception {
		
		for (Integer survyNo : blindSurvyNoList) {
			// 블라인드 적용 Update
		}
		
		return "redirect:/vote/";	
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String checkPwPop() throws Exception {
		return "checkPw";
	}
	
	public @ResponseBody FlagVO confirm(String password, List<Integer> delSurvyNoList) throws Exception {
		
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
