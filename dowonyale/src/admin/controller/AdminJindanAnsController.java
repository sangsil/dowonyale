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

import admin.service.AdminJindanAnsService;
import admin.service.AdminUserService;

import common.controller.BaseController;
import common.vo.JindanVo;
import common.vo.SearchVo;


@Controller
public class AdminJindanAnsController extends BaseController{
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(AdminJindanAnsController.class);
	
	@Autowired
	private AdminJindanAnsService adminJindanAnsService;
	@Autowired
	private AdminUserService adminUserService;
	
	private static final String jindan = "106";

	/**
	 * 리스트
	 * @param searchVo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/admin/jindanAnsList")
    public String jindanAnsList(HttpServletRequest req, HttpServletResponse res, ModelMap modelMap) {
		SearchVo searchVo = new SearchVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(searchVo);
		binder.bind(req);
		
		int maxRows = searchVo.getMaxRows();
		if(maxRows == 0) searchVo.setMaxRows(100);
		
		modelMap.put("result_jindanAnsList", adminUserService.com_cd_list_desc(jindan));
		modelMap.putAll(adminJindanAnsService.jindanAnsList(searchVo));
        return "/admin/jindanAnsList";
    }
	@RequestMapping(value = "/admin/jindanAnsListExcel")
	public String jindanAnsListExcel(HttpServletRequest req, HttpServletResponse res, ModelMap modelMap) {
		SearchVo searchVo = new SearchVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(searchVo);
		binder.bind(req);
		
		modelMap.putAll(adminJindanAnsService.jindanAnsListExcel(searchVo));
		return "/admin/jindanAnsListExcel";
	}
	
	@RequestMapping(value = "/admin/jindanAnsDetail")
	public String jindanAnsDetail(HttpServletRequest req, HttpServletResponse res, ModelMap modelMap){
		JindanVo jindanVo = new JindanVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(jindanVo);
		binder.bind(req);
		
		modelMap.putAll(adminJindanAnsService.jindanAnsDetail(jindanVo));
		
		return "/admin/jindanAnsDetail";
	}
	
	@RequestMapping(value = "/admin/jindanAnsDelete")
	public void jindanAnsDelete(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		JindanVo jindanVo = new JindanVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(jindanVo);
		binder.bind(req);

		jindanVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminJindanAnsService.jindanAnsDelete(jindanVo));
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/jindanAnsDeleteCancel")
	public void jindanAnsDeleteCancel(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		JindanVo jindanVo = new JindanVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(jindanVo);
		binder.bind(req);
		
		jindanVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminJindanAnsService.jindanAnsDeleteCancel(jindanVo));
		getResultJsonPW(resultMap, res);
	}
	
}
