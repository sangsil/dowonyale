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
import admin.service.AdminVoucherService;

import common.controller.BaseController;
import common.vo.SearchVo;
import common.vo.VoucherVo;


@Controller
public class AdminVoucherController extends BaseController{
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(AdminVoucherController.class);
	
	@Autowired
	private AdminVoucherService adminVoucherService;
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
	@RequestMapping(value = "/admin/voucherList")
    public String voucherList(SearchVo searchVo, ModelMap modelMap) {
		int maxRows = searchVo.getMaxRows();
		if(maxRows == 0) searchVo.setMaxRows(40);

		modelMap.putAll(adminVoucherService.voucherList(searchVo));
		
		modelMap.put("result_gwamokList", adminUserService.com_cd_list(gwamok));
		modelMap.put("result_suyeop_gubunList", adminUserService.com_cd_list(suyeop_gubun));
		
        return "/admin/voucherList";
    }
	@RequestMapping(value = "/admin/voucherListExcel")
	public String voucherListExcel(SearchVo searchVo, ModelMap modelMap) {
		modelMap.putAll(adminVoucherService.voucherListExcel(searchVo));
		return "/admin/voucherListExcel";
	}

	
	@RequestMapping(value = "/admin/voucherDuplChk")
	public void voucherDuplChk(HttpServletRequest req, HttpServletResponse res) throws IOException{
		SearchVo searchVo = new SearchVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(searchVo);
		binder.bind(req);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminVoucherService.voucherDuplChk(searchVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/voucherInsert")
	public void voucherInsert(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		VoucherVo voucherVo = new VoucherVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(voucherVo);
		binder.bind(req);
		
		voucherVo.setIn_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminVoucherService.voucherInsert(voucherVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/voucherUpdate")
	public void voucherUpdate(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		VoucherVo voucherVo = new VoucherVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(voucherVo);
		binder.bind(req);
		
		voucherVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminVoucherService.voucherUpdate(voucherVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/voucherDelete")
	public void voucherDelete(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		VoucherVo voucherVo = new VoucherVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(voucherVo);
		binder.bind(req);

		voucherVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminVoucherService.voucherDelete(voucherVo));
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/voucherDeleteCancel")
	public void voucherDeleteCancel(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		VoucherVo voucherVo = new VoucherVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(voucherVo);
		binder.bind(req);
		
		voucherVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminVoucherService.voucherDeleteCancel(voucherVo));
		getResultJsonPW(resultMap, res);
	}
	
}
