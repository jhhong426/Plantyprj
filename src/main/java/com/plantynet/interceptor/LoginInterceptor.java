package com.plantynet.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.plantynet.domain.ManagerVO;

// 로그인 검증 - 아이디/비밀번호 체크
public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN = "login";		// 세션에 들어갈 관리자 ID
	
	@Override
	public void postHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		HttpSession session = request.getSession();
		
	    ModelMap modelMap = modelAndView.getModelMap();
	    
	    ManagerVO managerVO = (ManagerVO) modelMap.get("managerVO");
	    
	    
	    // 로그인 성공
	    if (managerVO != null) {


	    	// 세션의 login 파라미터에 들어갈 값
	    	session.setAttribute(LOGIN, managerVO);
//	    	session.setMaxInactiveInterval(40*60);
	    	response.sendRedirect("/stat");

	    	
	    	System.out.println(session.getAttribute(LOGIN));
	    	
	    	
	    }
	    // 로그인 실패
	    else {
	    	
	    	request.setAttribute("flag", "false");
	    	request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
	    	    
	    }
	}

	  @Override
	  public boolean preHandle(HttpServletRequest request, 
			  HttpServletResponse response, Object handler) throws Exception {

	    HttpSession session = request.getSession();

	    if (session.getAttribute(LOGIN) != null) {
	      
	    	session.removeAttribute(LOGIN);
	    }

	    return true;
	  }
}
