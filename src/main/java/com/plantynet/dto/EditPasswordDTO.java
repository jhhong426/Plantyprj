package com.plantynet.dto;

// 비밀번호 변경 화면에 전달되는 데이터 수집
public class EditPasswordDTO {

	private String mngr_no;
	private String password;
	private String newPW;
	private String chkPW;
	
	public String getMngr_no() {
		return mngr_no;
	}
	public void setMngr_no(String mngr_no) {
		this.mngr_no = mngr_no;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNewPW() {
		return newPW;
	}
	public void setNewPW(String newPW) {
		this.newPW = newPW;
	}
	
	public String getChkPW() {
		return chkPW;
	}
	public void setChkPW(String chkPW) {
		this.chkPW = chkPW;
	}

	@Override
	public String toString() {
		return "EditPasswordDTO [password=" + password + ", newPW=" + newPW + ", chkPW=" + chkPW+ "]";
	}
	
}
