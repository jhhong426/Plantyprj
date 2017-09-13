package com.plantynet.controller;

import java.awt.List;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.plantynet.domain.QuestDoneVO;
import com.plantynet.domain.QuestYetVO;
import com.plantynet.service.QuestService;

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
	
	@RequestMapping(value = "/selectAnswer", method = RequestMethod.GET)
	public String answerPopupSelect(@RequestParam("answerNo") int selectedAnswerNo, Model model) throws Exception {
		model.addAttribute("questAnswerSelect", service.questAnswerSelect(selectedAnswerNo));
		
		return "questAnswer";
	}
	
	@RequestMapping(value = "/insertAnswer", method = RequestMethod.POST)
	public String answerPopupInsert(@RequestParam("answer_contents") String answer_contents, int quest_no, String mngr_id, Model model) throws Exception {
		QuestDoneVO doneVO = new QuestDoneVO();
		doneVO.setMngr_id(mngr_id);
		doneVO.setAnswer_contents(answer_contents);
		doneVO.setQuest_no(quest_no);
		
		service.insert(doneVO);
		service.update(quest_no);
		
		return "redirect:/quest/";	
	}
	
	@RequestMapping(value = "/selectResult", method = RequestMethod.GET)
	public String resultPopupSelect(@RequestParam("resultNo") int selectedResultNo, Model model) throws Exception {
		model.addAttribute("questResultSelect", service.questResultSelect(selectedResultNo));
		
		return "questResult";
	}
}
