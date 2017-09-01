package com.plantynet.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.plantynet.domain.ManagerVO;

// 로그인 검증 - 아이디/비밀번호 체크
public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final String login = "login";	// login 세션에 들어갈 정보
	private static final String flag = "flag";	// flag 세션에 들어갈 정보
	
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		HttpSession session = request.getSession();
		
	    ModelMap modelMap = modelAndView.getModelMap();
	    
	    ManagerVO managerVO = (ManagerVO) modelMap.get("ManagerVO");
	    
	    
	    // Check
	    System.out.println(managerVO);

	    // 로그인 성공
	    if (managerVO != null) {

	    	logger.info("new login success");
	    	
	    	// 세션의 login 파라미터에 들어갈 값
	    	session.setAttribute(login, managerVO);
	    	session.setAttribute(flag, "success");

	    	response.sendRedirect("/ask/myPage");

	    	System.out.println(session.getAttribute(login));
	    	System.out.println(session.getAttribute(flag));
	    	

	    }
	    // 로그인 실패
	    else {
	    	
	    	// 세션의 flag 파라미터에 들어갈 값
	    	session.setAttribute(flag, "failure");

	    	response.sendRedirect("/ask/login");
	    	
	    	System.out.println(session.getAttribute(flag));
	    	
	    	
	    }
	}

	  @Override
	  public boolean preHandle(HttpServletRequest request, 
			  HttpServletResponse response, Object handler) throws Exception {

	    HttpSession session = request.getSession();

	    if (session.getAttribute(login) != null) {
	    	
	    	logger.info("clear login data before");
	      
	    	session.removeAttribute(login);
	    }

	    return true;
	  }
}
