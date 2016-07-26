package admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.service.AdminLogService;
import common.controller.BaseController;
import common.controller.CommonUtil;
import common.vo.LogVo;
import common.vo.SearchVo;


@Controller
public class AdminLogController extends BaseController{
	
	private static final Logger logger = LoggerFactory.getLogger(AdminLogController.class);
	
	@Autowired
	private AdminLogService adminLogService;
	
	@Value("#{config['NOLOGIP']}") String noLogIp;
	
	/**
	 * 리스트
	 * @param searchVo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/admin/logList")
    public String logList(SearchVo searchVo, ModelMap modelMap) {
		int maxRows = searchVo.getMaxRows();
		if(maxRows == 0) searchVo.setMaxRows(100);

		String nowDate = CommonUtil.getNowDate();
		if(searchVo.getFromDate() == null){ searchVo.setFromDate(nowDate); }
		if(searchVo.getToDate() == null){ searchVo.setToDate(nowDate); }
		
		int fromYear = Integer.parseInt(searchVo.getFromDate().substring(0, 4));
		int toYear = Integer.parseInt(searchVo.getToDate().substring(0, 4));
		
		int totalCnt = 0;
		List<LogVo> resultList = new ArrayList<LogVo>();
		for(int i = fromYear; i <= toYear; i++){
			searchVo.setSearchYear(Integer.toString(i));
			totalCnt += adminLogService.logList_totalCnt(searchVo);
			resultList.addAll(adminLogService.logList(searchVo));
			logger.debug("totalCnt:"+totalCnt);
		}
		
		modelMap.put("searchVo", searchVo);
		modelMap.put("totalCnt", totalCnt);
		modelMap.put("resultList", resultList);
		
        return "/admin/logList";
    }
	@RequestMapping(value = "/admin/logListExcel")
	public String logListExcel(SearchVo searchVo, ModelMap modelMap) {
		modelMap.putAll(adminLogService.logListExcel(searchVo));
		return "/admin/logListExcel";
	}

	/**
	 * 모든 ULR에서 로그 적재하기
	 * @param req
	 * @param res
	 * @param session
	 * @throws Exception 
	 * @throws IOException
	 */
	public void logInsert(HttpServletRequest req, HttpServletResponse res, HttpSession session){
		
		LogVo logVo = new LogVo();
		LogVo reqLogVo = new LogVo();
		reqLogVo = (LogVo) req.getAttribute("logVo");
		
		try {
			
			String nowYear = CommonUtil.getNowYear();
			String clientIp = CommonUtil.getIpAddress(req);
			String userAgent = req.getHeader("user-agent").toLowerCase();
			String device_gbn = CommonUtil.getUserBrowser(req);
			String userId = (String)session.getAttribute("USER_ID");
			
			// 로그 쌓지 않는 아이피 
			String noLogIps[] = noLogIp.split(",");
			for(int i=0; i<noLogIps.length; i++){
				if(clientIp.startsWith(noLogIps[i].trim())){
					logger.info("noLogIps:"+noLogIps[i].trim());
					return;
				}
			}
			
			logVo.setIn_ip(clientIp);
			logVo.setNowYear(nowYear);
			logVo.setIn_user(userId);
			logVo.setLog_url(reqLogVo.getLog_url());
			logVo.setMobile_yn("N");
			logVo.setDevice_gbn(device_gbn);
			
	//		System.out.println("In_user:"+logVo.getIn_user());
	//		System.out.println("userAgent"+userAgent);
			
			String[] browser = {"iphone", "ipod","android"};
			for (int i = 0; i < browser.length; i++) {
				if(userAgent.matches(".*"+browser[i]+".*")){
					logVo.setMobile_yn("Y");
					break;
				}
			}
	
			adminLogService.logInsert(logVo);
		} catch (Exception e) {
			logger.info("logInsert_Exception:"+ e);
		}
	}
	
