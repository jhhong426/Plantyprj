package com.plantynet.ask;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.plantynet.domain.TestPersonVO;
import com.plantynet.persistence.TestPersonDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class DAOTest {

  @Inject
  private TestPersonDAO dao;

  @Test
  public void insertWithVO() throws Exception{
	  TestPersonVO vo = new TestPersonVO();
	  vo.setAge(19);
	  vo.setName("jjj");
	  dao.insertPerson(vo);
  } 
  
  @Test
  public void insertWithHash() throws Exception{
	  Map<String,Object> voHash = new HashMap<>();
	  voHash.put("name", "juseongggg");
	  voHash.put("age" , 29);
	  
	  dao.insertPerson2(voHash);
  } 
 
  @Test
  public void readList() throws Exception {
	  List<TestPersonVO> vo = dao.getPerson();
	for(TestPersonVO a : vo) {
		System.out.println(a.getName() + a.getAge());
	}
  }
  
  @Test
  public void read() throws Exception{
	  System.out.println(dao.getTime());
	  
  }
  


}
