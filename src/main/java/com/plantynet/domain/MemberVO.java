package com.plantynet.domain;

public class MemberVO {

	private String mber_no;
	private String email;
	private String password;
	private String mber_name;
	private String phone;
	private String birth;
	private String gender;
	private String reg_date;
	private int survey_cnt;
	private int quest_cnt;
	private int vote_cnt;
	private int report_cnt;
	private int reported_cnt;
	
	public String getMber_no() {
		return mber_no;
	}
	public void setMber_no(String mber_no) {
		this.mber_no = mber_no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMber_name() {
		return mber_name;
	}
	public void setMber_name(String mber_name) {
		this.mber_name = mber_name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getSurvey_cnt() {
		return survey_cnt;
	}
	public void setSurvey_cnt(int survey_cnt) {
		this.survey_cnt = survey_cnt;
	}
	public int getQuest_cnt() {
		return quest_cnt;
	}
	public void setQuest_cnt(int quest_cnt) {
		this.quest_cnt = quest_cnt;
	}
	public int getVote_cnt() {
		return vote_cnt;
	}
	public void setVote_cnt(int vote_cnt) {
		this.vote_cnt = vote_cnt;
	}
	public int getReport_cnt() {
		return report_cnt;
	}
	public void setReport_cnt(int report_cnt) {
		this.report_cnt = report_cnt;
	}
	public int getReported_cnt() {
		return reported_cnt;
	}
	public void setReported_cnt(int reported_cnt) {
		this.reported_cnt = reported_cnt;
	}
	
	@Override
	public String toString() {
		return "MemberVO [mber_no : " + mber_no +", email : " + email + ", password : " + password + ", mber_name : " + mber_name + ", phone : " + phone + ", birth : " + birth +
				", gender : " + gender + ", reg_date : " + reg_date + ", survey_cnt : " + survey_cnt + ", quest_cnt : " + quest_cnt + ", vote_cnt : " + vote_cnt + ", report_cnt : "
				+ report_cnt + ", reported_cnt : " + reported_cnt + "]";
	}
	
}
