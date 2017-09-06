package com.plantynet.domain;

import java.util.Date;

public class SurveyVO {
	
	private int mber_no;
	private Date reg_date;
	private int survey_no;
	private String survey_contents;
	private int total_score;
	private int limit_time;
	private String status;
	private int reported_cnt;
	
	public int getMber_no() {
		return mber_no;
	}
	public void setMber_no(int mber_no) {
		this.mber_no = mber_no;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getSurvey_no() {
		return survey_no;
	}
	public void setSurvey_no(int survey_no) {
		this.survey_no = survey_no;
	}
	public String getSurvey_contents() {
		return survey_contents;
	}
	public void setSurvey_contents(String survey_contents) {
		this.survey_contents = survey_contents;
	}
	public int getTotal_score() {
		return total_score;
	}
	public void setTotal_score(int total_score) {
		this.total_score = total_score;
	}
	public int getLimit_time() {
		return limit_time;
	}
	public void setLimit_time(int limit_time) {
		this.limit_time = limit_time;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getReported_cnt() {
		return reported_cnt;
	}
	public void setReported_cnt(int reported_cnt) {
		this.reported_cnt = reported_cnt;
	}
	
	@Override
	public String toString() {
		return "SurveyVO [mber_no=" + mber_no + ", reg_date=" + reg_date + ", survey_no=" + survey_no
				+ ", survey_contents=" + survey_contents + ", total_score=" + total_score + ", limit_time=" + limit_time
				+ ", status=" + status + ", reported_cnt=" + reported_cnt + "]";
	}
	
	
	
	
}
