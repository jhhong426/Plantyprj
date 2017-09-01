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

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final String login = "login";
	private static final String flag = "flag";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		HttpSession session = request.getSession();

	    ModelMap modelMap = modelAndView.getModelMap();
	    
	    Object managerVO = modelMap.get("ManagerVO");
	    
	    //System.out.println(modelMap);
	    
	    System.out.println(managerVO);

	    if (managerVO != null) {

	    	logger.info("new login success");
	    	
	    	session.setAttribute(login, managerVO);
	    	session.setAttribute(flag, "success");
	    	
	    	response.sendRedirect("/ask/myPage");

	    	System.out.println(session.getAttribute(login));
	    	System.out.println(session.getAttribute(flag));
	    	
//	    	if(request.getParameter("useCookie") != null) {
//	    		
//	    		Cookie loginCookie = new Cookie("loginCookie", session.getId());
//	    		loginCookie.setPath("/");
//	    		response.addCookie(loginCookie);
//	    	}
//	    	
//	    	
//	    	Object dest = session.getAttribute("dest");
//	    	
//	    	response.sendRedirect(dest != null ? (String)dest: "/");
	    }
	    else {
	    	
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
