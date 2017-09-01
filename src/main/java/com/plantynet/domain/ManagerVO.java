package com.plantynet.domain;

public class ManagerVO {

	  private String mngr_id;
	  private String password;
	  private String mngr_name;
	  private String emp_no;
	  private String department;
	  private String position;
	  private String authority;

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

	  public String getMngrName() {
	    return mngr_name;
	  }

	  public void setMngrName(String mngr_name) {
	    this.mngr_name = mngr_name;
	  }
	  
	  public String getEmp_no() {
		 return emp_no;
	  }
	
	  public void setEmp_no(String emp_no) {
		  this.emp_no = emp_no;
	  }
	
	  public String getDepartment() {
		  return department;
	  }
	
	  public void setDepartment(String department) {
		  this.department = department;
	  }
	
	  public String getPosition() {
		  return position;
	  }
	
	  public void setPosition(String position) {
		  this.position = position;
	  }
	
	  public String getAuthority() {
		  return authority;
	  }
	
	  public void setAuthority(String authority) {
		  this.authority = authority;
	  }
		
	  @Override
	  public String toString() {
		  return "ManagerVO [mngr_id=" + mngr_id + ", mngr_name=" + mngr_name +
				  ", emp_no=" + emp_no +", department=" + department + ", position=" + position + ", authority=" +authority +"]";
	  }
	
	
}
