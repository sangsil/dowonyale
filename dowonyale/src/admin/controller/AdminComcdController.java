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

import admin.service.AdminComcdService;
import admin.service.AdminVoucherService;

import common.controller.BaseController;
import common.vo.ComcdVo;
import common.vo.SearchVo;


@Controller
public class AdminComcdController extends BaseController{
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(AdminComcdController.class);
	
	@Autowired
	private AdminComcdService adminComcdService;
	@Autowired
	private AdminVoucherService adminVoucherService;
	
	/**
	 * 리스트
	 * @param searchVo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/admin/comcdList")
    public String comcdList(SearchVo searchVo, ModelMap modelMap) {
		int maxRows = searchVo.getMaxRows();
		if(maxRows == 0) searchVo.setMaxRows(40);
		modelMap.putAll(adminComcdService.comcdList(searchVo));
        return "/admin/comcdList";
    }
	@RequestMapping(value = "/admin/comcdListExcel")
	public String comcdListExcel(SearchVo searchVo, ModelMap modelMap) {
		modelMap.putAll(adminComcdService.comcdListExcel(searchVo));
		return "/admin/comcdListExcel";
	}

	
	@RequestMapping(value = "/admin/comcdDuplChk")
	public void comcdDuplChk(HttpServletRequest req, HttpServletResponse res) throws IOException{
		SearchVo searchVo = new SearchVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(searchVo);
		binder.bind(req);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminComcdService.comcdDuplChk(searchVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/comcdInsert")
	public void comcdInsert(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		ComcdVo comcdVo = new ComcdVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(comcdVo);
		binder.bind(req);
		
		comcdVo.setIn_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminComcdService.comcdInsert(comcdVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/comcdUpdate")
	public void comcdUpdate(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		ComcdVo comcdVo = new ComcdVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(comcdVo);
		binder.bind(req);
		
		comcdVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminComcdService.comcdUpdate(comcdVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/comcdDelete")
	public void comcdDelete(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		ComcdVo comcdVo = new ComcdVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(comcdVo);
		binder.bind(req);

		comcdVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminComcdService.comcdDelete(comcdVo));
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/comcdDeleteCancel")
	public void comcdDeleteCancel(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		ComcdVo comcdVo = new ComcdVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(comcdVo);
		binder.bind(req);
		
		comcdVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminComcdService.comcdDeleteCancel(comcdVo));
		getResultJsonPW(resultMap, res);
	}
	
	
	@RequestMapping(value = "/admin/comcdDetail")
    public String comcdDetail(String cd_id, ModelMap modelMap) {
		modelMap.putAll(adminComcdService.comcdDetail(cd_id));
        return "/admin/comcdDetail";
    }
}
