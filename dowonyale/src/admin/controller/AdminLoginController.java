package admin.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.service.AdminLoginService;

import common.controller.BaseController;
import common.vo.UserVo;


@Controller
public class AdminLoginController extends BaseController{
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(AdminLoginController.class);
	
	@Autowired
    private AdminLoginService adminLoginService;
	
	@RequestMapping(value = "/admin/main")
    public String main(HttpSession session) {
		if(session.getAttribute("USER_TYPE") == null){
			return "/admin/login";
		}
		//전체관리자와 선생님 권한만 접속가능
		else if(session.getAttribute("USER_TYPE").equals("A")){
			return "/admin/main";
		}
		else if(session.getAttribute("USER_TYPE").equals("T")){
			return "redirect:/admin/adongList.dowon";
		}
		else{
			return "/admin/login";
		}
    }
	@RequestMapping(value = "/admin/login")    
    public @ResponseBody String login(UserVo userVo, ModelMap modelMap, HttpSession session) {
		
		String loginYn = "N";
		modelMap.putAll(adminLoginService.getLogin(userVo));

		if(modelMap.get("resultValue") != null)
		{
			session.setAttribute("ID", ((UserVo)modelMap.get("resultValue")).getId());
			session.setAttribute("USER_ID", ((UserVo)modelMap.get("resultValue")).getUser_id());
			session.setAttribute("USER_NAME", ((UserVo)modelMap.get("resultValue")).getUser_name());
			session.setAttribute("USER_TYPE", ((UserVo)modelMap.get("resultValue")).getUser_type());
			session.setAttribute("LOGIN_GBN", ((UserVo)modelMap.get("resultValue")).getLogin_gbn());
			loginYn = ((UserVo)modelMap.get("resultValue")).getUser_type();
			
			adminLoginService.updateLoginInfo(session.getAttribute("USER_ID").toString());
			
		}
		return loginYn;
    }
	
	@RequestMapping(value = "/admin/logout")    
	public String logout(HttpSession session) {
		session.invalidate();
		return "/admin/login";
	}
	

	
	
}
