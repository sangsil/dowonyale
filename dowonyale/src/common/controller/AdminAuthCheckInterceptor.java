package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminAuthCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
	
		// session 검사
		HttpSession session = request.getSession(false);
		
		if(session == null){
			// 처리를 끝냄 - 컨트롤로 요청이 가지 않음.
			response.sendRedirect("/admin");
			return false;
		}
		
		//전체관리자만 사용가능
		String user_type = (String)session.getAttribute("USER_TYPE")==null?"":(String)session.getAttribute("USER_TYPE");
		if(!user_type.equals("A")){
			response.sendRedirect("/admin");
			return false;
		}
		return true;
	}
	
}
