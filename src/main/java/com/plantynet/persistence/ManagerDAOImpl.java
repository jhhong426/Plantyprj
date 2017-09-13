
package com.plantynet.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.plantynet.domain.EditPasswordDTO;
import com.plantynet.domain.LoginDTO;
import com.plantynet.domain.ManagerVO;
import com.plantynet.domain.QuestDoneVO;
import com.plantynet.domain.QuestYetVO;

@Repository
public class ManagerDAOImpl implements ManagerDAO {
	
	@Autowired
	private SqlSession session;
	
	private static String namespace ="com.plantynet.mapper.ManagerMapper";	

	@Override
	public ManagerVO login(LoginDTO dto) throws Exception {
		
		return session.selectOne(namespace + ".login", dto);
	}
	
//	@Override
//	public void editPassword(EditPasswordDTO dto) throws Exception {
//		
//		session.update(namespace + ".update", dto);
//	}

//	@Override
//	public ManagerVO checkManager(EditPasswordDTO dto) {
//
//		return session.selectOne(namespace + ".check", dto);
//	}
	
	@Override
	public List<ManagerVO> managerSelect() {   
		return  session.selectList(namespace+".managerSelect");
	}
	
	@Override
	public void regist(ManagerVO vo) {
		session.insert(namespace+".registManager", vo);
	}
	
	@Override
	public List<ManagerVO> updateManagerSelect(Integer mngr_no) throws Exception {
		return session.selectList(namespace+".updateManagerSelect", mngr_no);
	}
	
	@Override
	public void update(ManagerVO vo) {
		session.update(namespace+".updateManager", vo);
	}
}

