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

import admin.service.AdminBiyongService;

import common.controller.BaseController;
import common.vo.BiyongVo;
import common.vo.SearchVo;


@Controller
public class AdminBiyongController extends BaseController{
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(AdminBiyongController.class);
	
	@Autowired
	private AdminBiyongService adminBiyongService;
	
	/**
	 * 리스트
	 * @param searchVo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/admin/biyongList")
    public String biyongList(SearchVo searchVo, ModelMap modelMap) {
		int maxRows = searchVo.getMaxRows();
		if(maxRows == 0) searchVo.setMaxRows(40);
		modelMap.putAll(adminBiyongService.biyongList(searchVo));
		modelMap.putAll(adminBiyongService.biyong_detail(searchVo));
        return "/admin/biyongList";
    }
	@RequestMapping(value = "/admin/biyongListExcel")
	public String biyongListExcel(SearchVo searchVo, ModelMap modelMap) {
		modelMap.putAll(adminBiyongService.biyongListExcel(searchVo));
		return "/admin/biyongListExcel";
	}
	
	@RequestMapping(value = "/admin/biyongInsert")
	public void biyongInsert(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		BiyongVo biyongVo = new BiyongVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(biyongVo);
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
//			biyongVo.setFileList(tempList);
//		}		
		/*	//첨부파일*/
		
		biyongVo.setIn_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminBiyongService.biyongInsert(biyongVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/biyongUpdate")
	public void biyongUpdate(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		BiyongVo biyongVo = new BiyongVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(biyongVo);
		binder.bind(req);
		
		biyongVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminBiyongService.biyongUpdate(biyongVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/biyongDelete")
	public void biyongDelete(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		BiyongVo biyongVo = new BiyongVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(biyongVo);
		binder.bind(req);

		biyongVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminBiyongService.biyongDelete(biyongVo));
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/biyongDeleteCancel")
	public void biyongDeleteCancel(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		BiyongVo biyongVo = new BiyongVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(biyongVo);
		binder.bind(req);
		
		biyongVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminBiyongService.biyongDeleteCancel(biyongVo));
		getResultJsonPW(resultMap, res);
	}
	
}
