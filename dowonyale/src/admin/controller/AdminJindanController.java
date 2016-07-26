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

import admin.service.AdminJindanService;
import admin.service.AdminUserService;

import common.controller.BaseController;
import common.vo.JindanVo;
import common.vo.SearchVo;


@Controller
public class AdminJindanController extends BaseController{
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(AdminJindanController.class);
	
	@Autowired
	private AdminJindanService adminJindanService;
	@Autowired
	private AdminUserService adminUserService;
	
	private static final String jindan = "106";
	/**
	 * 리스트
	 * @param searchVo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/admin/jindanList")
    public String jindanList(HttpServletRequest req, HttpServletResponse res, ModelMap modelMap) {
		SearchVo searchVo = new SearchVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(searchVo);
		binder.bind(req);
		
		int maxRows = searchVo.getMaxRows();
		if(maxRows == 0) searchVo.setMaxRows(100);
		
		modelMap.put("result_jindanList", adminUserService.com_cd_list_desc(jindan));
		modelMap.putAll(adminJindanService.jindanList(searchVo));
        return "/admin/jindanList";
    }
	@RequestMapping(value = "/admin/jindanListExcel")
	public String jindanListExcel(HttpServletRequest req, HttpServletResponse res, ModelMap modelMap) {
		SearchVo searchVo = new SearchVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(searchVo);
		binder.bind(req);
		
		searchVo.setMaxRows(10000);
		modelMap.putAll(adminJindanService.jindanListExcel(searchVo));
		return "/admin/jindanListExcel";
	}
	
	@RequestMapping(value = "/admin/jindanInsert")
	public void jindanInsert(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		JindanVo jindanVo = new JindanVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(jindanVo);
		binder.bind(req);

		jindanVo.setArr_jindan_sub_quest_no(req.getParameterValues("jindan_sub_quest_no"));
		jindanVo.setArr_jindan_txt(req.getParameterValues("jindan_txt"));
		
		jindanVo.setIn_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminJindanService.jindanInsert(jindanVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/jindanDetail")
	public void jindanDetail(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		JindanVo jindanVo = new JindanVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(jindanVo);
		binder.bind(req);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.putAll(adminJindanService.jindanDetail(jindanVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/jindanUpdate")
	public void jindanUpdate(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		JindanVo jindanVo = new JindanVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(jindanVo);
		binder.bind(req);
		
		jindanVo.setArr_jindan_sub_quest_no(req.getParameterValues("jindan_sub_quest_no"));
		jindanVo.setArr_jindan_txt(req.getParameterValues("jindan_txt"));
		
		jindanVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminJindanService.jindanUpdate(jindanVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/jindanDelete")
	public void jindanDelete(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		JindanVo jindanVo = new JindanVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(jindanVo);
		binder.bind(req);

		jindanVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminJindanService.jindanDelete(jindanVo));
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/jindanDeleteCancel")
	public void jindanDeleteCancel(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		JindanVo jindanVo = new JindanVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(jindanVo);
		binder.bind(req);
		
		jindanVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminJindanService.jindanDeleteCancel(jindanVo));
		getResultJsonPW(resultMap, res);
	}
	
}
