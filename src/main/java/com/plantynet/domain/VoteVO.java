package com.plantynet.domain;

import java.util.Date;

public class VoteVO {

	private String survey_contents;
	private String item_contents;
	private String email;
	private String reg_date;
	private int survey_no;
	
	public String getSurvey_contents() {
		return survey_contents;
	}
	public void setSurvey_contents(String survey_contents) {
		this.survey_contents = survey_contents;
	}
	public String getItem_contents() {
		return item_contents;
	}
	public void setItem_contents(String item_contents) {
		this.item_contents = item_contents;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getSurvey_no() {
		return survey_no;
	}
	public void setSurvey_no(int survey_no) {
		this.survey_no = survey_no;
	}
	@Override
	public String toString() {
		return "VoteVO [survey_contents=" + survey_contents + ", item_contents=" + item_contents + ", email=" + email
				+ ", reg_date=" + reg_date + ", survey_no=" + survey_no + "]";
	}
	
	
	
}
