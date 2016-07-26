package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserAuthCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
	
		// session 검사
		HttpSession session = request.getSession(false);
	
		System.out.println("=========frontInterceptors:"+request.getRequestURL());
		
		if(session == null){
			// 처리를 끝냄 - 컨트롤로 요청이 가지 않음.
			response.sendRedirect("/user/main.dowon");
			return false;
		}
		
		String user_id = (String)session.getAttribute("USER_ID");
		if(user_id == null || user_id.equals("")){
			response.sendRedirect("/user/main.dowon");
			return false;
		}
		return true;
	
	}
	
}
