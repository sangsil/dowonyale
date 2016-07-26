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

import admin.service.AdminGyoukService;

import common.controller.BaseController;
import common.vo.BoardVo;
import common.vo.SearchVo;


@Controller
public class AdminGyoukController extends BaseController{
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(AdminGyoukController.class);
	
	private static final String board_gbn = "2";
	
	@Autowired
	private AdminGyoukService adminGyoukService;
	
	/**
	 * 리스트
	 * @param searchVo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/admin/gyoukList")
    public String gyoukList(SearchVo searchVo, ModelMap modelMap) {
		int maxRows = searchVo.getMaxRows();
		if(maxRows == 0) searchVo.setMaxRows(40);
		searchVo.setBoard_gbn(board_gbn);
		modelMap.putAll(adminGyoukService.gyoukList(searchVo));
        return "/admin/gyoukList";
    }
	@RequestMapping(value = "/admin/gyoukListExcel")
	public String gyoukListExcel(SearchVo searchVo, ModelMap modelMap) {
		searchVo.setBoard_gbn(board_gbn);
		modelMap.putAll(adminGyoukService.gyoukListExcel(searchVo));
		return "/admin/gyoukListExcel";
	}
	
	@RequestMapping(value = "/admin/gyoukInsert")
	public void gyoukInsert(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
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
		resultMap.put("result", adminGyoukService.gyoukInsert(boardVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/gyoukInUpForm")
	public String gyoukInUpForm(HttpServletRequest req, HttpServletResponse res, ModelMap modelMap) {
		SearchVo searchVo = new SearchVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(searchVo);
		binder.bind(req);
		
		//등록폼
		if(searchVo.getBoard_id() == null || searchVo.getBoard_id() ==""){
			return "/admin/gyoukInUpForm";
		}
		
		searchVo.setBoard_gbn(board_gbn);
		modelMap.putAll(adminGyoukService.gyouk_detail(searchVo));
		return "/admin/gyoukInUpForm";
	}
	
	
	@RequestMapping(value = "/admin/gyoukUpdate")
	public void gyoukUpdate(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		BoardVo boardVo = new BoardVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(boardVo);
		binder.bind(req);
		
		boardVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminGyoukService.gyoukUpdate(boardVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/gyoukDelete")
	public void gyoukDelete(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		BoardVo boardVo = new BoardVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(boardVo);
		binder.bind(req);

		boardVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminGyoukService.gyoukDelete(boardVo));
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/gyoukDeleteCancel")
	public void gyoukDeleteCancel(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		BoardVo boardVo = new BoardVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(boardVo);
		binder.bind(req);
		
		boardVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminGyoukService.gyoukDeleteCancel(boardVo));
		getResultJsonPW(resultMap, res);
	}
	
}
