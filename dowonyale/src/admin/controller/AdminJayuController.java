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

import admin.service.AdminJayuService;

import common.controller.BaseController;
import common.vo.BoardVo;
import common.vo.SearchVo;


@Controller
public class AdminJayuController extends BaseController{
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(AdminJayuController.class);
	
	private static final String board_gbn = "4";
	
	@Autowired
	private AdminJayuService adminJayuService;
	
	/**
	 * 리스트
	 * @param searchVo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/admin/jayuList")
    public String jayuList(SearchVo searchVo, ModelMap modelMap) {
		int maxRows = searchVo.getMaxRows();
		if(maxRows == 0) searchVo.setMaxRows(40);
		searchVo.setBoard_gbn(board_gbn);
		modelMap.putAll(adminJayuService.jayuList(searchVo));
        return "/admin/jayuList";
    }
	@RequestMapping(value = "/admin/jayuListExcel")
	public String jayuListExcel(SearchVo searchVo, ModelMap modelMap) {
		searchVo.setBoard_gbn(board_gbn);
		modelMap.putAll(adminJayuService.jayuListExcel(searchVo));
		return "/admin/jayuListExcel";
	}
	
	@RequestMapping(value = "/admin/jayuInsert")
	public void jayuInsert(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
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
		resultMap.put("result", adminJayuService.jayuInsert(boardVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/jayuInUpForm")
	public String jayuInUpForm(HttpServletRequest req, HttpServletResponse res, ModelMap modelMap) {
		SearchVo searchVo = new SearchVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(searchVo);
		binder.bind(req);
		
		//등록폼
		if(searchVo.getBoard_id() == null || searchVo.getBoard_id() ==""){
			return "/admin/jayuInUpForm";
		}
		
		searchVo.setBoard_gbn(board_gbn);
		modelMap.putAll(adminJayuService.jayu_detail(searchVo));
		return "/admin/jayuInUpForm";
	}
	
	
	@RequestMapping(value = "/admin/jayuUpdate")
	public void jayuUpdate(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		BoardVo boardVo = new BoardVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(boardVo);
		binder.bind(req);
		
		boardVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminJayuService.jayuUpdate(boardVo));
		
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/jayuDelete")
	public void jayuDelete(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		BoardVo boardVo = new BoardVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(boardVo);
		binder.bind(req);

		boardVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminJayuService.jayuDelete(boardVo));
		getResultJsonPW(resultMap, res);
	}
	
	@RequestMapping(value = "/admin/jayuDeleteCancel")
	public void jayuDeleteCancel(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException{
		BoardVo boardVo = new BoardVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(boardVo);
		binder.bind(req);
		
		boardVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminJayuService.jayuDeleteCancel(boardVo));
		getResultJsonPW(resultMap, res);
	}
	
}
