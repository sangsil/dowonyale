package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import common.vo.LogVo;
import admin.controller.AdminLogController;

public class ComAuthCheckInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	AdminLogController adminLogController;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		// session 검사
		HttpSession session = request.getSession(false);
		// 로그 적재
		LogVo logVo = new LogVo();
		
		if(request.getRequestURI().endsWith(".dowon")){
			logVo.setLog_url(request.getRequestURI());
			request.setAttribute("logVo", logVo);
			adminLogController.logInsert(request, response, session);	
		}
		
		return true;
	}
	
}
