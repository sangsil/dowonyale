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

import admin.service.AdminSuyeopryoService;
import admin.service.AdminUserService;

import common.controller.BaseController;
import common.vo.SearchVo;
import common.vo.SuyeopryoVo;


@Controller
public class AdminSuyeopryoController extends BaseController{
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(AdminSuyeopryoController.class);
	
	@Autowired
	private AdminSuyeopryoService adminSuyeopryoService;
	@Autowired
	private AdminUserService adminUserService;
	
	private final String gwamok = "101";
	private final String suyeop_gubun = "103";
	
	/**
	 * 리스트
	 * @param searchVo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/admin/suyeopryoList")
    public String suyeopryoList(SearchVo searchVo, ModelMap modelMap) {
		int maxRows = searchVo.getMaxRows();
		if(maxRows == 0) searchVo.setMaxRows(40);

		modelMap.putAll(adminSuyeopryoService.suyeopryoList(searchVo));
		
		modelMap.put("result_gwamokList", adminUserService.com_cd_list(gwamok));
		modelMap.put("result_suyeop_gubunList", adminUserService.com_cd_list(suyeop_gubun));
		
        return "/admin/suyeopryoList";
    }
	@RequestMapping(value = "/admin/suyeopryoListExcel")
	public String suyeopryoListExcel(SearchVo searchVo, ModelMap modelMap) {
		modelMap.putAll(adminSuyeopryoService.suyeopryoListExcel(searchVo));
		return "/admin/suyeopryoListExcel";
	}

	
	@RequestMapping(value = "/admin/suyeopryoDuplChk")
	public void suyeopryoDuplChk(HttpServletRequest req, HttpServletResponse res) throws IOException{
		SearchVo searchVo = new SearchVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(searchVo);
		binder.bind(req);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminSuyeopryoService.suyeopryoDuplChk(searchVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/suyeopryoInsert")
	public void suyeopryoInsert(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		SuyeopryoVo suyeopryoVo = new SuyeopryoVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(suyeopryoVo);
		binder.bind(req);
		
		suyeopryoVo.setIn_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminSuyeopryoService.suyeopryoInsert(suyeopryoVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/suyeopryoUpdate")
	public void suyeopryoUpdate(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		SuyeopryoVo suyeopryoVo = new SuyeopryoVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(suyeopryoVo);
		binder.bind(req);
		
		suyeopryoVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminSuyeopryoService.suyeopryoUpdate(suyeopryoVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/suyeopryoDelete")
	public void suyeopryoDelete(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		SuyeopryoVo suyeopryoVo = new SuyeopryoVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(suyeopryoVo);
		binder.bind(req);

		suyeopryoVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminSuyeopryoService.suyeopryoDelete(suyeopryoVo));
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/suyeopryoDeleteCancel")
	public void suyeopryoDeleteCancel(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		SuyeopryoVo suyeopryoVo = new SuyeopryoVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(suyeopryoVo);
		binder.bind(req);
		
		suyeopryoVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminSuyeopryoService.suyeopryoDeleteCancel(suyeopryoVo));
		getResultJsonPW(resultMap, res);
	}
	
}
