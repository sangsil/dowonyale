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

import admin.service.AdminChiryosaService;

import common.controller.BaseController;
import common.vo.ChiryosaVo;
import common.vo.SearchVo;


@Controller
public class AdminChiryosaController extends BaseController{
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(AdminChiryosaController.class);
	
	@Autowired
	private AdminChiryosaService adminChiryosaService;
	
	/**
	 * 리스트
	 * @param searchVo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/admin/chiryosaList")
    public String chiryosaList(SearchVo searchVo, ModelMap modelMap) {
		int maxRows = searchVo.getMaxRows();
		if(maxRows == 0) searchVo.setMaxRows(40);
		modelMap.putAll(adminChiryosaService.chiryosaList(searchVo));
		modelMap.putAll(adminChiryosaService.chiryosa_detail(searchVo));
        return "/admin/chiryosaList";
    }
	@RequestMapping(value = "/admin/chiryosaListExcel")
	public String chiryosaListExcel(SearchVo searchVo, ModelMap modelMap) {
		modelMap.putAll(adminChiryosaService.chiryosaListExcel(searchVo));
		return "/admin/chiryosaListExcel";
	}
	
	@RequestMapping(value = "/admin/chiryosaInsert")
	public void chiryosaInsert(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		ChiryosaVo chiryosaVo = new ChiryosaVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(chiryosaVo);
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
//			chiryosaVo.setFileList(tempList);
//		}		
		/*	//첨부파일*/
		
		chiryosaVo.setIn_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminChiryosaService.chiryosaInsert(chiryosaVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/chiryosaUpdate")
	public void chiryosaUpdate(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		ChiryosaVo chiryosaVo = new ChiryosaVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(chiryosaVo);
		binder.bind(req);
		
		chiryosaVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminChiryosaService.chiryosaUpdate(chiryosaVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/chiryosaDelete")
	public void chiryosaDelete(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		ChiryosaVo chiryosaVo = new ChiryosaVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(chiryosaVo);
		binder.bind(req);

		chiryosaVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminChiryosaService.chiryosaDelete(chiryosaVo));
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/chiryosaDeleteCancel")
	public void chiryosaDeleteCancel(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		ChiryosaVo chiryosaVo = new ChiryosaVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(chiryosaVo);
		binder.bind(req);
		
		chiryosaVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminChiryosaService.chiryosaDeleteCancel(chiryosaVo));
		getResultJsonPW(resultMap, res);
	}
	
}
