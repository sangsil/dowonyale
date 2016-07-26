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

import admin.service.AdminAdongService;
import admin.service.AdminVoucherService;

import common.controller.BaseController;
import common.vo.AdongVo;
import common.vo.SearchVo;


@Controller
public class AdminAdongController extends BaseController{
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(AdminAdongController.class);
	
	@Autowired
	private AdminAdongService adminAdongService;
	@Autowired
	private AdminVoucherService adminVoucherService;
	
	/**
	 * 리스트
	 * @param searchVo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/admin/adongList")
    public String adongList(SearchVo searchVo, ModelMap modelMap) {
		int maxRows = searchVo.getMaxRows();
		if(maxRows == 0) searchVo.setMaxRows(40);

		modelMap.putAll(adminAdongService.adongList(searchVo));
		
		//파우처목록
		modelMap.putAll(adminVoucherService.voucherAllList(searchVo));
		
        return "/admin/adongList";
    }
	@RequestMapping(value = "/admin/adongListExcel")
	public String adongListExcel(SearchVo searchVo, ModelMap modelMap) {
		modelMap.putAll(adminAdongService.adongListExcel(searchVo));
		return "/admin/adongListExcel";
	}

	
	@RequestMapping(value = "/admin/adongDuplChk")
	public void adongDuplChk(HttpServletRequest req, HttpServletResponse res) throws IOException{
		SearchVo searchVo = new SearchVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(searchVo);
		binder.bind(req);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminAdongService.adongDuplChk(searchVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/adongInsert")
	public void adongInsert(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		AdongVo adongVo = new AdongVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(adongVo);
		binder.bind(req);
		
		adongVo.setIn_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminAdongService.adongInsert(adongVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/adongUpdate")
	public void adongUpdate(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		AdongVo adongVo = new AdongVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(adongVo);
		binder.bind(req);
		
		adongVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminAdongService.adongUpdate(adongVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/adongDelete")
	public void adongDelete(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		AdongVo adongVo = new AdongVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(adongVo);
		binder.bind(req);

		adongVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminAdongService.adongDelete(adongVo));
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/adongDeleteCancel")
	public void adongDeleteCancel(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		AdongVo adongVo = new AdongVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(adongVo);
		binder.bind(req);
		
		adongVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminAdongService.adongDeleteCancel(adongVo));
		getResultJsonPW(resultMap, res);
	}
	
}