	/**
	 * 차트 생성
	 * @param searchVo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/admin/logAllGraph")
    public String logAllGraph(SearchVo searchVo, ModelMap modelMap) {

		String nowYear = CommonUtil.getNowYear();
		
		if(searchVo.getFromYear() == null){ searchVo.setFromYear("2016"); }
		if(searchVo.getToYear() == null){ searchVo.setToYear(nowYear); }
		
		int fromYear = Integer.parseInt(searchVo.getFromYear());
		int toYear = Integer.parseInt(searchVo.getToYear());
		
		// 조회기간 배열에 넣기
		List<String> logTermList = new ArrayList<String>();
		for(int i = fromYear; i <= toYear; i++){
			logTermList.add(Integer.toString(i));
		}
		searchVo.setLogTerm(logTermList);
		
		
		String[] menu_name = { "/user/", "/admin/"}; 
		
		try {
			
			// 누적 방문자
			for(int j=0; j<menu_name.length; j++){
				SearchVo searchVo1 = new SearchVo();
				searchVo1 = searchVo;
				searchVo1.setSearch_value(menu_name[j]);
				List<LogVo> resultList_logVisitor = new ArrayList<LogVo>();
				for(int i = fromYear; i <= toYear; i++){
					searchVo1.setSearchYear(Integer.toString(i));
					resultList_logVisitor.add(adminLogService.logVisitor(searchVo1));
				}
				modelMap.put("resultList_logVisitor_"+j, resultList_logVisitor);
			}
			
			// 메뉴별 방문자 logVisitorUrl
			SearchVo searchVo2 = new SearchVo();
			searchVo2 = searchVo;
			
			searchVo2.setSearch_value(menu_name[0]);
			List<LogVo> resultList_logVisitorUrl_front = new ArrayList<LogVo>();
			resultList_logVisitorUrl_front.addAll(adminLogService.logVisitorUrl(searchVo2));
			modelMap.put("resultList_logVisitorUrl_front", resultList_logVisitorUrl_front);
			
			searchVo2.setSearch_value(menu_name[1]);
			List<LogVo> resultList_logVisitorUrl_admin = new ArrayList<LogVo>();
			resultList_logVisitorUrl_admin.addAll(adminLogService.logVisitorUrl(searchVo2));
			modelMap.put("resultList_logVisitorUrl_admin", resultList_logVisitorUrl_admin);
			// 메뉴별 방문자 logVisitorUrl
			
			// 회원가입 경로
			List<LogVo> resultList_join_gbn = new ArrayList<LogVo>();
			resultList_join_gbn.addAll(adminLogService.join_gbn(searchVo));
			modelMap.put("resultList_join_gbn", resultList_join_gbn);
			
			// 브라우저구분
			List<LogVo> resultList_logBrowser_gbn = new ArrayList<LogVo>();
			resultList_logBrowser_gbn.addAll(adminLogService.logBrowser_gbn(searchVo));
			modelMap.put("resultList_logBrowser_gbn", resultList_logBrowser_gbn);
			
			// 모바일구분
			List<LogVo> resultList_logMobine_gbn = new ArrayList<LogVo>();
			resultList_logMobine_gbn.addAll(adminLogService.logMobine_gbn(searchVo));
			modelMap.put("resultList_logMobine_gbn", resultList_logMobine_gbn);
			
			
			modelMap.put("searchVo", searchVo);
			modelMap.put("nowYear", nowYear);
		
		} catch (Exception e) {
			logger.info("logAllGraph_Exception:"+ e);
		}
		
			
        return "/admin/logAllGraph";
    }
	
	/**
	 * 월간차트
	 * @param searchVo
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/admin/logMonthGraph")
    public String logMonthGraph(SearchVo searchVo, ModelMap modelMap) {

		String nowYear = CommonUtil.getNowYear();
		
		searchVo.setFromYear("2016");
		searchVo.setToYear(nowYear);
		if(searchVo.getSearchYear() == null){ searchVo.setSearchYear(nowYear); }
		
		// 조회기간 배열에 넣기
		List<String> logTermList = new ArrayList<String>();
		logTermList.add(searchVo.getSearchYear());
		searchVo.setLogTerm(logTermList);
		
		String[] menu_name = { "/user/", "/admin/"}; 
		
		try {
			
			// 월별 누적 방문자
			for(int j=0; j<menu_name.length; j++){
				SearchVo searchVo1 = new SearchVo();
				searchVo1 = searchVo;
				searchVo1.setSearch_value(menu_name[j]);
				List<LogVo> resultList_logVisitor = new ArrayList<LogVo>();
				resultList_logVisitor.addAll(adminLogService.logVisitor_Month(searchVo1));
				modelMap.put("resultList_logVisitor_"+j, resultList_logVisitor);
			}
			
			// 메뉴별 방문자 logVisitorUrl
			SearchVo searchVo2 = new SearchVo();
			searchVo2.setLogTerm(searchVo.getLogTerm());
			searchVo2.setSearch_value(menu_name[0]);
			List<LogVo> resultList_logVisitorUrl_front = new ArrayList<LogVo>();
			resultList_logVisitorUrl_front.addAll(adminLogService.logVisitorUrl(searchVo2));
			modelMap.put("resultList_logVisitorUrl_front", resultList_logVisitorUrl_front);
			
			searchVo2.setSearch_value(menu_name[1]);
			List<LogVo> resultList_logVisitorUrl_admin = new ArrayList<LogVo>();
			resultList_logVisitorUrl_admin.addAll(adminLogService.logVisitorUrl(searchVo2));
			modelMap.put("resultList_logVisitorUrl_admin", resultList_logVisitorUrl_admin);
			// 메뉴별 방문자 logVisitorUrl
			
			// 회원가입 경로
			SearchVo searchVo3 = new SearchVo();
			searchVo3.setFromYear(searchVo.getSearchYear());
			searchVo3.setToYear(searchVo.getSearchYear());
			List<LogVo> resultList_join_gbn = new ArrayList<LogVo>();
			resultList_join_gbn.addAll(adminLogService.join_gbn(searchVo3));
			modelMap.put("resultList_join_gbn", resultList_join_gbn);
			
			// 브라우저구분
			List<LogVo> resultList_logBrowser_gbn = new ArrayList<LogVo>();
			resultList_logBrowser_gbn.addAll(adminLogService.logBrowser_gbn(searchVo));
			modelMap.put("resultList_logBrowser_gbn", resultList_logBrowser_gbn);
			
			// 모바일구분
			List<LogVo> resultList_logMobine_gbn = new ArrayList<LogVo>();
			resultList_logMobine_gbn.addAll(adminLogService.logMobine_gbn(searchVo));
			modelMap.put("resultList_logMobine_gbn", resultList_logMobine_gbn);
			
			
			modelMap.put("searchVo", searchVo);
			modelMap.put("nowYear", nowYear);
		
		} catch (Exception e) {
			logger.info("logMonthGraph_Exception:"+ e);
		}
			
        return "/admin/logMonthGraph";
    }
	
	
}
