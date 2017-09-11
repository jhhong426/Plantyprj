package com.plantynet.interceptor;


import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	  
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
	    
		HttpSession session = request.getSession();   


	    if(session.getAttribute("login") == null){

	    	response.sendRedirect("/");
	      
	    	return false;
	    }
	    
	    return true;
	  }  
	
	


	  
}
