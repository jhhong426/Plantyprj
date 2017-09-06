package com.plantynet.controller;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.plantynet.domain.ProhibitVO;
import com.plantynet.persistence.ProhibitDAO;

@Controller
public class ProhibitController {
	
	
	@Autowired
	ProhibitDAO prohibitDao;
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(ProhibitController.class);
	
	//금칙어 관리 페이지 호출
	@RequestMapping(value = "/prohibit", method = RequestMethod.GET)
	public String test(Model model) {
		logger.info("connect test page");
		List<ProhibitVO> voList = prohibitDao.getWord(); //금칙어 내역을 리스트로 생성
		model.addAttribute("vo",voList); // view에 voList란 이름으로 금칙어 내역 전달
		return "prohibit";  // prohibit.jsp 뷰 로 이동 
	}
	
	//금칙어 삭제 
	@RequestMapping(value = "/prohibit_delete", method = RequestMethod.POST)
	public String prohibit_delete(@RequestParam("word")String word) {  //뷰로부터  DB에 삭제할 금칙어의 이름을 String word로 가져옴
		logger.info("prohibit_delete");
		System.out.println("삭제 쿼리 실행 : "+ word); 
		prohibitDao.delete(word);   //  뷰로부터  가져온 word로  DB에 가지고있는 금칙어를  삭제
		return "redirect:/prohibit"; //삭제 완료시 금칙어 관리페이지로 리다이렉트
	}
	
	//금칙어 삽입
	@RequestMapping(value = "/prohibit_insert", method = RequestMethod.POST)
	public String prohibit_insert(@RequestParam("word")String word) {   //뷰로부터 DB에 삽입할 금칙어의 이름을 String word로 가져옴
		logger.info("prohibit_insert");
		ProhibitVO prohibitVO = new ProhibitVO();
		int mngr_no = 1;  //매니저이름 설정하기
		prohibitVO.setMngr_no(mngr_no);
		prohibitVO.setWord(word);
		
		System.out.println("금칙어"+ word +"mngr_no" +mngr_no+"실행");
		prohibitDao.insert(prohibitVO);   // 뷰로부터  가져온 word로  DB에 가지고있는 금칙어를  삭제
		
		
		return "redirect:/prohibit";//삽입 완료시 금칙어 관리페이지로 리다이렉트
	}
}
