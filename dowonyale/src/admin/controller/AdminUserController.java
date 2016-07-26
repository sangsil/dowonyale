package admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.service.AdminUserService;

import common.controller.BaseController;
import common.vo.SearchVo;
import common.vo.UserVo;


@Controller
public class AdminUserController extends BaseController{
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(AdminUserController.class);
	
	@Autowired
	private AdminUserService adminUserService;
	
	/**
	 * 리스트
	 * @param searchVo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/admin/userList")
    public String userList(SearchVo searchVo, ModelMap modelMap) {
		int maxRows = searchVo.getMaxRows();
		if(maxRows == 0) searchVo.setMaxRows(40);

		modelMap.putAll(adminUserService.userList(searchVo));
        return "/admin/userList";
    }
	@RequestMapping(value = "/admin/userListExcel")
	public String userListExcel(SearchVo searchVo, ModelMap modelMap) {
		modelMap.putAll(adminUserService.userListExcel(searchVo));
		return "/admin/userListExcel";
	}

	
	@RequestMapping(value = "/admin/userDuplChk")
	public void userDuplChk(HttpServletRequest req, HttpServletResponse res) throws IOException{
		SearchVo searchVo = new SearchVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(searchVo);
		binder.bind(req);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminUserService.userDuplChk(searchVo));
		
		getResultJsonPW(resultMap, res);
	}

	@RequestMapping(value = "/admin/userEmailDuplChk")
	public void userEmailDuplChk(HttpServletRequest req, HttpServletResponse res) throws IOException{
		UserVo userVo = new UserVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(userVo);
		binder.bind(req);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminUserService.userEmailDuplChk(userVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/userInsert")
	public void userInsert(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		UserVo userVo = new UserVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(userVo);
		binder.bind(req);
		
		userVo.setIn_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminUserService.userInsert(userVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/userUpdate")
	public void userUpdate(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		UserVo userVo = new UserVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(userVo);
		binder.bind(req);
		
		userVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminUserService.userUpdate(userVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/userDelete")
	public void userDelete(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		UserVo userVo = new UserVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(userVo);
		binder.bind(req);

		userVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminUserService.userDelete(userVo));
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/userDeleteCancel")
	public void userDeleteCancel(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		UserVo userVo = new UserVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(userVo);
		binder.bind(req);
		
		userVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminUserService.userDeleteCancel(userVo));
		getResultJsonPW(resultMap, res);
	}
	
}
