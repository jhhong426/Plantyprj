package com.plantynet.domain;

import org.springframework.security.authentication.encoding.ShaPasswordEncoder;

// 비밀번호 변경 화면에 전달되는 데이터 수집
public class EditPasswordDTO {

	ShaPasswordEncoder encoder=new ShaPasswordEncoder(256);
	
	
	private String mngr_no;
	private String password;
	private String newPW;
	private String chkPW;
	
//	private String password256 = encoder.encodePassword(password, null);
//	private String newPW256 = encoder.encodePassword(newPW, null);
//	private String chkPW256 = encoder.encodePassword(chkPW, null);
	
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
//		password256 = encoder.encodePassword(password,  null); 
		this.password = password;
	}
	public String getNewPW() {
		return newPW;
	}
	public void setNewPW(String newPW) {
//		newPW256 = encoder.encodePassword(newPW,  null);
		this.newPW = newPW;
	}
	
	public String getChkPW() {
		return chkPW;
	}
	public void setChkPW(String chkPW) {
//		chkPW256 = encoder.encodePassword(chkPW,  null);
		this.chkPW = chkPW;
	}

	@Override
	public String toString() {
		return "EditPasswordDTO [mngr_no=" + mngr_no + ", password=" + password + ", newPW=" + newPW + ", chkPW=" + chkPW+ "]";
	}
	
}
