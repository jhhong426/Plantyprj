package com.plantynet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.plantynet.service.QuestService;

/* 원래방식
@Controller
public class QuestController {
	
	@Autowired
	QuestDAO dao;

	// 문의사항 View 매핑
	@RequestMapping(value = "/quest", method = RequestMethod.GET) // URI상에서 /quest 값을 GET 방식으로 가져온다.
	public String quest(Model model)  {     // Model 객체는 해당 메소드에서 뷰에 필요한 데이터를 전달하는 용도로 사용
		List<QuestYetVO> questYetVO = dao.questYetSelect();
		List<QuestDoneVO> questDoneVO = dao.questDoneSelect();
		model.addAttribute("questYetVO", questYetVO);  // voQuestNot라는 객체를 "voNot"이라는 이름으로 추가
		model.addAttribute("questDoneVO", questDoneVO);
	
		return "quest";  
	}
}*/


@Controller
@RequestMapping("/quest/*")
public class QuestController {
	
	@Autowired
	QuestService service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public void quest(Model model) throws Exception {
		model.addAttribute("questYetSelect", service.questYetSelect());
		model.addAttribute("questDoneSelect", service.questDoneSelect());	
	}
	
	@RequestMapping(value = "/Answer", method = RequestMethod.GET)
	public String answerPopupSelect(@RequestParam("answerNo") int selectedAnswerNo) throws Exception {
		
		return "questAnswer";
	}
	
	@RequestMapping(value = "/questAnswer", method = RequestMethod.POST)
	public String answerPopupInsert(@RequestParam("answer_contents")String answer_contents) throws Exception {
    // 
		
		return "redirect:/quest/";	
	}
	
}
