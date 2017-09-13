package com.plantynet.domain;

import org.springframework.security.authentication.encoding.ShaPasswordEncoder;

import com.plantynet.service.PasswordEncoder;

// 비밀번호 변경 화면에 전달되는 데이터 수집
public class EditPasswordDTO {

	ShaPasswordEncoder encoder=new ShaPasswordEncoder(256);
	
	
	private int mngr_no;
	private String password;
	private String newPW;
	private String chkPW;
	
	PasswordEncoder sha256Encoder = new PasswordEncoder();
//	private String password256
	
	
	
	public int getMngr_no() {
		return mngr_no;
	}
	public void setMngr_no(Integer mngr_no) {
		this.mngr_no = mngr_no;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		
		this.password = sha256Encoder.SHA256(password);

	}
	public String getNewPW() {
		return newPW;
	}
	public void setNewPW(String newPW) {

		this.newPW = sha256Encoder.SHA256(newPW);

	}
	
	public String getChkPW() {
		return chkPW;
	}
	public void setChkPW(String chkPW) {
		this.chkPW = chkPW;
	}

	@Override
	public String toString() {
		return "EditPasswordDTO [mngr_no=" + mngr_no + ", password=" + password + ", newPW=" + newPW + ", chkPW=" + chkPW+ "]";
	}
	
}
