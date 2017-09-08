package com.plantynet.domain;

import java.sql.Timestamp;

public class ReportDoneVO {
	private int report_no;
	private String report_category;
	private String report_contents;
	private String email;
	private String mngr_id;
	private Timestamp reg_date;
	private Timestamp cmpl_date;
	private String answer_category;
	private int survey_no;
	
	
	public int getReport_no() {
		return report_no;
	}
	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}
	public String getReport_category() {
		return report_category;
	}
	public void setReport_category(String report_category) {
		this.report_category = report_category;
	}
	public String getReport_contents() {
		return report_contents;
	}
	public void setReport_contents(String report_contents) {
		this.report_contents = report_contents;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMngr_id() {
		return mngr_id;
	}
	public void setMngr_id(String mngr_id) {
		this.mngr_id = mngr_id;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public Timestamp getCmpl_date() {
		return cmpl_date;
	}
	public void setCmpl_date(Timestamp cmpl_date) {
		this.cmpl_date = cmpl_date;
	}
	public String getAnswer_category() {
		return answer_category;
	}
	public void setAnswer_category(String answer_category) {
		this.answer_category = answer_category;
	}
	public int getSurvey_no() {
		return survey_no;
	}
	public void setSurvey_no(int survey_no) {
		this.survey_no = survey_no;
	}
	
	
}
