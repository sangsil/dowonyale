package user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import admin.service.AdminEmailService;
import user.service.KeomuService;
import common.controller.BaseController;
import common.controller.MailService;
import common.vo.BoardVo;
import common.vo.EmailVo;
import common.vo.SearchVo;

@Controller
public class KeomuController extends BaseController{
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(KeomuController.class);
	
	private static final String board_gongji = "1";
	private static final String board_gyoyuk = "2";
	private static final String board_online = "3";
	private static final String board_jayu = "4";
	
	@Autowired
	private KeomuService keomuService;
	@Autowired
	private AdminEmailService adminEmailService;
	@Autowired
	private MailService mailService;
	
	@Value("#{config['EMAIL_TYPE_BOARD']}") String email_type_board;
	@Value("#{config['ADMIN_MAILE_ADDRESS']}") String adminMailAddress;
	
	/**
	 * 커뮤니티
	 * @param userVo
	 * @param modelMap
	 * @param session
	 * @return
	 */
	//s:공지사항
	@RequestMapping(value = "/user/keomu_gongji", method=RequestMethod.GET)
    public String gongjiList(SearchVo searchVo, ModelMap modelMap) {
		int maxRows = searchVo.getMaxRows();
		if(maxRows == 0) searchVo.setMaxRows(40);
		searchVo.setBoard_gbn(board_gongji);
		modelMap.putAll(keomuService.gongjiList(searchVo));
        return "/user/keomu_gongji";
    }
	@RequestMapping(value = "/user/keomu_gongji_detail", method=RequestMethod.POST)
	public String gongji_detail(SearchVo searchVo, ModelMap modelMap) {
		searchVo.setBoard_gbn(board_gongji);
		
		modelMap.put("pre_board_id", keomuService.pre_board_id(searchVo));
		modelMap.put("next_board_id", keomuService.next_board_id(searchVo));
		
		keomuService.addHitCnt(searchVo);
		modelMap.putAll(keomuService.gongji_detail(searchVo));
		return "/user/keomu_gongji_detail";
	}
	//e:공지사항
	
	//s:교육공지
	@RequestMapping(value = "/user/keomu_gyoyuk", method=RequestMethod.GET)
	public String gyoyukList(SearchVo searchVo, ModelMap modelMap) {
		int maxRows = searchVo.getMaxRows();
		if(maxRows == 0) searchVo.setMaxRows(40);
		searchVo.setBoard_gbn(board_gyoyuk);
		modelMap.putAll(keomuService.gongjiList(searchVo));
		return "/user/keomu_gyoyuk";
	}
	@RequestMapping(value = "/user/keomu_gyoyuk_detail", method=RequestMethod.POST)
	public String gyoyuk_detail(SearchVo searchVo, ModelMap modelMap) {
		searchVo.setBoard_gbn(board_gyoyuk);
		
		modelMap.put("pre_board_id", keomuService.pre_board_id(searchVo));
		modelMap.put("next_board_id", keomuService.next_board_id(searchVo));
		
		keomuService.addHitCnt(searchVo);
		modelMap.putAll(keomuService.gongji_detail(searchVo));
		return "/user/keomu_gyoyuk_detail";
	}
	//e:교육공지

	//s:온라인
	@RequestMapping(value = "/user/keomu_online", method=RequestMethod.GET)
    public String onlineList(SearchVo searchVo, ModelMap modelMap, HttpSession session) {
		String in_user = (String)session.getAttribute("USER_ID") == null?"":(String)session.getAttribute("USER_ID");
		searchVo.setIn_user(in_user);
		
		int maxRows = searchVo.getMaxRows();
		if(maxRows == 0) searchVo.setMaxRows(40);
		searchVo.setBoard_gbn(board_online);
		modelMap.putAll(keomuService.onlineList(searchVo));
        return "/user/keomu_online";
    }
	@RequestMapping(value = "/user/keomu_online_detail", method=RequestMethod.POST)
	public String online_detail(SearchVo searchVo, ModelMap modelMap, HttpSession session) {
		searchVo.setIn_user((String)session.getAttribute("USER_ID"));
		searchVo.setBoard_gbn(board_online);
		keomuService.addHitCnt(searchVo);
		modelMap.putAll(keomuService.online_detail(searchVo));
		return "/user/keomu_online_detail";
	}
	@RequestMapping(value = "/user/keomu_online_inUpForm", method=RequestMethod.POST)
	public String online_inUpForm(SearchVo searchVo, ModelMap modelMap) {

		//등록폼
		if(searchVo.getBoard_id() == null || searchVo.getBoard_id() ==""){
			return "/user/keomu_online_inUpForm";
		}
		
		searchVo.setBoard_gbn(board_online);
		modelMap.putAll(keomuService.online_detail(searchVo));
		return "/user/keomu_online_inUpForm";
	}
	@RequestMapping(value = "/user/keomu_online_insert", method=RequestMethod.POST)
	public void online_insert(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		BoardVo boardVo = new BoardVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(boardVo);
		binder.bind(req);
		
		boardVo.setBoard_gbn(board_online);
		boardVo.setIn_user((String)session.getAttribute("USER_ID"));
		boardVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			resultMap.put("result", keomuService.online_insert(boardVo));
			
			// 게시판 글 등록시 담당자에게 메일 전송
			EmailVo emailVo = new EmailVo();
			emailVo.setType(email_type_board);
			List<EmailVo> emailList = new ArrayList<EmailVo>();
			emailList = adminEmailService.emailList(emailVo);
			
			String contentsInfo = "ID:"+(String)session.getAttribute("USER_ID") +"\n";
			//실제 메일 발송
			for(int i=0; i<emailList.size(); i++){
				mailService.sendMail(adminMailAddress, emailList.get(i).getEmail(), "[도원예일]온라인상담 글등록",  contentsInfo + boardVo.getBoard_title());
			}
			
			
		} catch (Exception e) {
			logger.info("online_insert_Exception:"+ e);
		}
		
		
		
