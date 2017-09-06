package com.plantynet.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.plantynet.domain.CmplVO;
import com.plantynet.domain.NotVO;
import com.plantynet.persistence.QuestDAO;
import com.plantynet.service.QuestService;

@Controller
public class QuestController {
	
	@Autowired
	QuestDAO dao;
	
	@RequestMapping(value = "/quest", method = RequestMethod.GET) // URI상에서 /quest 값을 GET 방식으로 가져온다.
	public String quest(Model model) {     // Model 객체는 해당 메소드에서 뷰에 필요한 데이터를 전달하는 용도로 사용
		List<NotVO> voQuestNot = dao.questNotSelect();
		List<CmplVO> voQuestCmpl = dao.questCmplSelect();
		model.addAttribute("voNot", voQuestNot);  // voQuestNot라는 객체를 "voNot"이라는 이름으로 추가
		model.addAttribute("voCmpl", voQuestCmpl);
	
		return "quest";  
	}
}
