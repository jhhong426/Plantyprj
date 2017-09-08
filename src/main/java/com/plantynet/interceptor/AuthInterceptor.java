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

	    	response.sendRedirect("/ask/login");
	      
	    	return false;
	    }
	    
	    return true;
	  }  
	
	public String testSHA256(String str){

		String SHA = ""; 

		try{

			MessageDigest sh = MessageDigest.getInstance("SHA-256"); 

			sh.update(str.getBytes()); 

			byte byteData[] = sh.digest();

			StringBuffer sb = new StringBuffer(); 

			for(int i = 0 ; i < byteData.length ; i++){

				sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));

			}

			SHA = sb.toString();

			

		}catch(NoSuchAlgorithmException e){

			e.printStackTrace(); 

			SHA = null; 

		}

		return SHA;

	}


	  
}
