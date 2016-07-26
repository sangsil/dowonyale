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

import admin.service.AdminOnlineService;

import common.controller.BaseController;
import common.vo.BoardVo;
import common.vo.SearchVo;


@Controller
public class AdminOnlineController extends BaseController{
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(AdminOnlineController.class);
	
	private static final String board_gbn = "3";
	
	@Autowired
	private AdminOnlineService adminOnlineService;
	
	/**
	 * 리스트
	 * @param searchVo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/admin/onlineList")
    public String onlineList(SearchVo searchVo, ModelMap modelMap) {
		int maxRows = searchVo.getMaxRows();
		if(maxRows == 0) searchVo.setMaxRows(40);
		searchVo.setBoard_gbn(board_gbn);
		modelMap.putAll(adminOnlineService.onlineList(searchVo));
        return "/admin/onlineList";
    }
	@RequestMapping(value = "/admin/onlineListExcel")
	public String onlineListExcel(SearchVo searchVo, ModelMap modelMap) {
		searchVo.setBoard_gbn(board_gbn);
		modelMap.putAll(adminOnlineService.onlineListExcel(searchVo));
		return "/admin/onlineListExcel";
	}
	
	@RequestMapping(value = "/admin/onlineInsert")
	public void onlineInsert(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
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
		resultMap.put("result", adminOnlineService.onlineInsert(boardVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/onlineInUpForm")
	public String onlineInUpForm(HttpServletRequest req, HttpServletResponse res, ModelMap modelMap) {
		SearchVo searchVo = new SearchVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(searchVo);
		binder.bind(req);
		
		//등록폼
		if(searchVo.getBoard_id() == null || searchVo.getBoard_id() ==""){
			return "/admin/onlineInUpForm";
		}
		
		searchVo.setBoard_gbn(board_gbn);
		modelMap.putAll(adminOnlineService.online_detail(searchVo));
		return "/admin/onlineInUpForm";
	}
	
	
	@RequestMapping(value = "/admin/onlineUpdate")
	public void onlineUpdate(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		BoardVo boardVo = new BoardVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(boardVo);
		binder.bind(req);
		
		boardVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminOnlineService.onlineUpdate(boardVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/onlineDelete")
	public void onlineDelete(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		BoardVo boardVo = new BoardVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(boardVo);
		binder.bind(req);

		boardVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminOnlineService.onlineDelete(boardVo));
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/onlineDeleteCancel")
	public void onlineDeleteCancel(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		BoardVo boardVo = new BoardVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(boardVo);
		binder.bind(req);
		
		boardVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminOnlineService.onlineDeleteCancel(boardVo));
		getResultJsonPW(resultMap, res);
	}
	
}
