package com.plantynet.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.plantynet.domain.ProhibitVO;
import com.plantynet.domain.ReportDoneVO;
import com.plantynet.domain.ReportYetVO;
import com.plantynet.service.ProhibitService;
import com.plantynet.service.ReportService;
import com.plantynet.service.VoteService;

@Controller
public class ReportController {
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);
	@Autowired
	ReportService reportService;

	@Autowired
	ProhibitService prohibitService;

	@Autowired
	VoteService voteService;

	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public String reportPage(Model model) {
		logger.info("connect report page");
		List<ReportYetVO> reportYetVO = reportService.getReportYet();
		List<ReportDoneVO> reportDoneVO = reportService.getReportDone();
		model.addAttribute("reportYetVO", reportYetVO);
		model.addAttribute("reportDoneVO", reportDoneVO);
		System.out.println(reportYetVO.toString());
		System.out.println(reportDoneVO.toString());
		return "report"; // prohibit.jsp 뷰 로 이동
	}

	@RequestMapping(value = "/report/doneInfo", method = RequestMethod.GET)
	public String reportDoneInfo(@RequestParam("reportNo") int reportNo, Model model)
			throws NumberFormatException, Exception {

		System.out.println("Controller 처리 reportNo:" + reportNo + " 진입");
		ReportDoneVO vo = reportService.getReportDonePick(reportNo);
		model.addAttribute("vo", vo);

		int survey_no = (reportService.getReportDonePick(reportNo).getSurvey_no());
		model.addAttribute("survyResult", voteService.getSurResult(survey_no));
		model.addAttribute("survyInfo", voteService.getSurvey(survey_no));

		return "reportDonePopup"; // prohibit.jsp 뷰 로 이동
	}

	@RequestMapping(value = "/report/yetInfo", method = RequestMethod.GET)
	public String reportYetInfo(@RequestParam("reportNo") int reportNo, Model model)
			throws NumberFormatException, Exception {

		System.out.println("Controller 미처리  reportNo:" + reportNo + " 진입");
		ReportYetVO vo = reportService.getReportYetPick(reportNo);
		model.addAttribute("vo", vo);

		int survey_no = Integer.parseInt(reportService.getReportYetPick(reportNo).getSurvey_no());
		model.addAttribute("survyResult", voteService.getSurResult(survey_no));
		model.addAttribute("survyInfo", voteService.getSurvey(survey_no));

		return "reportYetPopup"; // prohibit.jsp 뷰 로 이동
	}

	@RequestMapping(value = "/reportRegister", method = RequestMethod.GET)
	public void reportRegister(HttpServletResponse response, String popupWord) throws IOException {
		System.out.println("컨트롤러 실행");
		System.out.println(popupWord);
		ProhibitVO prohibitVO = new ProhibitVO();
		int mngr_no = 1; // 매니저이름 설정하기
		prohibitVO.setMngr_no(mngr_no);
		prohibitVO.setWord(popupWord);
		prohibitService.insert(prohibitVO);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(popupWord);
	}

	@RequestMapping(value = "/report_answerInsert", method = RequestMethod.POST)
	public String report_answerInsert(int report_no, String mngr_id, String answer_category, String answer_contents,
			int survey_no, Model model) { // 뷰로부터 DB에 삽입할 금칙어의 이름을 String word로 가져옴
		logger.info("report_answerInsert");
		ReportDoneVO vo = new ReportDoneVO();
		vo.setReport_no(report_no);
		vo.setMngr_id(mngr_id);
		if (answer_category.equals("1")) {
			vo.setAnswer_category("이상없음");
		} else {
			vo.setAnswer_category("블라인드");
		}
		vo.setSurvey_no(survey_no);
		vo.setAnswer_contents(answer_contents);
		reportService.answerInsert(vo);
		reportService.answerUpdate(vo);
		//reportService.reportPlus(vo);
		return "redirect:/report";// 삽입 완료시 금칙어 관리페이지로 리다이렉트
	}
}
