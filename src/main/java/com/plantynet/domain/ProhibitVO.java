package com.plantynet.domain;

import java.sql.Timestamp;

public class ProhibitVO {
	String word;
	Timestamp reg_date;
	int prhibit_no;
	String mngr_id;
	public String getMngr_id() {
		return mngr_id;
	}
	public int getPrhibit_no() {
		return prhibit_no;
	}
	public void setMngr_id(String mngr_id) {
		this.mngr_id = mngr_id;
	}
	public void setPrhibit_no(int prhibit_no) {
		this.prhibit_no = prhibit_no;
	}
	
	public String getWord() {
		return word;
	}
	
	public void setWord(String word) {
		this.word = word;
	}
	
	public Timestamp getReg_date() {
		return reg_date;
	}
	
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
}
