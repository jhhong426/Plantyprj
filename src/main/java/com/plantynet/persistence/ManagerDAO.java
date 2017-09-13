
package com.plantynet.persistence;

import java.util.List;

import com.plantynet.domain.EditPasswordDTO;
import com.plantynet.domain.LoginDTO;
import com.plantynet.domain.ManagerVO;
import com.plantynet.domain.QuestDoneVO;

public interface ManagerDAO {
	
	public ManagerVO login(LoginDTO dto)throws Exception;

//	public void editPassword(EditPasswordDTO dto)throws Exception;

	
	List<ManagerVO> managerSelect();
	
	void regist(ManagerVO vo);
	
	List<ManagerVO> updateManagerSelect(Integer mngr_no) throws Exception;	
	
	void update(ManagerVO vo);
}

