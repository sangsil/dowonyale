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

import admin.service.AdminGongjiService;

import common.controller.BaseController;
import common.vo.BoardVo;
import common.vo.SearchVo;


@Controller
public class AdminGongjiController extends BaseController{
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(AdminGongjiController.class);
	
	private static final String board_gbn = "1";
	
	@Autowired
	private AdminGongjiService adminGongjiService;
	
	/**
	 * 리스트
	 * @param searchVo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/admin/gongjiList")
    public String gongjiList(SearchVo searchVo, ModelMap modelMap) {
		int maxRows = searchVo.getMaxRows();
		if(maxRows == 0) searchVo.setMaxRows(40);
		searchVo.setBoard_gbn(board_gbn);
		modelMap.putAll(adminGongjiService.gongjiList(searchVo));
        return "/admin/gongjiList";
    }
	@RequestMapping(value = "/admin/gongjiListExcel")
	public String gongjiListExcel(SearchVo searchVo, ModelMap modelMap) {
		searchVo.setBoard_gbn(board_gbn);
		modelMap.putAll(adminGongjiService.gongjiListExcel(searchVo));
		return "/admin/gongjiListExcel";
	}
	
	@RequestMapping(value = "/admin/gongjiInsert")
	public void gongjiInsert(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		BoardVo boardVo = new BoardVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(boardVo);
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
//			boardVo.setFileList(tempList);
//		}		
		/*	//첨부파일*/
		
		boardVo.setBoard_gbn(board_gbn);
		boardVo.setIn_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminGongjiService.gongjiInsert(boardVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/gongjiInUpForm")
	public String gongjiInUpForm(HttpServletRequest req, HttpServletResponse res, ModelMap modelMap) {
		SearchVo searchVo = new SearchVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(searchVo);
		binder.bind(req);
		
		//등록폼
		if(searchVo.getBoard_id() == null || searchVo.getBoard_id() ==""){
			return "/admin/gongjiInUpForm";
		}
		
		searchVo.setBoard_gbn(board_gbn);
		modelMap.putAll(adminGongjiService.gongji_detail(searchVo));
		return "/admin/gongjiInUpForm";
	}
	
	
	@RequestMapping(value = "/admin/gongjiUpdate")
	public void gongjiUpdate(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		BoardVo boardVo = new BoardVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(boardVo);
		binder.bind(req);
		
		boardVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminGongjiService.gongjiUpdate(boardVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/gongjiDelete")
	public void gongjiDelete(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		BoardVo boardVo = new BoardVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(boardVo);
		binder.bind(req);

		boardVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminGongjiService.gongjiDelete(boardVo));
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/gongjiDeleteCancel")
	public void gongjiDeleteCancel(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		BoardVo boardVo = new BoardVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(boardVo);
		binder.bind(req);
		
		boardVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminGongjiService.gongjiDeleteCancel(boardVo));
		getResultJsonPW(resultMap, res);
	}
	
}
