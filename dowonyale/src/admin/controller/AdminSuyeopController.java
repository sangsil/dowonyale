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

import admin.service.AdminSuyeopService;
import admin.service.AdminUserService;

import common.controller.BaseController;
import common.vo.SearchVo;
import common.vo.SuyeopVo;
import common.vo.SuyeopryoVo;
import common.vo.VoucherVo;


@Controller
public class AdminSuyeopController extends BaseController{
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(AdminSuyeopController.class);
	
	@Autowired
	private AdminSuyeopService adminSuyeopService;
	@Autowired
	private AdminUserService adminUserService;
	
	private final String gwamok = "101";
	private final String singyu = "102";
	private final String suyeop_gubun = "103";
	private final String napip_gbn = "104";
	
	/**
	 * 리스트
	 * @param searchVo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/admin/suyeopList")
    public String suyeopList(SearchVo searchVo, ModelMap modelMap) {
		int maxRows = searchVo.getMaxRows();
		if(maxRows == 0) searchVo.setMaxRows(40);

		modelMap.putAll(adminSuyeopService.suyeopList(searchVo));
		
		modelMap.put("result_gwamokList", adminUserService.com_cd_list(gwamok));
		modelMap.put("result_singyuList", adminUserService.com_cd_list(singyu));
		modelMap.put("result_suyeop_gubunList", adminUserService.com_cd_list(suyeop_gubun));
		modelMap.put("result_napip_gbnList", adminUserService.com_cd_list(napip_gbn));
		
		modelMap.put("result_teacherList", adminUserService.com_teacher_list());
		modelMap.put("result_adongList", adminUserService.com_adong_list());
		
        return "/admin/suyeopList";
    }
	@RequestMapping(value = "/admin/suyeopListExcel")
	public String suyeopListExcel(SearchVo searchVo, ModelMap modelMap) {
		modelMap.putAll(adminSuyeopService.suyeopListExcel(searchVo));
		return "/admin/suyeopListExcel";
	}

	
	@RequestMapping(value = "/admin/suyeopDuplChk")
	public void suyeopDuplChk(HttpServletRequest req, HttpServletResponse res) throws IOException{
		SearchVo searchVo = new SearchVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(searchVo);
		binder.bind(req);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminSuyeopService.suyeopDuplChk(searchVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/suyeopInsert")
	public void suyeopInsert(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		SuyeopVo suyeopVo = new SuyeopVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(suyeopVo);
		binder.bind(req);
		
		suyeopVo.setIn_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminSuyeopService.suyeopInsert(suyeopVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/suyeopUpdate")
	public void suyeopUpdate(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		SuyeopVo suyeopVo = new SuyeopVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(suyeopVo);
		binder.bind(req);
		
		suyeopVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminSuyeopService.suyeopUpdate(suyeopVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/suyeopDelete")
	public void suyeopDelete(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		SuyeopVo suyeopVo = new SuyeopVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(suyeopVo);
		binder.bind(req);

		suyeopVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminSuyeopService.suyeopDelete(suyeopVo));
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/suyeopDeleteCancel")
	public void suyeopDeleteCancel(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		SuyeopVo suyeopVo = new SuyeopVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(suyeopVo);
		binder.bind(req);
		
		suyeopVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminSuyeopService.suyeopDeleteCancel(suyeopVo));
		getResultJsonPW(resultMap, res);
	}
	
	/**
	 * 아동선택시 정보가져오기
	 * @param req
	 * @param res
	 * @param session
	 * @throws IOException
	 */
	@RequestMapping(value = "/admin/suyeopSelectAdong")
	public void suyeopSelectAdong(String adong_id, HttpServletResponse res) throws IOException{
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		VoucherVo voucherVo = new VoucherVo();
		voucherVo = adminSuyeopService.suyeopSelectAdong(adong_id);
		if(voucherVo == null){
			voucherVo = new VoucherVo();
		}
		resultMap.put("result_voucher", voucherVo);
		getResultJsonPW(resultMap, res);
	}

	/**
	 * 수업선택시 수업료 가져옴
	 * @param adong_id
	 * @param res
	 * @throws IOException
	 */
	@RequestMapping(value = "/admin/suyeopSelectSuyeopryo")
	public void suyeopSelectSuyeopryo(String suyeop_gubun, String gwamok, HttpServletResponse res) throws IOException{
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		SuyeopryoVo suyeopryoVo = new SuyeopryoVo();
		suyeopryoVo = adminSuyeopService.suyeopSelectSuyeopryo(suyeop_gubun, gwamok);
		if(suyeopryoVo == null){
			suyeopryoVo = new SuyeopryoVo();
		}
		resultMap.put("result_suyeopryo", suyeopryoVo);
		getResultJsonPW(resultMap, res);
	}
	
}
