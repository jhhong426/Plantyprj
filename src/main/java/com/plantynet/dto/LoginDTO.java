package com.plantynet.dto;

//화면에 전달되는 데이터를 수집
public class LoginDTO {
	
	private String mngr_id;
	private String password;
	
	public String getMngrId() {
		return mngr_id;
	}
	public void setMngrId(String mngr_id) {
		this.mngr_id = mngr_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Override
	public String toString() {
		return "LoginDTO [mngr_id=" + mngr_id + ", password=" + password + "]";
	}
	
	
	
}
