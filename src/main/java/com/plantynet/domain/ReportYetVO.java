package com.plantynet.domain;

import java.sql.Timestamp;

public class ReportYetVO {
	
	private int report_no;
	private String report_category;
	private String report_contents;
	private String email;
	private Timestamp reg_date;
	private String survey_no;
	
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
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getSurvey_no() {
		return survey_no;
	}
	public void setSurvey_num(String survey_no) {
		this.survey_no = survey_no;
	}
	
}
