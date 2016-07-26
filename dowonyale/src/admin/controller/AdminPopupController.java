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

import admin.service.AdminPopupService;

import common.controller.BaseController;
import common.vo.PopupVo;
import common.vo.SearchVo;


@Controller
public class AdminPopupController extends BaseController{
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(AdminPopupController.class);
	
	private static final String popup_gbn = "1";
	
	@Autowired
	private AdminPopupService adminPopupService;
	
	/**
	 * 리스트
	 * @param searchVo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/admin/popupList")
    public String popupList(SearchVo searchVo, ModelMap modelMap) {
		int maxRows = searchVo.getMaxRows();
		if(maxRows == 0) searchVo.setMaxRows(40);
		searchVo.setPopup_gbn(popup_gbn);
		modelMap.putAll(adminPopupService.popupList(searchVo));
        return "/admin/popupList";
    }
	@RequestMapping(value = "/admin/popupListExcel")
	public String popupListExcel(SearchVo searchVo, ModelMap modelMap) {
		searchVo.setPopup_gbn(popup_gbn);
		modelMap.putAll(adminPopupService.popupListExcel(searchVo));
		return "/admin/popupListExcel";
	}
	
	@RequestMapping(value = "/admin/popupInsert")
	public void popupInsert(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		PopupVo popupVo = new PopupVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(popupVo);
		binder.bind(req);
		
		/*	첨부파일*/
//		MultipartHttpServletRequest mreq = (MultipartHttpServletRequest) req;
//		Collection<MultipartFile> fileList =  mreq.getFileMap().values();
//		
//		System.out.println("--------------------------------------------------");
//		System.out.println(fileList.size());
//		System.out.println("--------------------------------------------------");
//		
//		if(fileList != null){	
//
//			FileVo fileVo = null;
//			List<FileVo> tempList = new ArrayList<FileVo>();
//			
//			for (final MultipartFile mf : fileList){			        
//				if(!mf.isEmpty()){
//					UUID uuid = UUID.randomUUID();
//						String tempFileName = uuid.toString();
//						fileVo = new FileVo();
//						fileVo.setFile_name(mf.getOriginalFilename());
//						fileVo.setFile_re_name(tempFileName);
//						fileVo.setFile_size(Long.toString(mf.getSize()));
//						tempList.add(fileVo);
//						mf.transferTo(new File(fileVo.getFile_path()+tempFileName));
//				}
//			}
//			
//			popupVo.setFileList(tempList);
//		}		
		/*	//첨부파일*/
		
		popupVo.setPopup_gbn(popup_gbn);
		popupVo.setIn_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminPopupService.popupInsert(popupVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/popupInUpForm")
	public String popupInUpForm(HttpServletRequest req, HttpServletResponse res, ModelMap modelMap) {
		SearchVo searchVo = new SearchVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(searchVo);
		binder.bind(req);
		
		//등록폼
		if(searchVo.getPopup_id() == null || searchVo.getPopup_id() ==""){
			return "/admin/popupInUpForm";
		}
		
		searchVo.setPopup_gbn(popup_gbn);
		modelMap.putAll(adminPopupService.popup_detail(searchVo));
		return "/admin/popupInUpForm";
	}
	
	
	@RequestMapping(value = "/admin/popupUpdate")
	public void popupUpdate(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		PopupVo popupVo = new PopupVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(popupVo);
		binder.bind(req);
		
		popupVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminPopupService.popupUpdate(popupVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/popupDelete")
	public void popupDelete(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		PopupVo popupVo = new PopupVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(popupVo);
		binder.bind(req);

		popupVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminPopupService.popupDelete(popupVo));
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/popupDeleteCancel")
	public void popupDeleteCancel(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		PopupVo popupVo = new PopupVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(popupVo);
		binder.bind(req);
		
		popupVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminPopupService.popupDeleteCancel(popupVo));
		getResultJsonPW(resultMap, res);
	}
	
}
