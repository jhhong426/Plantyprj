
package com.plantynet.service;

import java.util.List;

import com.plantynet.domain.EditPasswordDTO;
import com.plantynet.domain.LoginDTO;
import com.plantynet.domain.ManagerVO;
import com.plantynet.domain.QuestDoneVO;
import com.plantynet.domain.QuestYetVO;

public interface ManagerService {
	
	  public ManagerVO login(LoginDTO dto) throws Exception;
	  
//	  public void editPassword(EditPasswordDTO dto)throws Exception;

//	  public ManagerVO checkManager(EditPasswordDTO dto);
	  
	  
	  
	  public List<ManagerVO> managerSelect();
	  
	  void regist(ManagerVO vo);
	  
	  public List<ManagerVO> updateManagerSelect(Integer mngr_no) throws Exception;
	  
	  void update(ManagerVO vo);

}


