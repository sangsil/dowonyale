package admin.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import common.vo.LogVo;
import common.vo.SearchVo;

public interface AdminLogService {
	
	public List<LogVo> logList(SearchVo searchVo);
	public Integer logList_allCnt(SearchVo searchVo);
	public Integer logList_totalCnt(SearchVo searchVo);
	public ModelMap logListExcel(SearchVo searchVo);
	public Integer logInsert(LogVo logVo);
	
	// 연간차트
	public LogVo logVisitor(SearchVo searchVo);
	public List<LogVo> logVisitorUrl(SearchVo searchVo);
	public List<LogVo> join_gbn(SearchVo searchVo);
	public List<LogVo> logBrowser_gbn(SearchVo searchVo);
	public List<LogVo> logMobine_gbn(SearchVo searchVo);
	
	public List<LogVo> logVisitor_Month(SearchVo searchVo);
	
}
