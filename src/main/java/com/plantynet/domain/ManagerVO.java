package com.plantynet.domain;

//세션에 보관될 데이터 - 아이디, 비밀번호(해쉬), 이름
public class ManagerVO {

	  private String mngr_id;
	  private String password;
	  private String mngr_name;

	  public String getMngrId() {
	    return mngr_id;
	  }

	  public void setMngrId(String mngr_id) {
	    this.mngr_id = mngr_id;
	  }

	  public String getPassword() {
	    return password;
	  }

	  public void setUpw(String password) {
	    this.password = password;
	  }

	  public String getMngrName() {
	    return mngr_name;
	  }

	  public void setMngrName(String mngr_name) {
	    this.mngr_name = mngr_name;
	  }

	  @Override
	  public String toString() {
	    return "ManagerVO [mngr_id=" + mngr_id + ", password=" + password + ", mngr_name=" + mngr_name + "]";
	  }
	
	
}