		getResultJsonPW(resultMap, res);
		
	}
	@RequestMapping(value = "/user/keomu_online_update", method=RequestMethod.POST)
	public void online_update(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		BoardVo boardVo = new BoardVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(boardVo);
		binder.bind(req);
		
		boardVo.setIn_user((String)session.getAttribute("USER_ID"));
		boardVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", keomuService.online_update(boardVo));
		
		getResultJsonPW(resultMap, res);
		
	}
	@RequestMapping(value = "/user/keomu_online_delete", method=RequestMethod.POST)
	public void online_delete(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		BoardVo boardVo = new BoardVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(boardVo);
		binder.bind(req);
		
		boardVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", keomuService.online_delete(boardVo));
		
		getResultJsonPW(resultMap, res);
		
	}
	//e:온라인
	
	//s:자유게시판
	@RequestMapping(value = "/user/keomu_jayu", method=RequestMethod.GET)
    public String jayuList(SearchVo searchVo, ModelMap modelMap) {
		int maxRows = searchVo.getMaxRows();
		if(maxRows == 0) searchVo.setMaxRows(40);
		searchVo.setBoard_gbn(board_jayu);
		modelMap.putAll(keomuService.jayuList(searchVo));
        return "/user/keomu_jayu";
    }
	@RequestMapping(value = "/user/keomu_jayu_detail", method=RequestMethod.POST)
	public String jayu_detail(SearchVo searchVo, ModelMap modelMap) {
		searchVo.setBoard_gbn(board_jayu);
		
		modelMap.put("pre_board_id", keomuService.pre_board_id(searchVo));
		modelMap.put("next_board_id", keomuService.next_board_id(searchVo));
		
		keomuService.addHitCnt(searchVo);
		modelMap.putAll(keomuService.jayu_detail(searchVo));
		return "/user/keomu_jayu_detail";
	}
	@RequestMapping(value = "/user/keomu_jayu_inUpForm", method=RequestMethod.POST)
	public String jayu_inUpForm(SearchVo searchVo, ModelMap modelMap) {

		//등록폼
		if(searchVo.getBoard_id() == null || searchVo.getBoard_id() ==""){
			return "/user/keomu_jayu_inUpForm";
		}
		
		searchVo.setBoard_gbn(board_jayu);
		modelMap.putAll(keomuService.jayu_detail(searchVo));
		return "/user/keomu_jayu_inUpForm";
	}
	@RequestMapping(value = "/user/keomu_jayu_insert", method=RequestMethod.POST)
	public void jayu_insert(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		BoardVo boardVo = new BoardVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(boardVo);
		binder.bind(req);
		
		boardVo.setBoard_gbn(board_jayu);
		boardVo.setIn_user((String)session.getAttribute("USER_ID"));
		boardVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			
			resultMap.put("result", keomuService.jayu_insert(boardVo));
			
			// 게시판 글 등록시 담당자에게 메일 전송
			EmailVo emailVo = new EmailVo();
			emailVo.setType(email_type_board);
			List<EmailVo> emailList = new ArrayList<EmailVo>();
			emailList = adminEmailService.emailList(emailVo);
			String contentsInfo = "ID:"+(String)session.getAttribute("USER_ID") +"\n";
			//실제 메일 발송
			for(int i=0; i<emailList.size(); i++){
				mailService.sendMail(adminMailAddress, emailList.get(i).getEmail(), "[도원예일]자유게시판 글등록", contentsInfo + boardVo.getBoard_title());
			}
			
		} catch (Exception e) {
			logger.info("jayu_insert_Exception:"+ e);
		}
		
		
		getResultJsonPW(resultMap, res);
		
	}
	@RequestMapping(value = "/user/keomu_jayu_update", method=RequestMethod.POST)
	public void jayu_update(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		BoardVo boardVo = new BoardVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(boardVo);
		binder.bind(req);
		
		boardVo.setIn_user((String)session.getAttribute("USER_ID"));
		boardVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", keomuService.jayu_update(boardVo));
		
		getResultJsonPW(resultMap, res);
		
	}
	@RequestMapping(value = "/user/keomu_jayu_delete", method=RequestMethod.POST)
	public void jayu_delete(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		BoardVo boardVo = new BoardVo();
		ServletRequestDataBinder binder = new ServletRequestDataBinder(boardVo);
		binder.bind(req);
		
		boardVo.setUp_user((String)session.getAttribute("USER_ID"));
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", keomuService.jayu_delete(boardVo));
		
		getResultJsonPW(resultMap, res);
		
	}
	
	
	//e:자유게시판
	
	
	@RequestMapping(value = "/user/keomu_gwanryeon", method=RequestMethod.GET)
	public String keomu_gwanryeon() {
		return "/user/keomu_gwanryeon";
	}
}
