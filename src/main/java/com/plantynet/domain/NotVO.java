package com.plantynet.domain;

public class NotVO {    // '미처리' 문의사항 VO
	private int quest_no;
	private String quest_category;
	private String title;
	private String reg_date;
	private String email;
	
	
	public int getQuest_no() {
		return quest_no;
	}
	public void setQuest_no(int quest_no) {
		this.quest_no = quest_no;
	}
	public String getQuest_category() {
		return quest_category;
	}
	public void setQuest_category(String quest_category) {
		this.quest_category = quest_category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
