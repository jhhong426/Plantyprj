package com.plantynet.domain;

public class CmplVO {   // '처리' 문의사항 VO
	private int quest_no;
	private String quest_category;
	private String title;
	private String reg_date;
	private String email;
	private String cmpl_date;
	private String mngr_id;
	private String answer_contents;
	
	
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
	public String getCmpl_date() {
		return cmpl_date;
	}
	public void setCmpl_date(String cmpl_date) {
		this.cmpl_date = cmpl_date;
	}
	public String getMngr_id() {
		return mngr_id;
	}
	public void setMngr_id(String mngr_id) {
		this.mngr_id = mngr_id;
	}
	public String getAnswer_contents() {
		return answer_contents;
	}
	public void setAnswer_contents(String answer_contents) {
		this.answer_contents = answer_contents;
	}
}
